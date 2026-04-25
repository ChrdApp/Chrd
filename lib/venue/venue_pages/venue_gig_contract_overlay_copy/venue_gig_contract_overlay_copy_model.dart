import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/confirmation_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_backout_gig/c_h_r_d_backout_gig_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_price_amount/c_h_r_d_price_amount_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_performance_stages/c_h_r_d_performance_stages_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_row_with_icon/c_h_r_d_row_with_icon_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'venue_gig_contract_overlay_copy_widget.dart'
    show VenueGigContractOverlayCopyWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VenueGigContractOverlayCopyModel
    extends FlutterFlowModel<VenueGigContractOverlayCopyWidget> {
  ///  Local state fields for this page.

  String? repeatTime;

  int? selectedStageId;

  String? days = 'Select';

  String? time = '';

  String? loadDurationTime = '-';

  double? addedPrice;

  bool isEdited = false;

  bool isLoader = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Single Slot Details)] action in venue_gig_contract_overlayCopy widget.
  ApiCallResponse? singleSlotOutput;
  // Model for CHRD_Back_Btn component.
  late CHRDBackBtnModel cHRDBackBtnModel;
  DateTime? datePicked;
  // Model for CHRD_row_with_icon component.
  late CHRDRowWithIconModel cHRDRowWithIconModel1;
  // Stores action output result for [Custom Action - showConstrainedTimePicker] action in CHRD_row_with_icon widget.
  DateTime? selectedTimeContract;
  // Model for CHRD_row_with_icon component.
  late CHRDRowWithIconModel cHRDRowWithIconModel2;
  // Model for CHRD_row_with_icon component.
  late CHRDRowWithIconModel cHRDRowWithIconModel3;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in CHRD_row_with_icon widget.
  dynamic? performanceStage;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel1;
  // Stores action output result for [Backend Call - API (Delete Venue Open Slots)] action in CHRD_Label_Btn widget.
  ApiCallResponse? deleteGig;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel2;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel3;
  // Stores action output result for [Backend Call - API (Update Venue Slots Unified)] action in CHRD_Label_Btn widget.
  ApiCallResponse? updateSlot;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel4;
  // Stores action output result for [Backend Call - API (Back Out)] action in CHRD_Label_Btn widget.
  ApiCallResponse? backOutOutput;

  @override
  void initState(BuildContext context) {
    cHRDBackBtnModel = createModel(context, () => CHRDBackBtnModel());
    cHRDRowWithIconModel1 = createModel(context, () => CHRDRowWithIconModel());
    cHRDRowWithIconModel2 = createModel(context, () => CHRDRowWithIconModel());
    cHRDRowWithIconModel3 = createModel(context, () => CHRDRowWithIconModel());
    cHRDLabelBtnModel1 = createModel(context, () => CHRDLabelBtnModel());
    cHRDLabelBtnModel2 = createModel(context, () => CHRDLabelBtnModel());
    cHRDLabelBtnModel3 = createModel(context, () => CHRDLabelBtnModel());
    cHRDLabelBtnModel4 = createModel(context, () => CHRDLabelBtnModel());
  }

  @override
  void dispose() {
    cHRDBackBtnModel.dispose();
    cHRDRowWithIconModel1.dispose();
    cHRDRowWithIconModel2.dispose();
    cHRDRowWithIconModel3.dispose();
    cHRDLabelBtnModel1.dispose();
    cHRDLabelBtnModel2.dispose();
    cHRDLabelBtnModel3.dispose();
    cHRDLabelBtnModel4.dispose();
  }
}
