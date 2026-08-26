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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import '../../venue/venue_pages/custom_chat_venue/custom_chat_venue_widget.dart';
import '../../venue/venue_pages/venue_musician_profile1/venue_musician_profile1_widget.dart';
import 'package:chrd/musician/musician_messages/musician_messages_widget.dart';
import 'package:chrd/venue/venue_pages/select_talent/select_talent_widget.dart';
import 'package:chrd/venue/venue_pages/venue_gig_thread_overlay/venue_gig_thread_overlay_widget.dart';

import 'dart:convert';
import 'package:onesignal_flutter/onesignal_flutter.dart';

bool _listenerRegistered = false;

Future<void> handleNotificationClick(BuildContext context) async {
  if (_listenerRegistered) return;
  _listenerRegistered = true;

  OneSignal.Notifications.addClickListener((OSNotificationClickEvent event) {
    debugPrint("🔔 RAW additionalData: ${event.notification.additionalData}");
    debugPrint(
        "🔔 RAW notification JSON: ${event.notification.jsonRepresentation()}");

    if (event.notification.additionalData == null) {
      debugPrint("❌ additionalData is NULL");
      return;
    }

    final additionalData = event.notification.additionalData!;

    // ---- Flatten: top-level keys first, then anything inside "data".
    // OneSignal sends "data" as a Map on some platforms and a JSON String on
    // others, so both shapes are handled.
    final Map<String, dynamic> p = <String, dynamic>{};
    additionalData.forEach((k, v) => p[k.toString()] = v);

    final raw = additionalData["data"];
    if (raw is Map) {
      raw.forEach((k, v) => p[k.toString()] = v);
      debugPrint("✅ nested data was a Map");
    } else if (raw is String) {
      try {
        final decoded = jsonDecode(raw);
        if (decoded is Map) {
          decoded.forEach((k, v) => p[k.toString()] = v);
          debugPrint("✅ nested data decoded from String");
        }
      } catch (e) {
        debugPrint("❌ Failed to decode nested data: $e");
      }
    }

    final String? type = p["type"]?.toString();
    if (type == null) {
      debugPrint("❌ type is NULL — stopping");
      return;
    }

    final int threadId = int.tryParse(p["thread_id"]?.toString() ?? "") ?? 0;
    final int musicianId =
        int.tryParse(p["musician_id"]?.toString() ?? "") ?? 0;
    final int venueId = int.tryParse(p["venue_id"]?.toString() ?? "") ?? 0;
    final bool isVenue = p["is_venue"]?.toString().toLowerCase() == "true";

    debugPrint("✅ Final — type: $type | threadId: $threadId | "
        "musicianId: $musicianId | venueId: $venueId | isVenue: $isVenue");

    // The context captured at registration is usually unmounted by the time a
    // tap arrives (app resumed, page disposed). Use the global navigator.
    final ctx = appNavigatorKey.currentContext;
    if (ctx == null) {
      debugPrint("❌ navigator not ready");
      return;
    }

    // ---- Invite accepted → open the musician's profile --------------------
    if (type == 'InviteAccepted') {
      if (musicianId == 0) {
        debugPrint("❌ InviteAccepted has no musician_id");
        return;
      }

      ctx.pushNamed(
        VenueMusicianProfile1Widget.routeName,
        queryParameters: {
          'musicianId': serializeParam(musicianId, ParamType.int),
          'venueId':
              serializeParam(venueId == 0 ? null : venueId, ParamType.int),
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
        type == 'PerformerMessaged' ||
        type == 'VenueInvited' ||
        type == 'VenueMessaged' ||
        type == 'VenueCancelled') {
      if (threadId == 0) {
        debugPrint("❌ $type has no thread_id — not navigating");
        return;
      }

      ctx.pushNamed(
        CustomChatVenueWidget.routeName,
        queryParameters: {
          'threadId': serializeParam(threadId, ParamType.int),
          'isVenue': serializeParam(isVenue, ParamType.bool),
        }.withoutNulls,
      );
    }
  });
}
