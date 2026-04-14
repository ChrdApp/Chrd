import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'custom_chat_venue_widget.dart' show CustomChatVenueWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomChatVenueModel extends FlutterFlowModel<CustomChatVenueWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in customChatVenue widget.
  List<GigThreadsRow>? threadOutput;
  // Stores action output result for [Backend Call - Query Rows] action in customChatVenue widget.
  List<VenueOpenSlotsRow>? acceptRejectGigOutput;
  // Stores action output result for [Backend Call - API (Send Notification)] action in GigChatThread widget.
  ApiCallResponse? notificationPerformer;
  // Stores action output result for [Backend Call - API (Send Notification)] action in GigChatThread widget.
  ApiCallResponse? notificationVenue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
