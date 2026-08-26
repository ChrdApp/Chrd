import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_label_skip_btn/c_h_r_d_label_skip_btn_widget.dart';
import '/musician/components/c_h_r_d_progress_bar/c_h_r_d_progress_bar_widget.dart';
import 'dart:ui';
import 'c_h_r_d_app_bar2_widget.dart' show CHRDAppBar2Widget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CHRDAppBar2Model extends FlutterFlowModel<CHRDAppBar2Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for CHRD_Back_Btn component.
  late CHRDBackBtnModel cHRDBackBtnModel;
  // Model for CHRD_Progress_Bar component.
  late CHRDProgressBarModel cHRDProgressBarModel;
  // Model for CHRD_Label_Skip_Btn component.
  late CHRDLabelSkipBtnModel cHRDLabelSkipBtnModel;

  @override
  void initState(BuildContext context) {
    cHRDBackBtnModel = createModel(context, () => CHRDBackBtnModel());
    cHRDProgressBarModel = createModel(context, () => CHRDProgressBarModel());
    cHRDLabelSkipBtnModel = createModel(context, () => CHRDLabelSkipBtnModel());
  }

  @override
  void dispose() {
    cHRDBackBtnModel.dispose();
    cHRDProgressBarModel.dispose();
    cHRDLabelSkipBtnModel.dispose();
  }
}
