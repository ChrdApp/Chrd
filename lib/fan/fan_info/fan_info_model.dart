import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/confirmation_dialog_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_with_border/c_h_r_d_label_text_field_with_border_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_phone_number/c_h_r_d_phone_number_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'fan_info_widget.dart' show FanInfoWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FanInfoModel extends FlutterFlowModel<FanInfoWidget> {
  ///  Local state fields for this page.

  bool hideMobileField = false;

  bool hideEmailField = true;

  String mobileNoValue = '';

  bool showMobileError = false;

  bool isHide = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in Fan_info widget.
  List<UsersRow>? userData;
  // Model for CHRD_Back_Btn component.
  late CHRDBackBtnModel cHRDBackBtnModel;
  // Model for CHRD_label_Column_Text component.
  late CHRDLabelColumnTextModel cHRDLabelColumnTextModel;
  // Model for AdminName.
  late CHRDLabelTextFieldWithBorderModel adminNameModel;
  // Model for CHRD_phone_number_initial.
  late CHRDPhoneNumberModel cHRDPhoneNumberInitialModel;
  // Model for EmailAddress.
  late CHRDLabelTextFieldWithBorderModel emailAddressModel;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel1;
  // Stores action output result for [Backend Call - API (Deactivate user)] action in CHRD_Label_Btn widget.
  ApiCallResponse? deactivatedUser;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel2;
  // Stores action output result for [Backend Call - Query Rows] action in CHRD_Label_Btn widget.
  List<UsersRow>? emailOutput;
  // Stores action output result for [Backend Call - Update Row(s)] action in CHRD_Label_Btn widget.
  List<UsersRow>? userOutput;
  // Stores action output result for [Backend Call - Update Row(s)] action in CHRD_Label_Btn widget.
  List<UsersRow>? userOutputSocialLogin;

  @override
  void initState(BuildContext context) {
    cHRDBackBtnModel = createModel(context, () => CHRDBackBtnModel());
    cHRDLabelColumnTextModel =
        createModel(context, () => CHRDLabelColumnTextModel());
    adminNameModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    cHRDPhoneNumberInitialModel =
        createModel(context, () => CHRDPhoneNumberModel());
    emailAddressModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    cHRDLabelBtnModel1 = createModel(context, () => CHRDLabelBtnModel());
    cHRDLabelBtnModel2 = createModel(context, () => CHRDLabelBtnModel());
    adminNameModel.textControllerValidator = _formTextFieldValidator1;
    emailAddressModel.textControllerValidator = _formTextFieldValidator2;
  }

  @override
  void dispose() {
    cHRDBackBtnModel.dispose();
    cHRDLabelColumnTextModel.dispose();
    adminNameModel.dispose();
    cHRDPhoneNumberInitialModel.dispose();
    emailAddressModel.dispose();
    cHRDLabelBtnModel1.dispose();
    cHRDLabelBtnModel2.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter name';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^[A-Za-z]+(?:[ \'-]?[A-Za-z]+)*\'?\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is Required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }
}
