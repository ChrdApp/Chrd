import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_icon_with_text/c_h_r_d_icon_with_text_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_video_player_component/c_h_r_d_video_player_component_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'musician_gig_over_lay_widget.dart' show MusicianGigOverLayWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class MusicianGigOverLayModel
    extends FlutterFlowModel<MusicianGigOverLayWidget> {
  ///  Local state fields for this page.

  String? repeatTime;

  int? selectedStageId;

  String? days = 'Select';

  String? time = 'select';

  String? loadDurationTime = '-';

  ///  State fields for stateful widgets in this page.

  // Model for CHRD_Back_Btn component.
  late CHRDBackBtnModel cHRDBackBtnModel;
  // Model for CHRD_Icon_With_Text component.
  late CHRDIconWithTextModel cHRDIconWithTextModel1;
  // Model for CHRD_Icon_With_Text component.
  late CHRDIconWithTextModel cHRDIconWithTextModel2;
  DateTime? datePicked;
  // Model for CHRD_Icon_With_Text component.
  late CHRDIconWithTextModel cHRDIconWithTextModel3;
  // Model for CHRD_Icon_With_Text component.
  late CHRDIconWithTextModel cHRDIconWithTextModel4;
  // Model for CHRD_Icon_With_Text component.
  late CHRDIconWithTextModel cHRDIconWithTextModel5;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel;
  // Stores action output result for [Backend Call - API (Upsert gigs)] action in CHRD_Label_Btn widget.
  ApiCallResponse? upsertOutput;
  // Stores action output result for [Backend Call - Query Rows] action in CHRD_Label_Btn widget.
  List<UsersRow>? userOutput;
  // Stores action output result for [Backend Call - API (Send Notification)] action in CHRD_Label_Btn widget.
  ApiCallResponse? sendNotificationOutput;

  @override
  void initState(BuildContext context) {
    cHRDBackBtnModel = createModel(context, () => CHRDBackBtnModel());
    cHRDIconWithTextModel1 =
        createModel(context, () => CHRDIconWithTextModel());
    cHRDIconWithTextModel2 =
        createModel(context, () => CHRDIconWithTextModel());
    cHRDIconWithTextModel3 =
        createModel(context, () => CHRDIconWithTextModel());
    cHRDIconWithTextModel4 =
        createModel(context, () => CHRDIconWithTextModel());
    cHRDIconWithTextModel5 =
        createModel(context, () => CHRDIconWithTextModel());
    cHRDLabelBtnModel = createModel(context, () => CHRDLabelBtnModel());
  }

  @override
  void dispose() {
    cHRDBackBtnModel.dispose();
    cHRDIconWithTextModel1.dispose();
    cHRDIconWithTextModel2.dispose();
    cHRDIconWithTextModel3.dispose();
    cHRDIconWithTextModel4.dispose();
    cHRDIconWithTextModel5.dispose();
    cHRDLabelBtnModel.dispose();
  }
}
