import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_with_border/c_h_r_d_label_text_field_with_border_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_app_bar2/c_h_r_d_app_bar2_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'musician_bank_account_widget.dart' show MusicianBankAccountWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MusicianBankAccountModel
    extends FlutterFlowModel<MusicianBankAccountWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for CHRD_app_Bar2 component.
  late CHRDAppBar2Model cHRDAppBar2Model;
  // Model for CHRD_label_Column_Text component.
  late CHRDLabelColumnTextModel cHRDLabelColumnTextModel;
  // Model for AccountHolderName.
  late CHRDLabelTextFieldWithBorderModel accountHolderNameModel;
  // Model for AccountNumber.
  late CHRDLabelTextFieldWithBorderModel accountNumberModel;
  // Model for ReEnterAccount.
  late CHRDLabelTextFieldWithBorderModel reEnterAccountModel;
  // Model for BankName.
  late CHRDLabelTextFieldWithBorderModel bankNameModel;
  // Model for RoutingCode.
  late CHRDLabelTextFieldWithBorderModel routingCodeModel;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel;

  @override
  void initState(BuildContext context) {
    cHRDAppBar2Model = createModel(context, () => CHRDAppBar2Model());
    cHRDLabelColumnTextModel =
        createModel(context, () => CHRDLabelColumnTextModel());
    accountHolderNameModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    accountNumberModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    reEnterAccountModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    bankNameModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    routingCodeModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    cHRDLabelBtnModel = createModel(context, () => CHRDLabelBtnModel());
    accountHolderNameModel.textControllerValidator = _formTextFieldValidator1;
    accountNumberModel.textControllerValidator = _formTextFieldValidator2;
    reEnterAccountModel.textControllerValidator = _formTextFieldValidator3;
    bankNameModel.textControllerValidator = _formTextFieldValidator4;
    routingCodeModel.textControllerValidator = _formTextFieldValidator5;
  }

  @override
  void dispose() {
    cHRDAppBar2Model.dispose();
    cHRDLabelColumnTextModel.dispose();
    accountHolderNameModel.dispose();
    accountNumberModel.dispose();
    reEnterAccountModel.dispose();
    bankNameModel.dispose();
    routingCodeModel.dispose();
    cHRDLabelBtnModel.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter Account Holder Name';
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter Account Number';
    }

    return null;
  }

  String? _formTextFieldValidator3(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Re-Enter Account Number';
    }

    return null;
  }

  String? _formTextFieldValidator4(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter Bank Name';
    }

    return null;
  }

  String? _formTextFieldValidator5(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter Routing Code';
    }

    return null;
  }
}
