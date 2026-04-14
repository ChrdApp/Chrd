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

import 'package:chrd/custom_chat_venue/custom_chat_venue_widget.dart';
import 'package:chrd/musician/musician_messages/musician_messages_widget.dart';
import 'package:chrd/venue/venue_pages/select_talent/select_talent_widget.dart';
import 'package:chrd/venue/venue_pages/venue_gig_thread_overlay/venue_gig_thread_overlay_widget.dart';

import 'index.dart';
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

    debugPrint("🔔 type: ${additionalData["type"]}");
    debugPrint("🔔 usertype: ${additionalData["usertype"]}");
    debugPrint("🔔 data raw: ${additionalData["data"]}");
    debugPrint("🔔 thread_id direct: ${additionalData["thread_id"]}");
    debugPrint("🔔 is_venue direct: ${additionalData["is_venue"]}");

    final String? type = additionalData["type"]?.toString();
    if (type == null) {
      debugPrint("❌ type is NULL — stopping");
      return;
    }

    // ✅ Try reading thread_id and is_venue directly from additionalData first
    int threadId =
        int.tryParse(additionalData["thread_id"]?.toString() ?? "") ?? 0;
    bool isVenue = additionalData["is_venue"]?.toString() == "true";

    // ✅ If not found directly, try parsing from nested "data" string
    if (threadId == 0 && additionalData["data"] != null) {
      try {
        final Map<String, dynamic> data =
            jsonDecode(additionalData["data"].toString());
        debugPrint("✅ Parsed nested data: $data");

        threadId = int.tryParse(data["thread_id"]?.toString() ?? "") ?? 0;
        isVenue = data["is_venue"]?.toString() == "true";
      } catch (e) {
        debugPrint("❌ Failed to parse nested data: $e");
      }
    }

    debugPrint(
        "✅ Final — type: $type | threadId: $threadId | isVenue: $isVenue");

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
  });
}
