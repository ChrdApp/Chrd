import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import 'dart:ui';
import 'c_h_r_d_backout_gig_widget.dart' show CHRDBackoutGigWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CHRDBackoutGigModel extends FlutterFlowModel<CHRDBackoutGigWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Backout reason is required.';
    }

    return null;
  }

  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel1;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel2;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
    cHRDLabelBtnModel1 = createModel(context, () => CHRDLabelBtnModel());
    cHRDLabelBtnModel2 = createModel(context, () => CHRDLabelBtnModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    cHRDLabelBtnModel1.dispose();
    cHRDLabelBtnModel2.dispose();
  }
}
