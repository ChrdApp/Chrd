import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/confirmation_dialog_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_backout_gig/c_h_r_d_backout_gig_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_price_amount/c_h_r_d_price_amount_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_performance_stages/c_h_r_d_performance_stages_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_row_with_icon/c_h_r_d_row_with_icon_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_video_player_component/c_h_r_d_video_player_component_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'venue_gig_contract_overlay_widget.dart'
    show VenueGigContractOverlayWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class VenueGigContractOverlayModel
    extends FlutterFlowModel<VenueGigContractOverlayWidget> {
  ///  Local state fields for this page.

  String? repeatTime;

  int? selectedStageId;

  String? days = 'Select';

  String? time = 'select';

  String? loadDurationTime = '-';

  double? addedPrice;

  ///  State fields for stateful widgets in this page.

  // Model for CHRD_Back_Btn component.
  late CHRDBackBtnModel cHRDBackBtnModel;
  DateTime? datePicked;
  // Model for CHRD_row_with_icon component.
  late CHRDRowWithIconModel cHRDRowWithIconModel1;
  // Model for CHRD_row_with_icon component.
  late CHRDRowWithIconModel cHRDRowWithIconModel2;
  // Model for CHRD_row_with_icon component.
  late CHRDRowWithIconModel cHRDRowWithIconModel3;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in CHRD_row_with_icon widget.
  dynamic? performanceStage;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel1;
  // Stores action output result for [Backend Call - API (Hard delete venue slot)] action in CHRD_Label_Btn widget.
  ApiCallResponse? hardDeleteGig;
  // Stores action output result for [Backend Call - API (Fetch musicians of gig)] action in CHRD_Label_Btn widget.
  ApiCallResponse? fetchedMusicianList;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel2;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel3;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel4;
  // Stores action output result for [Backend Call - API (Back Out)] action in CHRD_Label_Btn widget.
  ApiCallResponse? backOutOutput;
  // Stores action output result for [Backend Call - Query Rows] action in CHRD_Label_Btn widget.
  List<UsersRow>? userOutput;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel5;

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
    cHRDLabelBtnModel5 = createModel(context, () => CHRDLabelBtnModel());
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
    cHRDLabelBtnModel5.dispose();
  }
}
