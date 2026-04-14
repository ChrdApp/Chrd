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

import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/backend/api_requests/api_calls.dart';

class GigChatThread extends StatefulWidget {
  const GigChatThread({
    super.key,
    this.width,
    this.height,
    required this.musicianName,
    required this.musicianCategory,
    required this.musicianAvatar,
    required this.venueName,
    required this.gigStatus,
    required this.gigDate,
    required this.slotType,
    required this.threadId,
    required this.currentUserId,
    required this.isVenue,
    this.onSendBtnClicked,
    this.viewOtherGigAction,
    this.showGigDetailAction,
    this.viewProfileAction,
    this.msgClickAction,
    this.onDeleteAction,
  });

  final double? width;
  final double? height;
  final String musicianName;
  final String musicianCategory;
  final String musicianAvatar;
  final String venueName;
  final String gigStatus;
  final String gigDate;
  final String slotType;
  final int threadId;
  final int currentUserId;
  final bool isVenue;
  final Future Function(String? value)? onSendBtnClicked;
  final Future Function()? viewOtherGigAction;
  final Future Function()? showGigDetailAction;
  final Future Function()? viewProfileAction;
  final Future Function()? msgClickAction;
  final Future Function()? onDeleteAction;

  @override
  State<GigChatThread> createState() => _GigChatThreadState();
}

class _GigChatThreadState extends State<GigChatThread>
    with WidgetsBindingObserver {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _inputFocusNode = FocusNode();

  bool _isSending = false;
  bool _isFFActionRunning = false;

  List<Map<String, dynamic>> _messages = [];
  RealtimeChannel? _messageSubscription;
  bool _isLoading = true;

  bool _isLoadingMore = false;
  bool _hasMoreMessages = true;
  final int _messagesPerPage = 30;
  String? _oldestMessageCreatedAt;
  int? _oldestMessageId;

  // Debounce for markAsRead
  Timer? _markReadDebounce;
  bool _needsMarkRead = false;

  // Track subscription status
  bool _isSubscribed = false;

  // ═══════════════════════════════════════════════════════════════
  // LOCAL STATE - Overrides widget params after refresh
  // ═══════════════════════════════════════════════════════════════
  String? _localGigStatus;
  String? _localGigDate;
  String? _localSlotType;
  String? _localVenueName;
  String? _localMusicianName;
  String? _localMusicianCategory;
  String? _localMusicianAvatar;

  String get _gigStatus => _localGigStatus ?? widget.gigStatus;
  String get _gigDate => _localGigDate ?? widget.gigDate;
  String get _slotType => _localSlotType ?? widget.slotType;
  String get _venueName => _localVenueName ?? widget.venueName;
  String get _musicianName => _localMusicianName ?? widget.musicianName;
  String get _musicianCategory =>
      _localMusicianCategory ?? widget.musicianCategory;
  String get _musicianAvatar => _localMusicianAvatar ?? widget.musicianAvatar;

  // Helpers using local getters
  bool get _isGigClosed => _gigStatus.toLowerCase() == 'close';
  bool get _isGeneralGig {
    final type = _slotType.toLowerCase();
    return type == 'general';
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _loadMessages();
    _setupRealtimeSubscription();
    _setupScrollListener();
    _markThreadAsRead();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _markReadDebounce?.cancel();
    _messageController.dispose();
    _scrollController.dispose();
    _inputFocusNode.dispose();
    _messageSubscription?.unsubscribe();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _markThreadAsRead();
      if (!_isSubscribed) {
        _setupRealtimeSubscription();
      }
      _reloadRecentMessages();
    } else if (state == AppLifecycleState.paused) {
      _markThreadAsRead();
    }
  }

  // ═══════════════════════════════════════════════════════════════
  // REFRESH THREAD DATA - Re-fetch via same API the page uses
  // ═══════════════════════════════════════════════════════════════

  Future<void> _refreshThreadData() async {
    try {
      final response = await VenueGroup.getGigThreadDetailCall.call(
        threadId: widget.threadId,
      );

      if (response.succeeded && mounted) {
        final json = response.jsonBody;

        final newStatus = VenueGroup.getGigThreadDetailCall.gigStatus(json);
        final newDate = VenueGroup.getGigThreadDetailCall.gigStartDate(json);
        final newType = VenueGroup.getGigThreadDetailCall.gigType(json);
        final newVenueName = VenueGroup.getGigThreadDetailCall.venueNane(json);
        final newMusicianName =
            VenueGroup.getGigThreadDetailCall.musicianName(json);
        final newCategories =
            VenueGroup.getGigThreadDetailCall.musicianCategories(json);

        String? newAvatar;
        if (!widget.isVenue) {
          newAvatar = VenueGroup.getGigThreadDetailCall.venuePhoto(json);
        } else {
          newAvatar = VenueGroup.getGigThreadDetailCall.musicianPhoto(json);
        }

        String? newDisplayName;
        if (!widget.isVenue) {
          newDisplayName = newVenueName;
        } else {
          newDisplayName = newMusicianName;
        }

        setState(() {
          if (newStatus != null) _localGigStatus = newStatus;
          if (newDate != null) _localGigDate = newDate;
          if (newType != null) _localSlotType = newType;
          if (newVenueName != null) _localVenueName = newVenueName;
          if (newDisplayName != null) _localMusicianName = newDisplayName;
          if (newCategories != null && newCategories.isNotEmpty) {
            _localMusicianCategory = newCategories.first;
          }
          if (newAvatar != null) _localMusicianAvatar = newAvatar;
        });
      }
    } catch (e) {
      debugPrint('❌ Error refreshing thread data: $e');
    }
  }

  // ═══════════════════════════════════════════════════════════════
  // MARK AS READ - Debounced
  // ═══════════════════════════════════════════════════════════════

  void _markThreadAsRead() {
    _needsMarkRead = true;
    _markReadDebounce?.cancel();
    _markReadDebounce = Timer(const Duration(milliseconds: 800), () {
      if (_needsMarkRead) {
        _doMarkAsRead();
      }
    });
  }

  Future<void> _doMarkAsRead() async {
    if (!_needsMarkRead) return;
    _needsMarkRead = false;
    try {
      final now = DateTime.now().toIso8601String();
      final field =
          widget.isVenue ? 'venue_last_read_at' : 'musician_last_read_at';

      await SupaFlow.client.from('gig_threads').update({
        field: now,
      }).eq('id', widget.threadId);
    } catch (e) {
      debugPrint('❌ Error marking thread as read: $e');
    }
  }

  // ═══════════════════════════════════════════════════════════════
  // SCROLL LISTENER
  // ═══════════════════════════════════════════════════════════════

  void _setupScrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels <= 200 &&
          !_isLoadingMore &&
          _hasMoreMessages) {
        _loadMoreMessages();
      }
      if (_scrollController.position.pixels > 0) {
        _markThreadAsRead();
      }
    });
  }

  // ═══════════════════════════════════════════════════════════════
  // LOAD MESSAGES
  // ═══════════════════════════════════════════════════════════════

  Future<void> _loadMessages() async {
    try {
      final response = await SupaFlow.client
          .from('thread_messages')
          .select()
          .eq('thread_id', widget.threadId)
          .order('created_at', ascending: false)
          .order('id', ascending: false)
          .limit(_messagesPerPage);

      final messages = List<Map<String, dynamic>>.from(response);

      if (mounted) {
        setState(() {
          _messages = messages.reversed.toList();
          _isLoading = false;
          _hasMoreMessages = messages.length >= _messagesPerPage;

          if (_messages.isNotEmpty) {
            _oldestMessageCreatedAt = _messages.first['created_at'] as String?;
            _oldestMessageId = _messages.first['id'] as int?;
          }
        });
        _scrollToBottom();
        _markThreadAsRead();
      }
    } catch (e) {
      debugPrint('❌ Error loading messages: $e');
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  // ═══════════════════════════════════════════════════════════════
  // RELOAD RECENT - Gap fill after app resume
  // ═══════════════════════════════════════════════════════════════

  Future<void> _reloadRecentMessages() async {
    if (_messages.isEmpty) return;

    try {
      final latestCreatedAt = _messages.last['created_at'] as String?;
      if (latestCreatedAt == null) return;

      final response = await SupaFlow.client
          .from('thread_messages')
          .select()
          .eq('thread_id', widget.threadId)
          .gt('created_at', latestCreatedAt)
          .order('created_at', ascending: true)
          .order('id', ascending: true)
          .limit(50);

      final newMessages = List<Map<String, dynamic>>.from(response);

      if (newMessages.isNotEmpty && mounted) {
        setState(() {
          for (final msg in newMessages) {
            final exists = _messages.any((m) => m['id'] == msg['id']);
            if (!exists) {
              _messages.add(msg);
            }
          }
        });
        _scrollToBottom();
      }
    } catch (e) {
      debugPrint('❌ Error reloading recent messages: $e');
    }
  }

  // ═══════════════════════════════════════════════════════════════
  // LOAD MORE - Paginated older messages
  // ═══════════════════════════════════════════════════════════════

  Future<void> _loadMoreMessages() async {
    if (_isLoadingMore ||
        !_hasMoreMessages ||
        _oldestMessageCreatedAt == null) {
      return;
    }

    setState(() => _isLoadingMore = true);

    try {
      final response = await SupaFlow.client
          .from('thread_messages')
          .select()
          .eq('thread_id', widget.threadId)
          .lt('created_at', _oldestMessageCreatedAt!)
          .order('created_at', ascending: false)
          .order('id', ascending: false)
          .limit(_messagesPerPage);

      final newMessages = List<Map<String, dynamic>>.from(response);

      if (mounted) {
        final scrollPosition = _scrollController.position.pixels;
        final scrollMax = _scrollController.position.maxScrollExtent;

        setState(() {
          if (newMessages.isNotEmpty) {
            _messages.insertAll(0, newMessages.reversed.toList());
            _oldestMessageCreatedAt = newMessages.last['created_at'] as String?;
            _oldestMessageId = newMessages.last['id'] as int?;
          }
          _hasMoreMessages = newMessages.length >= _messagesPerPage;
          _isLoadingMore = false;
        });

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
            final newScrollMax = _scrollController.position.maxScrollExtent;
            final scrollDelta = newScrollMax - scrollMax;
            _scrollController.jumpTo(scrollPosition + scrollDelta);
          }
        });
      }
    } catch (e) {
      debugPrint('❌ Error loading more messages: $e');
      if (mounted) {
        setState(() => _isLoadingMore = false);
      }
    }
  }

  // ═══════════════════════════════════════════════════════════════
  // REALTIME SUBSCRIPTION
  // ═══════════════════════════════════════════════════════════════

  void _setupRealtimeSubscription() {
    _messageSubscription?.unsubscribe();
    _isSubscribed = false;

    final channelName =
        'thread_messages_${widget.threadId}_${DateTime.now().millisecondsSinceEpoch}';

    _messageSubscription = SupaFlow.client
        .channel(channelName)
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'thread_messages',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'thread_id',
            value: widget.threadId,
          ),
          callback: (payload) {
            if (!mounted) return;

            if (payload.eventType == PostgresChangeEvent.insert &&
                payload.newRecord != null) {
              final messageId = payload.newRecord['id'];
              final exists = _messages.any((m) => m['id'] == messageId);
              if (!exists) {
                // Remove optimistic message if this is the real version
                final newContent =
                    payload.newRecord['message_content'] as String?;
                final newSenderId = payload.newRecord['sender_id'];
                if (newSenderId == widget.currentUserId) {
                  _messages.removeWhere((m) =>
                      (m['id'] is int && (m['id'] as int) < 0) &&
                      m['message_content'] == newContent);
                }

                setState(() {
                  _messages.add(payload.newRecord);
                });
                _scrollToBottom();
                _markThreadAsRead();

                // Trigger data refresh when a toast or click message arrives
                final newMsgType = payload.newRecord['message_type'] as String?;
                if (newMsgType == 'toast' || newMsgType == 'click') {
                  _refreshThreadData();
                }
              }
            } else if (payload.eventType == PostgresChangeEvent.update &&
                payload.newRecord != null) {
              final index = _messages
                  .indexWhere((m) => m['id'] == payload.newRecord['id']);
              if (index != -1) {
                setState(() {
                  _messages[index] = payload.newRecord;
                });
              }
            } else if (payload.eventType == PostgresChangeEvent.delete &&
                payload.oldRecord != null) {
              setState(() {
                _messages
                    .removeWhere((m) => m['id'] == payload.oldRecord['id']);
              });
            }
          },
        )
        .subscribe((status, error) {
      if (error != null) {
        debugPrint('⚠️ Subscription error: $error');
        _isSubscribed = false;
      }
      if (status == RealtimeSubscribeStatus.subscribed) {
        debugPrint('✅ Subscribed to realtime updates');
        _isSubscribed = true;
      }
      if (status == RealtimeSubscribeStatus.closed) {
        _isSubscribed = false;
      }
    });
  }

  // ═══════════════════════════════════════════════════════════════
  // SCROLL TO BOTTOM
  // ═══════════════════════════════════════════════════════════════

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // ═══════════════════════════════════════════════════════════════
  // SEND MESSAGE - Optimistic UI
  // ═══════════════════════════════════════════════════════════════

  Future<void> _handleSend() async {
    final messageText = _messageController.text.trim();
    if (messageText.isEmpty || _isSending || _isFFActionRunning) return;

    setState(() {
      _isSending = true;
      _isFFActionRunning = true;
    });

    _messageController.clear();

    // Optimistic insert so sender sees it instantly
    final optimisticId = -DateTime.now().millisecondsSinceEpoch;
    final optimisticMessage = {
      'id': optimisticId,
      'thread_id': widget.threadId,
      'sender_id': widget.currentUserId,
      'message_content': messageText,
      'message_type': 'text',
      'created_at': DateTime.now().toUtc().toIso8601String(),
    };

    setState(() {
      _messages.add(optimisticMessage);
    });
    _scrollToBottom();

    try {
      if (widget.onSendBtnClicked != null) {
        await widget.onSendBtnClicked!(messageText);
      }
    } catch (e) {
      debugPrint('❌ Error in send chain: $e');
      if (mounted) {
        setState(() {
          _messages.removeWhere((m) => m['id'] == optimisticId);
        });
      }
    } finally {
      if (mounted) {
        // Clean up stale optimistic msg after realtime delivers real one
        Future.delayed(const Duration(seconds: 4), () {
          if (mounted) {
            setState(() {
              _messages.removeWhere((m) => m['id'] == optimisticId);
            });
          }
        });

        setState(() {
          _isSending = false;
          _isFFActionRunning = false;
        });
      }
    }
  }

  // ═══════════════════════════════════════════════════════════════
  // BUILD
  // ═══════════════════════════════════════════════════════════════

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        color: const Color(0xFF000000),
        child: Column(
          children: [
            _buildHeader(),
            _divider(),
            _buildGigInfoBar(),
            _divider(),
            if (!_isGigClosed && !_isGeneralGig) _buildViewOtherThreads(),
            if (!_isGigClosed && !_isGeneralGig) _divider(),
            Expanded(
              child: _isLoading
                  ? _buildLoadingState()
                  : _messages.isEmpty
                      ? _buildEmptyState()
                      : _buildMessagesList(),
            ),
            _divider(),
            _isGigClosed ? _buildClosedBanner() : _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
        height: 1, color: const Color(0xFFFFFFFF).withOpacity(0.3));
  }

  // ═══════════════════════════════════════════════════════════════
  // HEADER
  // ═══════════════════════════════════════════════════════════════

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  _doMarkAsRead();
                  Navigator.pop(context);
                },
                child:
                    const Icon(Icons.arrow_back, color: Colors.white, size: 28),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 90,
                  height: 93,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF01CDD0),
                        Color(0xFF04C8D0),
                        Color(0xFF0EBCD1),
                        Color(0xFF20A7D4),
                        Color(0xFF3A89D8),
                        Color(0xFF6951DC),
                        Color(0xFF8D28E3),
                      ],
                      stops: [0.06, 0.13, 0.21, 0.29, 0.38, 0.70, 0.95],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(_musicianAvatar),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _musicianName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 2),
                Text(
                  _musicianCategory,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6), fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: widget.isVenue
                  ? GestureDetector(
                      onTap: () async {
                        if (widget.viewProfileAction != null) {
                          try {
                            await widget.viewProfileAction!();
                          } catch (e) {
                            debugPrint('❌ Error in viewProfileAction: $e');
                          }
                        }
                      },
                      child: const Text(
                        'View profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════
  // GIG INFO BAR
  // ═══════════════════════════════════════════════════════════════

  Widget _buildGigInfoBar() {
    Color containerColor;
    Color dotColor;

    final capitalizedStatus = _capitalizeWords(_gigStatus);
    final capitalizedVenue = _capitalizeWords(_venueName);
    final capitalizedSlotType = _capitalizeWords(_slotType);
    final capitalizedGigDate = _capitalizeWords(_gigDate);

    if (_gigStatus.toLowerCase() == 'open') {
      containerColor = const Color(0xFFFFB140).withOpacity(0.27);
      dotColor = const Color(0xFFFFB140);
    } else if (_gigStatus.toLowerCase() == 'booked') {
      containerColor = const Color(0xFF8D28E3).withOpacity(0.29);
      dotColor = const Color(0xFF8D28E3);
    } else if (_isGigClosed) {
      containerColor = const Color(0xFFEF4444).withOpacity(0.27);
      dotColor = const Color(0xFFEF4444);
    } else {
      containerColor = const Color(0xFFD97706).withOpacity(0.27);
      dotColor = const Color(0xFFD97706);
    }

    final bool showArrow = widget.isVenue && !_isGigClosed && !_isGeneralGig;

    final barContent = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              color: dotColor, shape: BoxShape.circle),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          capitalizedStatus,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _verticalDivider(),
                  Text(capitalizedVenue,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                  _verticalDivider(),
                  Text(capitalizedSlotType,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                  _verticalDivider(),
                  Text(capitalizedGigDate,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
          if (showArrow) ...[
            _verticalDivider(),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
          ],
        ],
      ),
    );

    if (showArrow) {
      return GestureDetector(
        onTap: () async {
          if (widget.showGigDetailAction != null) {
            try {
              await widget.showGigDetailAction!();
            } catch (e) {
              debugPrint('❌ Error in showGigDetailAction: $e');
            }
          }
        },
        child: barContent,
      );
    }

    return barContent;
  }

  Widget _verticalDivider() {
    return Container(
      height: 30,
      width: 1,
      color: const Color(0xFFFFFFFF).withOpacity(0.3),
      margin: const EdgeInsets.symmetric(horizontal: 12),
    );
  }

  // ═══════════════════════════════════════════════════════════════
  // VIEW PROPOSAL - Hidden for general gigs
  // ═══════════════════════════════════════════════════════════════

  Widget _buildViewOtherThreads() {
    return GestureDetector(
      onTap: () async {
        if (widget.viewOtherGigAction != null) {
          try {
            await widget.viewOtherGigAction!();
          } catch (e) {
            debugPrint('❌ Error in viewOtherGigAction: $e');
          }
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: const Text(
          'View proposal',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════
  // CLOSED BANNER
  // ═══════════════════════════════════════════════════════════════

  Widget _buildClosedBanner() {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        color: const Color(0xFFEF4444).withOpacity(0.12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock_outline,
                color: const Color(0xFFEF4444).withOpacity(0.8), size: 18),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                'This gig is closed. You can no longer chat here.',
                style: TextStyle(
                  color: const Color(0xFFEF4444).withOpacity(0.8),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════
  // LOADING & EMPTY
  // ═══════════════════════════════════════════════════════════════

  Widget _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.chat_bubble_outline,
              size: 64, color: Colors.white.withOpacity(0.3)),
          const SizedBox(height: 16),
          Text('No messages yet',
              style: TextStyle(
                  color: Colors.white.withOpacity(0.6), fontSize: 16)),
          const SizedBox(height: 8),
          Text('Start the conversation!',
              style: TextStyle(
                  color: Colors.white.withOpacity(0.4), fontSize: 14)),
        ],
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════
  // FORMAT HELPERS
  // ═══════════════════════════════════════════════════════════════

  String _formatTimestamp(String? createdAt) {
    if (createdAt == null) return '';
    try {
      final dateTime = DateTime.parse(createdAt);
      final hour = dateTime.hour > 12
          ? dateTime.hour - 12
          : (dateTime.hour == 0 ? 12 : dateTime.hour);
      final period = dateTime.hour >= 12 ? 'pm' : 'am';
      final minute = dateTime.minute.toString().padLeft(2, '0');
      return '$hour:$minute$period';
    } catch (e) {
      return '';
    }
  }

  String _formatDate(String? createdAt) {
    if (createdAt == null) return '';
    try {
      final dateTime = DateTime.parse(createdAt);
      const months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec'
      ];
      return '${months[dateTime.month - 1]} ${dateTime.day}${_getDaySuffix(dateTime.day)}, ${dateTime.year}';
    } catch (e) {
      return '';
    }
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) return 'th';
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  String _capitalizeWords(String text) {
    if (text.isEmpty) return text;
    return text.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

  // ═══════════════════════════════════════════════════════════════
  // PROPOSAL TEXT - Role-specific
  // ═══════════════════════════════════════════════════════════════

  String _getProposalText(String? subType) {
    final isUpdate = subType == 'update';

    if (widget.isVenue) {
      if (isUpdate) {
        return 'You made changes to the gig proposal.';
      }
      return 'You sent ${_musicianName} a gig proposal.';
    } else {
      if (isUpdate) {
        return '${_capitalizeWords(_venueName)} updated the gig proposal.';
      }
      return '${_capitalizeWords(_venueName)} sent you a gig proposal.';
    }
  }

  // ═══════════════════════════════════════════════════════════════
  // MESSAGES LIST
  // ═══════════════════════════════════════════════════════════════

  Widget _buildMessagesList() {
    return Column(
      children: [
        if (_isLoadingMore)
          Container(
            padding: const EdgeInsets.all(16),
            child: const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
          ),
        if (!_hasMoreMessages &&
            !_isLoadingMore &&
            _messages.length >= _messagesPerPage)
          Container(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Text('No more messages',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 12)),
            ),
          ),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            itemCount: _messages.length,
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: true,
            itemBuilder: (context, index) => _buildMessageItem(index),
          ),
        ),
      ],
    );
  }

  Widget _buildMessageItem(int index) {
    final message = _messages[index];
    final senderId = message['sender_id'] as int?;
    final messageType = message['message_type'] as String?;
    final subType = message['sub_type'] as String?;
    final createdAt = message['created_at'] as String?;

    final rawMessageContent = message['message_content'] as String?;
    final alternateMessage = message['alternate_message'] as String?;
    final messageContent = (!widget.isVenue &&
            alternateMessage != null &&
            alternateMessage.isNotEmpty)
        ? alternateMessage
        : rawMessageContent;

    final isMyMessage = senderId == widget.currentUserId;

    final showTimestamp = index == 0 ||
        _formatTimestamp(createdAt) !=
            _formatTimestamp(_messages[index - 1]['created_at'] as String?);

    final showDate = index == 0 ||
        _formatDate(createdAt) !=
            _formatDate(_messages[index - 1]['created_at'] as String?);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Date separator
        if (showDate)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: Text(_formatDate(createdAt),
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6), fontSize: 13)),
            ),
          ),

        // Toast messages in #39D2C0
        if (messageType == 'toast')
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Center(
              child: Text(messageContent ?? '',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 13),
                  textAlign: TextAlign.center),
            ),
          ),

        // Click messages - now also in green (#39D2C0)
        if (messageType == 'click')
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Center(
              child: GestureDetector(
                onTap: _isGigClosed
                    ? null
                    : () async {
                        if (widget.msgClickAction != null) {
                          try {
                            await widget.msgClickAction!();
                          } catch (e) {
                            debugPrint('❌ Error in msgClickAction: $e');
                          }
                        }
                      },
                child: Text(
                  messageContent ?? '',
                  style: TextStyle(
                    color: _isGigClosed
                        ? const Color(0xFF39D2C0).withOpacity(0.3)
                        : const Color(0xFF39D2C0),
                    fontSize: 13,
                    decoration: _isGigClosed
                        ? TextDecoration.none
                        : TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),

        // Proposal messages - Role-specific
        if (messageType == 'proposal')
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Center(
              child: Text(
                _getProposalText(subType),
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

        // Regular chat bubbles
        if (messageType != 'toast' &&
            messageType != 'proposal' &&
            messageType != 'click') ...[
          if (showTimestamp)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Align(
                alignment:
                    isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(_formatTimestamp(createdAt),
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.6), fontSize: 12)),
                ),
              ),
            ),
          Align(
            alignment:
                isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.75),
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isMyMessage ? Colors.white : const Color(0xFF404040),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                messageContent ?? '',
                style: TextStyle(
                  color: isMyMessage ? Colors.black : Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  // ═══════════════════════════════════════════════════════════════
  // MESSAGE INPUT - Tap outside to dismiss keyboard (iOS friendly)
  // ═══════════════════════════════════════════════════════════════

  Widget _buildMessageInput() {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1C),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: const Color(0xFFFFFFFF).withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: TextField(
                  controller: _messageController,
                  focusNode: _inputFocusNode,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Type a message...',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  maxLines: 5,
                  minLines: 1,
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: (_messageController.text.trim().isEmpty ||
                      _isSending ||
                      _isFFActionRunning)
                  ? null
                  : _handleSend,
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: (_messageController.text.trim().isEmpty ||
                          _isSending ||
                          _isFFActionRunning)
                      ? const Color(0xFF3B82F6).withOpacity(0.5)
                      : const Color(0xFF3B82F6),
                  shape: BoxShape.circle,
                ),
                child: (_isSending || _isFFActionRunning)
                    ? const Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                      )
                    : const Icon(Icons.send, color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
