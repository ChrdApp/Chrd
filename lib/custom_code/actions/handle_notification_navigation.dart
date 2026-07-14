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

import 'index.dart'; // Imports other custom actions

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import '../../venue/venue_pages/custom_chat_venue/custom_chat_venue_widget.dart';
import 'package:chrd/musician/musician_messages/musician_messages_widget.dart';
import 'package:chrd/venue/venue_pages/select_talent/select_talent_widget.dart';
import 'package:chrd/venue/venue_pages/venue_gig_thread_overlay/venue_gig_thread_overlay_widget.dart';

import 'index.dart';
import 'dart:convert';
import 'package:onesignal_flutter/onesignal_flutter.dart';

bool _listenerRegistered = false;

Future handleNotificationNavigation(
  BuildContext context,
  NotificationRow? notification,
) async {
  if (notification == null) return;

  final String? type = notification.type;
  if (type == null) return;

  // Parse data jsonb field — handle nested data.data structure
  Map<String, dynamic> data = {};
  if (notification.data != null) {
    try {
      final raw = notification.data;
      if (raw is Map<String, dynamic>) {
        if (raw.containsKey('data') && raw['data'] is Map) {
          data = Map<String, dynamic>.from(raw['data'] as Map);
        } else {
          data = raw;
        }
      } else if (raw is String) {
        final decoded = jsonDecode(raw.toString());
        if (decoded is Map<String, dynamic> &&
            decoded.containsKey('data') &&
            decoded['data'] is Map) {
          data = Map<String, dynamic>.from(decoded['data'] as Map);
        } else {
          data = Map<String, dynamic>.from(decoded as Map);
        }
      }
    } catch (_) {}
  }

  // Extract fields from data
  final int threadId = int.tryParse(data["thread_id"]?.toString() ?? "") ?? 0;
  final bool isVenue = (data["is_venue"]?.toString() == "true") ||
      (data["isVenue"]?.toString() == "true");

  if (threadId == 0) return;

  // All types navigate to Custom Chat with threadId and isVenue
  if (type == 'PerformerApplied' ||
      type == 'PerformerAccepted' ||
      type == 'PerformerDeclined' ||
      type == 'PerformerBackedout' ||
      type == 'PerformerInvited' ||
      type == 'PerformerMessaged' ||
      type == 'VenueMessaged' ||
      type == 'VenueCancelled') {
    context.pushNamed(
      CustomChatVenueWidget.routeName,
      queryParameters: {
        'threadId': serializeParam(threadId, ParamType.int),
        'isVenue': serializeParam(isVenue, ParamType.bool),
      }.withoutNulls,
    );
  }
}
