import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/components/empty_list_image_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_open_booked/c_h_r_d_open_booked_widget.dart';
import '/musician/musician_components/musician_nav_bar/musician_nav_bar_widget.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'contract_board_widget.dart' show ContractBoardWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ContractBoardModel extends FlutterFlowModel<ContractBoardWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for CHRD_Open_Booked dynamic component.
  late FlutterFlowDynamicModels<CHRDOpenBookedModel> cHRDOpenBookedModels;
  // Model for musicianNavBar component.
  late MusicianNavBarModel musicianNavBarModel;

  @override
  void initState(BuildContext context) {
    cHRDOpenBookedModels =
        FlutterFlowDynamicModels(() => CHRDOpenBookedModel());
    musicianNavBarModel = createModel(context, () => MusicianNavBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    cHRDOpenBookedModels.dispose();
    musicianNavBarModel.dispose();
  }
}
