import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/components/empty_list_image_widget.dart';
import '/components/venue_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/venue/venue_pages/venue_components/c_h_r_d_venue_planner/c_h_r_d_venue_planner_widget.dart';
import '/venue/venue_pages/venue_components/calendar_filter/calendar_filter_widget.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'venue_planner_widget.dart' show VenuePlannerWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VenuePlannerModel extends FlutterFlowModel<VenuePlannerWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
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
