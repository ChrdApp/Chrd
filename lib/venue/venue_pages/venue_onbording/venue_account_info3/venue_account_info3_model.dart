import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_number/c_h_r_d_label_text_field_number_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_with_border/c_h_r_d_label_text_field_with_border_widget.dart';
import '/musician/components/c_h_r_d_progress_bar/c_h_r_d_progress_bar_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_phone_no_venue/c_h_r_d_phone_no_venue_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'venue_account_info3_widget.dart' show VenueAccountInfo3Widget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VenueAccountInfo3Model extends FlutterFlowModel<VenueAccountInfo3Widget> {
  ///  Local state fields for this page.

  String? vanueName;

  bool isReadOnly = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in venue_account_info3 widget.
  List<VenuesRow>? venueOutput;
  // Model for CHRD_Back_Btn component.
  late CHRDBackBtnModel cHRDBackBtnModel;
  // Model for CHRD_Progress_Bar component.
  late CHRDProgressBarModel cHRDProgressBarModel;
  // Model for CHRD_label_Column_Text component.
  late CHRDLabelColumnTextModel cHRDLabelColumnTextModel;
  // Model for VanueName.
  late CHRDLabelTextFieldWithBorderModel vanueNameModel;
  // Model for Address.
  late CHRDLabelTextFieldWithBorderModel addressModel;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter  description';
    }

    if (val.length > 250) {
      return 'Description cannot exceed 250 characters';
    }

    return null;
  }

  // Model for VenueCapacity.
  late CHRDLabelTextFieldNumberModel venueCapacityModel;
  // Model for AgePolicy.
  late CHRDLabelTextFieldNumberModel agePolicyModel;
  // Model for HoursOperation.
  late CHRDLabelTextFieldNumberModel hoursOperationModel;
  // Model for Amenities.
  late CHRDLabelTextFieldWithBorderModel amenitiesModel;
  // Model for CHRD_phone_no_venue component.
  late CHRDPhoneNoVenueModel cHRDPhoneNoVenueModel;
  // Model for Email.
  late CHRDLabelTextFieldWithBorderModel emailModel;
  // Model for Website.
  late CHRDLabelTextFieldWithBorderModel websiteModel;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel;

  @override
  void initState(BuildContext context) {
    cHRDBackBtnModel = createModel(context, () => CHRDBackBtnModel());
    cHRDProgressBarModel = createModel(context, () => CHRDProgressBarModel());
    cHRDLabelColumnTextModel =
        createModel(context, () => CHRDLabelColumnTextModel());
    vanueNameModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    addressModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
    venueCapacityModel =
        createModel(context, () => CHRDLabelTextFieldNumberModel());
    agePolicyModel =
        createModel(context, () => CHRDLabelTextFieldNumberModel());
    hoursOperationModel =
        createModel(context, () => CHRDLabelTextFieldNumberModel());
    amenitiesModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    cHRDPhoneNoVenueModel = createModel(context, () => CHRDPhoneNoVenueModel());
    emailModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    websiteModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    cHRDLabelBtnModel = createModel(context, () => CHRDLabelBtnModel());
    vanueNameModel.textControllerValidator = _formTextFieldValidator1;
    addressModel.textControllerValidator = _formTextFieldValidator2;
    cHRDPhoneNoVenueModel.phoneNumberTextControllerValidator =
        _formTextFieldValidator3;
    emailModel.textControllerValidator = _formTextFieldValidator4;
    websiteModel.textControllerValidator = _formTextFieldValidator5;
  }

  @override
  void dispose() {
    cHRDBackBtnModel.dispose();
    cHRDProgressBarModel.dispose();
    cHRDLabelColumnTextModel.dispose();
    vanueNameModel.dispose();
    addressModel.dispose();
    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    venueCapacityModel.dispose();
    agePolicyModel.dispose();
    hoursOperationModel.dispose();
    amenitiesModel.dispose();
    cHRDPhoneNoVenueModel.dispose();
    emailModel.dispose();
    websiteModel.dispose();
    cHRDLabelBtnModel.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter venue name';
    }

    if (val.length > 30) {
      return 'Maximum 30 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter address';
    }

    if (val.length > 250) {
      return 'Address cannot exceed 250 characters';
    }

    return null;
  }

  String? _formTextFieldValidator3(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Phone Number is required';
    }

    if (val.length < 17) {
      return 'Requires at least 17 characters.';
    }

    return null;
  }

  String? _formTextFieldValidator4(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter an email address';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _formTextFieldValidator5(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the website URL';
    }

    if (!RegExp(kTextValidatorWebsiteRegex).hasMatch(val)) {
      return 'Please enter a valid URL';
    }
    return null;
  }
}
