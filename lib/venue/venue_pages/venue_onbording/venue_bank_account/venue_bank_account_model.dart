import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_with_border/c_h_r_d_label_text_field_with_border_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_app_bar2/c_h_r_d_app_bar2_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'venue_bank_account_widget.dart' show VenueBankAccountWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VenueBankAccountModel extends FlutterFlowModel<VenueBankAccountWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for CHRD_app_Bar2 component.
  late CHRDAppBar2Model cHRDAppBar2Model;
  // Model for accountHolderName.
  late CHRDLabelTextFieldWithBorderModel accountHolderNameModel;
  // Model for accountNumber.
  late CHRDLabelTextFieldWithBorderModel accountNumberModel;
  // Model for accountNumber2.
  late CHRDLabelTextFieldWithBorderModel accountNumber2Model;
  // Model for bankName.
  late CHRDLabelTextFieldWithBorderModel bankNameModel;
  // Model for routingCode.
  late CHRDLabelTextFieldWithBorderModel routingCodeModel;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel;

  @override
  void initState(BuildContext context) {
    cHRDAppBar2Model = createModel(context, () => CHRDAppBar2Model());
    accountHolderNameModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    accountNumberModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    accountNumber2Model =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    bankNameModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    routingCodeModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    cHRDLabelBtnModel = createModel(context, () => CHRDLabelBtnModel());
  }

  @override
  void dispose() {
    cHRDAppBar2Model.dispose();
    accountHolderNameModel.dispose();
    accountNumberModel.dispose();
    accountNumber2Model.dispose();
    bankNameModel.dispose();
    routingCodeModel.dispose();
    cHRDLabelBtnModel.dispose();
  }
}
