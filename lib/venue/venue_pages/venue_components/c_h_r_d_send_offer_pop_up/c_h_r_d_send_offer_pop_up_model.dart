import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import 'dart:ui';
import 'c_h_r_d_send_offer_pop_up_widget.dart' show CHRDSendOfferPopUpWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CHRDSendOfferPopUpModel
    extends FlutterFlowModel<CHRDSendOfferPopUpWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel1;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel2;

  @override
  void initState(BuildContext context) {
    cHRDLabelBtnModel1 = createModel(context, () => CHRDLabelBtnModel());
    cHRDLabelBtnModel2 = createModel(context, () => CHRDLabelBtnModel());
  }

  @override
  void dispose() {
    cHRDLabelBtnModel1.dispose();
    cHRDLabelBtnModel2.dispose();
  }
}
