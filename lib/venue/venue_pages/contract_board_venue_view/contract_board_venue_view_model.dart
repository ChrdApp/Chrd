import '/backend/api_requests/api_calls.dart';
import '/components/empty_list_image_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_open_booked/c_h_r_d_open_booked_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'contract_board_venue_view_widget.dart'
    show ContractBoardVenueViewWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ContractBoardVenueViewModel
    extends FlutterFlowModel<ContractBoardVenueViewWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for CHRD_Open_Booked dynamic component.
  late FlutterFlowDynamicModels<CHRDOpenBookedModel> cHRDOpenBookedModels;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel;
  // Stores action output result for [Backend Call - API (Upsert gigs)] action in CHRD_Label_Btn widget.
  ApiCallResponse? upsertOutputGenral;

  @override
  void initState(BuildContext context) {
    cHRDOpenBookedModels =
        FlutterFlowDynamicModels(() => CHRDOpenBookedModel());
    cHRDLabelBtnModel = createModel(context, () => CHRDLabelBtnModel());
  }

  @override
  void dispose() {
    cHRDOpenBookedModels.dispose();
    cHRDLabelBtnModel.dispose();
  }
}
