import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/venue/venue_pages/venue_components/delete_dialog_menu_options/delete_dialog_menu_options_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'venues_profile_view_widget.dart' show VenuesProfileViewWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VenuesProfileViewModel extends FlutterFlowModel<VenuesProfileViewWidget> {
  ///  Local state fields for this page.

  bool showMenuIcon = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in venuesProfileView widget.
  List<VenueOpenSlotsRow>? venueOpenSlotOutput;
  // Stores action output result for [Backend Call - API (Delete Venue and Return URL)] action in IconButton widget.
  ApiCallResponse? venueDeleteOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
