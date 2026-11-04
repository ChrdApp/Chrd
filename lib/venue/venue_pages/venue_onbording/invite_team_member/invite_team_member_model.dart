import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_with_border/c_h_r_d_label_text_field_with_border_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_phone_number/c_h_r_d_phone_number_widget.dart';
import 'dart:ui';
import 'invite_team_member_widget.dart' show InviteTeamMemberWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InviteTeamMemberModel extends FlutterFlowModel<InviteTeamMemberWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for CHRD_Back_Btn component.
  late CHRDBackBtnModel cHRDBackBtnModel;
  // Model for CHRD_label_Column_Text component.
  late CHRDLabelColumnTextModel cHRDLabelColumnTextModel;
  // Model for AdminName.
  late CHRDLabelTextFieldWithBorderModel adminNameModel;
  // Model for CHRD_phone_number component.
  late CHRDPhoneNumberModel cHRDPhoneNumberModel;
  // Model for AdminEmail.
  late CHRDLabelTextFieldWithBorderModel adminEmailModel;
  // State field(s) for RolePositionDropDown widget.
  String? rolePositionDropDownValue;
  FormFieldController<String>? rolePositionDropDownValueController;
  // State field(s) for PermissionsDropDown widget.
  String? permissionsDropDownValue;
  FormFieldController<String>? permissionsDropDownValueController;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel;

  @override
  void initState(BuildContext context) {
    cHRDBackBtnModel = createModel(context, () => CHRDBackBtnModel());
    cHRDLabelColumnTextModel =
        createModel(context, () => CHRDLabelColumnTextModel());
    adminNameModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    cHRDPhoneNumberModel = createModel(context, () => CHRDPhoneNumberModel());
    adminEmailModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    cHRDLabelBtnModel = createModel(context, () => CHRDLabelBtnModel());
    adminNameModel.textControllerValidator = _formTextFieldValidator1;
    adminEmailModel.textControllerValidator = _formTextFieldValidator2;
  }

  @override
  void dispose() {
    cHRDBackBtnModel.dispose();
    cHRDLabelColumnTextModel.dispose();
    adminNameModel.dispose();
    cHRDPhoneNumberModel.dispose();
    adminEmailModel.dispose();
    cHRDLabelBtnModel.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter name';
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
