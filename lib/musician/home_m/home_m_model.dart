import '/auth/base_auth_user_provider.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_list_image_widget.dart';
import '/components/no_data_found_widget.dart';
import '/components/notification_icon_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/musician_components/musician_nav_bar/musician_nav_bar_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'home_m_widget.dart' show HomeMWidget;
import 'package:branchio_dynamic_linking_akp5u6/custom_code/actions/index.dart'
    as branchio_dynamic_linking_akp5u6_actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeMModel extends FlutterFlowModel<HomeMWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in homeM widget.
  List<UsersRow>? userResponse;
  // Stores action output result for [Backend Call - API (Get Musician Offer Count)] action in homeM widget.
  ApiCallResponse? offerCountOutput;
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
