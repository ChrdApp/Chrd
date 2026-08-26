import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'gig_offer_choose_venue_widget.dart' show GigOfferChooseVenueWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GigOfferChooseVenueModel
    extends FlutterFlowModel<GigOfferChooseVenueWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel;

  @override
  void initState(BuildContext context) {
    cHRDLabelBtnModel = createModel(context, () => CHRDLabelBtnModel());
  }

  @override
  void dispose() {
    cHRDLabelBtnModel.dispose();
  }
}
