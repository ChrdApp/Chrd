import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_app_bar/c_h_r_d_app_bar_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'repeat_over_lay_widget.dart' show RepeatOverLayWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RepeatOverLayModel extends FlutterFlowModel<RepeatOverLayWidget> {
  ///  Local state fields for this page.

  List<String> repeatType = ['None', 'Daily', 'Weekly'];
  void addToRepeatType(String item) => repeatType.add(item);
  void removeFromRepeatType(String item) => repeatType.remove(item);
  void removeAtIndexFromRepeatType(int index) => repeatType.removeAt(index);
  void insertAtIndexInRepeatType(int index, String item) =>
      repeatType.insert(index, item);
  void updateRepeatTypeAtIndex(int index, Function(String) updateFn) =>
      repeatType[index] = updateFn(repeatType[index]);

  String? selectedRepeatType = '';

  ///  State fields for stateful widgets in this page.

  // Model for CHRD_App_Bar component.
  late CHRDAppBarModel cHRDAppBarModel;
  DateTime? datePicked;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel;

  @override
  void initState(BuildContext context) {
    cHRDAppBarModel = createModel(context, () => CHRDAppBarModel());
    cHRDLabelBtnModel = createModel(context, () => CHRDLabelBtnModel());
  }

  @override
  void dispose() {
    cHRDAppBarModel.dispose();
    cHRDLabelBtnModel.dispose();
  }
}
