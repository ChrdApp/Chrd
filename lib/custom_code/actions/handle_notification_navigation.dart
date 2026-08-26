// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
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
import '../../venue/venue_pages/venue_musician_profile1/venue_musician_profile1_widget.dart';
import 'package:chrd/musician/musician_messages/musician_messages_widget.dart';
import 'package:chrd/venue/venue_pages/select_talent/select_talent_widget.dart';
import 'package:chrd/venue/venue_pages/venue_gig_thread_overlay/venue_gig_thread_overlay_widget.dart';

import 'dart:convert';

Future handleNotificationNavigation(
  BuildContext context,
  NotificationRow? notification,
) async {
  if (notification == null) {
    debugPrint("❌ notification is null");
    return;
  }

  final String? type = notification.type;
  if (type == null) {
    debugPrint("❌ notification.type is null");
    return;
  }

  // ---- Parse the jsonb `data` column. Supabase may hand it back as a Map
  // (usually Map<dynamic, dynamic>, NOT Map<String, dynamic>) or as a String.
  Map<String, dynamic> data = {};
  final raw = notification.data;

  if (raw is Map) {
    raw.forEach((k, v) => data[k.toString()] = v);
  } else if (raw is String && raw.isNotEmpty) {
    try {
      final decoded = jsonDecode(raw as String);
      if (decoded is Map) {
        decoded.forEach((k, v) => data[k.toString()] = v);
      }
    } catch (e) {
      debugPrint("❌ failed to decode data: $e");
    }
  }

  // Some payloads nest everything one level deeper under "data".
  if (data["data"] is Map) {
    (data["data"] as Map).forEach((k, v) => data[k.toString()] = v);
  } else if (data["data"] is String) {
    try {
      final inner = jsonDecode(data["data"] as String);
      if (inner is Map) {
        inner.forEach((k, v) => data[k.toString()] = v);
      }
    } catch (_) {}
  }

  final int threadId = int.tryParse(data["thread_id"]?.toString() ?? "") ?? 0;
  final int musicianId =
      int.tryParse(data["musician_id"]?.toString() ?? "") ?? 0;
  final int venueId = int.tryParse(data["venue_id"]?.toString() ?? "") ?? 0;

  // Is the OTHER party a venue. Decides which profile a tap should open:
  //   isVenue ? venue_id : musician_id
  final bool isVenue = (data["is_venue"]?.toString().toLowerCase() == "true") ||
      (data["isVenue"]?.toString().toLowerCase() == "true");

  // Which side am I viewing as. NOT the same question as isVenue -- on an
  // invite notification the two are always opposites, and the chat screen
  // wants this one. Feeding it isVenue opened the chat in venue mode for a
  // musician: their own name as the counterparty, their messages on the
  // wrong side.
  //
  // Payload key first, because a push tap carries only data{} and never the
  // usertype column. usertype second, because it is correct on every row ever
  // written, including ones from before recipient_is_venue existed.
  final String? rv = data["recipient_is_venue"]?.toString().toLowerCase();
  final bool viewerIsVenue = (rv == "true" || rv == "false")
      ? rv == "true"
      : (notification.usertype?.toLowerCase() == "venue");

  debugPrint("🔔 type: $type | thread: $threadId | musician: $musicianId "
      "| venue: $venueId | isVenue: $isVenue | viewerIsVenue: $viewerIsVenue");

  if (!context.mounted) return;

  // ---- Invite accepted → the musician's profile -------------------------
  if (type == 'InviteAccepted') {
    if (musicianId == 0) {
      debugPrint("❌ InviteAccepted has no musician_id");
      return;
    }

    context.pushNamed(
      VenueMusicianProfile1Widget.routeName,
      queryParameters: {
        'musicianId': serializeParam(musicianId, ParamType.int),
        'venueId': serializeParam(venueId == 0 ? null : venueId, ParamType.int),
        'isDiscoverFlow': serializeParam(true, ParamType.bool),
      }.withoutNulls,
    );
    return;
  }

  // ---- Everything else → the chat thread --------------------------------
  if (type == 'PerformerApplied' ||
      type == 'PerformerAccepted' ||
      type == 'PerformerDeclined' ||
      type == 'PerformerBackedout' ||
      type == 'PerformerInvited' ||
      type == 'VenueInvited' ||
      type == 'PerformerMessaged' ||
      type == 'VenueMessaged' ||
      type == 'VenueCancelled') {
    if (threadId == 0) {
      debugPrint("❌ $type has no thread_id");
      return;
    }

    context.pushNamed(
      CustomChatVenueWidget.routeName,
      queryParameters: {
        'threadId': serializeParam(threadId, ParamType.int),
        'isVenue': serializeParam(viewerIsVenue, ParamType.bool),
      }.withoutNulls,
    );
    return;
  }

  debugPrint("⚠️ unhandled notification type: $type");
}
