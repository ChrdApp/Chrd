// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';

RealtimeChannel? _notificationChannel;

Future<void> listenForNewBannerNotifications(BuildContext context) async {
  // Cancel existing subscription if any
  if (_notificationChannel != null) {
    await _notificationChannel?.unsubscribe();
  }

  final currentUserId = SupaFlow.client.auth.currentUser?.id;
  if (currentUserId == null) return;

  // Get the app-level user id (int) from your users table
  int? appUserId;
  try {
    final userRow = await SupaFlow.client
        .from('users')
        .select('id')
        .eq('auth_id', currentUserId)
        .maybeSingle();
    appUserId = userRow?['id'] as int?;
  } catch (_) {
    return;
  }

  if (appUserId == null) return;

  final channelName =
      'notification_banner_${DateTime.now().millisecondsSinceEpoch}';

  _notificationChannel = SupaFlow.client
      .channel(channelName)
      .onPostgresChanges(
        event: PostgresChangeEvent.insert,
        schema: 'public',
        table: 'notification',
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'user_id',
          value: appUserId,
        ),
        callback: (payload) {
          final newRecord = payload.newRecord;

          NotificationRow? notifRow;
          try {
            notifRow = NotificationRow(newRecord);
          } catch (_) {}

          final title = newRecord['title'] as String? ?? 'Notification';
          final description = newRecord['description'] as String? ?? '';

          _showBannerNotification(
            context: context,
            title: title,
            description: description,
            notifRow: notifRow,
          );
        },
      )
      .subscribe();
}

// ═══════════════════════════════════════════════════════════════
// BANNER OVERLAY - WhatsApp style, top of screen, swipe to dismiss
// ═══════════════════════════════════════════════════════════════

void _showBannerNotification({
  required BuildContext context,
  required String title,
  required String description,
  required NotificationRow? notifRow,
}) {
  final OverlayState? overlay = Overlay.maybeOf(context);
  if (overlay == null) return;

  late OverlayEntry entry;
  Timer? dismissTimer;
  bool removed = false;

  void removeEntry() {
    if (removed) return;
    removed = true;
    dismissTimer?.cancel();
    if (entry.mounted) {
      entry.remove();
    }
  }

  entry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top + 8,
      left: 12,
      right: 12,
      child: Material(
        color: Colors.transparent,
        child: _BannerCard(
          title: title,
          description: description,
          onDismissed: removeEntry,
          onTap: () async {
            removeEntry();
            try {
              await handleNotificationNavigation(context, notifRow);
            } catch (_) {}
          },
        ),
      ),
    ),
  );

  overlay.insert(entry);

  // Auto-dismiss after 5 seconds
  dismissTimer = Timer(const Duration(seconds: 5), removeEntry);
}

// ═══════════════════════════════════════════════════════════════
// BANNER CARD - Animated slide-in from top, swipe horizontally or up to dismiss
// ═══════════════════════════════════════════════════════════════

class _BannerCard extends StatefulWidget {
  final String title;
  final String description;
  final VoidCallback onTap;
  final VoidCallback onDismissed;

  const _BannerCard({
    required this.title,
    required this.description,
    required this.onTap,
    required this.onDismissed,
  });

  @override
  State<_BannerCard> createState() => _BannerCardState();
}

class _BannerCardState extends State<_BannerCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnim;
  late Animation<double> _fadeAnim;

  // Drag state
  Offset _dragOffset = Offset.zero;
  double _dragOpacity = 1.0;

  static const double _horizontalDismissThreshold = 100.0;
  static const double _verticalDismissThreshold = 40.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, -1.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _fadeAnim = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      // Allow horizontal drag freely; only allow upward vertical drag
      final newDy = (_dragOffset.dy + details.delta.dy).clamp(-200.0, 0.0);
      _dragOffset = Offset(
        _dragOffset.dx + details.delta.dx,
        newDy,
      );
      // Fade based on horizontal distance
      final distance = _dragOffset.dx.abs();
      _dragOpacity = (1.0 - (distance / 250.0)).clamp(0.0, 1.0);
    });
  }

  void _onPanEnd(DragEndDetails details) {
    final velocity = details.velocity.pixelsPerSecond;

    final shouldDismissHorizontally =
        _dragOffset.dx.abs() > _horizontalDismissThreshold ||
            velocity.dx.abs() > 800;
    final shouldDismissVertically =
        _dragOffset.dy < -_verticalDismissThreshold || velocity.dy < -500;

    if (shouldDismissHorizontally || shouldDismissVertically) {
      widget.onDismissed();
    } else {
      // Snap back
      setState(() {
        _dragOffset = Offset.zero;
        _dragOpacity = 1.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnim,
      child: FadeTransition(
        opacity: _fadeAnim,
        child: Transform.translate(
          offset: _dragOffset,
          child: Opacity(
            opacity: _dragOpacity,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: widget.onTap,
              onPanUpdate: _onPanUpdate,
              onPanEnd: _onPanEnd,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1E),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.08),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // App icon with gradient border
                    Container(
                      width: 44,
                      height: 44,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF01CDD0),
                            Color(0xFF8D28E3),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF1C1C1E),
                          ),
                          child: const Center(
                            child: Text(
                              'chrd',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Title + description
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.description,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.75),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 1.3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
