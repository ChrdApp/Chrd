// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart' as functions;

import 'dart:async';
import 'package:chrd/venue/venue_pages/venue_gig_thread_overlay/venue_gig_thread_overlay_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RealTimeGigThreadList extends StatefulWidget {
  const RealTimeGigThreadList({
    super.key,
    this.width,
    this.height,
    this.venueId,
  });

  final double? width;
  final double? height;
  final int? venueId;

  @override
  State<RealTimeGigThreadList> createState() => _RealTimeGigThreadListState();
}

class _RealTimeGigThreadListState extends State<RealTimeGigThreadList> {
  List<GigsRow> _gigs = [];
  Map<int, UsersRow> _usersCache = {};
  bool _isLoading = true;
  int? _activeVenueId;
  RealtimeChannel? _subscription;
  Timer? _pollTimer;
  bool _isFetching = false;

  @override
  void initState() {
    super.initState();
    _activeVenueId = _getActiveVenueId();
    _loadEverything();
  }

  @override
  void dispose() {
    _subscription?.unsubscribe();
    _pollTimer?.cancel();
    super.dispose();
  }

  int? _getActiveVenueId() {
    try {
      final appStateId = FFAppState().selectedVenueSwitch.venueId;
      if (appStateId != null && appStateId > 0) {
        return appStateId;
      }
    } catch (_) {}
    return widget.venueId;
  }

  Future<void> _loadEverything() async {
    await _fetchGigs();
    _setupRealtime();
    _setupPolling();
  }

  String _formatMessageTime(DateTime? timestamp) {
    if (timestamp == null) return '';

    final messageTime = timestamp.toLocal();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final msgDate =
        DateTime(messageTime.year, messageTime.month, messageTime.day);
    final difference = today.difference(msgDate).inDays;

    String formatTime(DateTime time) {
      int hour = time.hour;
      int minute = time.minute;
      String period = hour >= 12 ? 'PM' : 'AM';
      hour = hour % 12;
      if (hour == 0) hour = 12;
      String minuteStr = minute.toString().padLeft(2, '0');
      return '$hour:$minuteStr $period';
    }

    String formatDate(DateTime date) {
      String month = date.month.toString().padLeft(2, '0');
      String day = date.day.toString().padLeft(2, '0');
      String year = date.year.toString().substring(2);
      return '$month/$day/$year';
    }

    const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    if (difference == 0) {
      return formatTime(messageTime);
    } else if (difference == 1) {
      return 'Yesterday';
    } else if (difference < 7) {
      return weekdays[messageTime.weekday - 1];
    } else {
      return formatDate(messageTime);
    }
  }

  Future<void> _fetchGigs() async {
    if (_isFetching) return;
    _isFetching = true;

    if (_activeVenueId == null) {
      if (mounted) {
        setState(() {
          _gigs = [];
          _isLoading = false;
        });
      }
      _isFetching = false;
      return;
    }

    try {
      final response = await SupaFlow.client
          .from('gigs')
          .select()
          .eq('venue_id', _activeVenueId!)
          .order('updated_at', ascending: false);

      final rows = List<Map<String, dynamic>>.from(response);
      final gigsList = rows.map((item) => GigsRow(item)).toList();

      final missingUserIds = <int>[];
      for (final gig in gigsList) {
        if (gig.musicianId != null &&
            !_usersCache.containsKey(gig.musicianId)) {
          missingUserIds.add(gig.musicianId!);
        }
      }

      if (missingUserIds.isNotEmpty) {
        final uniqueIds = missingUserIds.toSet().toList();
        try {
          final usersResponse = await SupaFlow.client
              .from('users')
              .select()
              .inFilter('id', uniqueIds);

          final userRows = List<Map<String, dynamic>>.from(usersResponse);
          for (final userData in userRows) {
            final userRow = UsersRow(userData);
            if (userRow.id != null) {
              _usersCache[userRow.id!] = userRow;
            }
          }
        } catch (e) {
          debugPrint('⚠️ Error batch fetching users: $e');
        }
      }

      if (mounted) {
        setState(() {
          _gigs = gigsList;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('❌ Error fetching gigs: $e');
      if (mounted) {
        setState(() {
          _gigs = [];
          _isLoading = false;
        });
      }
    } finally {
      _isFetching = false;
    }
  }

  void _setupRealtime() {
    _subscription?.unsubscribe();
    _subscription = null;

    if (_activeVenueId == null) return;

    final channelName =
        'gigs_v_${_activeVenueId}_${DateTime.now().millisecondsSinceEpoch}';

    _subscription = SupaFlow.client
        .channel(channelName)
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'gigs',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'venue_id',
            value: _activeVenueId!,
          ),
          callback: (payload) {
            if (mounted) {
              _fetchGigs();
            }
          },
        )
        .subscribe();
  }

  void _setupPolling() {
    _pollTimer?.cancel();
    _pollTimer = Timer.periodic(const Duration(seconds: 15), (_) {
      if (mounted) {
        _fetchGigs();
      }
    });
  }

  void _switchToVenue(int? newVenueId) {
    _subscription?.unsubscribe();
    _subscription = null;
    _pollTimer?.cancel();
    _pollTimer = null;

    _activeVenueId = newVenueId;
    _gigs = [];
    _isLoading = true;

    _loadEverything();
  }

  bool _isUnread(GigsRow gig) {
    return gig.hasAnyThreadMessageUnread == true;
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    final currentVenueId = _getActiveVenueId();
    if (currentVenueId != _activeVenueId) {
      _switchToVenue(currentVenueId);

      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            FlutterFlowTheme.of(context).primary,
          ),
        ),
      );
    }

    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            FlutterFlowTheme.of(context).primary,
          ),
        ),
      );
    }

    if (_gigs.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'Gig threads appear here once you reach out to a performer',
            style: FlutterFlowTheme.of(context).bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.fromLTRB(0, 21.0, 0, 16.0),
      scrollDirection: Axis.vertical,
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: false,
      itemCount: _gigs.length,
      separatorBuilder: (_, __) => SizedBox(height: 40.0),
      itemBuilder: (context, index) {
        final gig = _gigs[index];
        final user = _usersCache[gig.musicianId];
        final hasUnread = _isUnread(gig);
        final userImage = user?.profilePhoto ?? '';

        return InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            context.pushNamed(
              VenueGigThreadOverlayWidget.routeName,
              queryParameters: {
                'gigID': serializeParam(gig.id, ParamType.int),
                'venueName': serializeParam(
                    FFAppState().selectedVenueSwitch.venueName,
                    ParamType.String),
                'gigName': serializeParam(user?.name, ParamType.String),
                'isVenue': serializeParam(true, ParamType.bool),
                'image': serializeParam(userImage, ParamType.String),
              }.withoutNulls,
            );
          },
          child: Row(
            children: [
              Container(
                width: 45.0,
                height: 45.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF01CDD0),
                      Color(0xFF8D28E3),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image.network(
                      userImage,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Image.asset(
                        'assets/images/error_image.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 13.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user?.name ?? 'Name',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.0,
                          ),
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      gig.lastMessageContent ?? 'Say Hi!',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 13.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _formatMessageTime(gig.updatedAt),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600),
                          color: FlutterFlowTheme.of(context).primaryCyan,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.0,
                        ),
                  ),
                  SizedBox(height: 6.0),
                  if (hasUnread)
                    Container(
                      width: 10.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryCyan,
                        shape: BoxShape.circle,
                      ),
                    )
                  else
                    SizedBox(height: 10.0),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
