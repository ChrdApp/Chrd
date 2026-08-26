import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_list_image_widget.dart';
import '/components/invite_user_widget.dart';
import '/components/no_data_found_widget.dart';
import '/components/notification_icon_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_icon_with_text/c_h_r_d_icon_with_text_widget.dart';
import '/musician/musician_components/musician_nav_bar/musician_nav_bar_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'discover_widget.dart' show DiscoverWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DiscoverModel extends FlutterFlowModel<DiscoverWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Send Gig Invite)] action in Button widget.
  ApiCallResponse? sendInvite;
  // Stores action output result for [Backend Call - API (Create Gig Invite)] action in Button widget.
  ApiCallResponse? createGigInvite;
  // Model for musicianNavBar component.
  late MusicianNavBarModel musicianNavBarModel;

  @override
  void initState(BuildContext context) {
    musicianNavBarModel = createModel(context, () => MusicianNavBarModel());
  }

  @override
  void dispose() {
    musicianNavBarModel.dispose();
  }
}
