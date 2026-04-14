import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_text_field_number/c_h_r_d_label_text_field_number_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_with_border/c_h_r_d_label_text_field_with_border_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_phone_no_venue/c_h_r_d_phone_no_venue_widget.dart';
import 'dart:ui';
import 'test_widget.dart' show TestWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestModel extends FlutterFlowModel<TestWidget> {
  ///  Local state fields for this page.

  bool isedit = false;

  bool isVideo = false;

  ///  State fields for stateful widgets in this page.

  // Model for VanueName.
  late CHRDLabelTextFieldWithBorderModel vanueNameModel;
  // Model for Address.
  late CHRDLabelTextFieldWithBorderModel addressModel;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
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

  @override
  void initState(BuildContext context) {
    vanueNameModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    addressModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
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
  }

  @override
  void dispose() {
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
  }
}
