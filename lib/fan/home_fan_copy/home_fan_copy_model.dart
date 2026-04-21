import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/custobar_widget.dart';
import '/components/notification_icon_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_with_border/c_h_r_d_label_text_field_with_border_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_phone_number/c_h_r_d_phone_number_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'home_fan_copy_widget.dart' show HomeFanCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeFanCopyModel extends FlutterFlowModel<HomeFanCopyWidget> {
  ///  Local state fields for this page.

  bool cf = false;

  ///  State fields for stateful widgets in this page.

  // Model for AdminName.
  late CHRDLabelTextFieldWithBorderModel adminNameModel;
  // Model for CHRD_phone_number_initial.
  late CHRDPhoneNumberModel cHRDPhoneNumberInitialModel;
  // Model for EmailAddress.
  late CHRDLabelTextFieldWithBorderModel emailAddressModel;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel1;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel2;
  // Model for custobar component.
  late CustobarModel custobarModel;

  @override
  void initState(BuildContext context) {
    adminNameModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    cHRDPhoneNumberInitialModel =
        createModel(context, () => CHRDPhoneNumberModel());
    emailAddressModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    cHRDLabelBtnModel1 = createModel(context, () => CHRDLabelBtnModel());
    cHRDLabelBtnModel2 = createModel(context, () => CHRDLabelBtnModel());
    custobarModel = createModel(context, () => CustobarModel());
  }

  @override
  void dispose() {
    adminNameModel.dispose();
    cHRDPhoneNumberInitialModel.dispose();
    emailAddressModel.dispose();
    cHRDLabelBtnModel1.dispose();
    cHRDLabelBtnModel2.dispose();
    custobarModel.dispose();
  }
}
