import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/venue_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/venue/venue_pages/venue_components/c_h_r_d_venues/c_h_r_d_venues_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/index.dart';
import 'venues_widget.dart' show VenuesWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VenuesModel extends FlutterFlowModel<VenuesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Get User Venues)] action in TextField widget.
  ApiCallResponse? apiResultctt;
  // Model for venueNavBar component.
  late VenueNavBarModel venueNavBarModel;

  @override
  void initState(BuildContext context) {
    venueNavBarModel = createModel(context, () => VenueNavBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    venueNavBarModel.dispose();
  }
}
