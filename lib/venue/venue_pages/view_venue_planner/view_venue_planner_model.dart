import '/backend/api_requests/api_calls.dart';
import '/components/calendar_filter_widget.dart';
import '/components/empty_list_image_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/venue/venue_pages/venue_components/c_h_r_d_venue_planner/c_h_r_d_venue_planner_widget.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'view_venue_planner_widget.dart' show ViewVenuePlannerWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewVenuePlannerModel extends FlutterFlowModel<ViewVenuePlannerWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CHRD_Back_Btn component.
  late CHRDBackBtnModel cHRDBackBtnModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    cHRDBackBtnModel = createModel(context, () => CHRDBackBtnModel());
  }

  @override
  void dispose() {
    cHRDBackBtnModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
