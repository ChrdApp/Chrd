import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_with_border/c_h_r_d_label_text_field_with_border_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'login_security_widget.dart' show LoginSecurityWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class LoginSecurityModel extends FlutterFlowModel<LoginSecurityWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for CHRD_Back_Btn component.
  late CHRDBackBtnModel cHRDBackBtnModel;
  // Model for FirstName.
  late CHRDLabelTextFieldWithBorderModel firstNameModel;
  // Model for LastName.
  late CHRDLabelTextFieldWithBorderModel lastNameModel;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for PhoneTextField widget.
  FocusNode? phoneTextFieldFocusNode;
  TextEditingController? phoneTextFieldTextController;
  late MaskTextInputFormatter phoneTextFieldMask;
  String? Function(BuildContext, String?)?
      phoneTextFieldTextControllerValidator;
  String? _phoneTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Phone Number is required';
    }

    if (val.length < 10) {
      return 'Enter Valid Phone Number';
    }

    return null;
  }

  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel;

  @override
  void initState(BuildContext context) {
    cHRDBackBtnModel = createModel(context, () => CHRDBackBtnModel());
    firstNameModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    lastNameModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    emailTextControllerValidator = _emailTextControllerValidator;
    phoneTextFieldTextControllerValidator =
        _phoneTextFieldTextControllerValidator;
    cHRDLabelBtnModel = createModel(context, () => CHRDLabelBtnModel());
    firstNameModel.textControllerValidator = _formTextFieldValidator1;
    lastNameModel.textControllerValidator = _formTextFieldValidator2;
  }

  @override
  void dispose() {
    cHRDBackBtnModel.dispose();
    firstNameModel.dispose();
    lastNameModel.dispose();
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneTextFieldFocusNode?.dispose();
    phoneTextFieldTextController?.dispose();

    cHRDLabelBtnModel.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'First Name is required';
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Last  Name is required';
    }

    return null;
  }
}
