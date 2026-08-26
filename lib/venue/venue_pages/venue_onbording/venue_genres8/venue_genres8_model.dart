import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_app_bar2/c_h_r_d_app_bar2_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/index.dart';
import 'venue_genres8_widget.dart' show VenueGenres8Widget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VenueGenres8Model extends FlutterFlowModel<VenueGenres8Widget> {
  ///  Local state fields for this page.

  List<int> selectedGenres = [];
  void addToSelectedGenres(int item) => selectedGenres.add(item);
  void removeFromSelectedGenres(int item) => selectedGenres.remove(item);
  void removeAtIndexFromSelectedGenres(int index) =>
      selectedGenres.removeAt(index);
  void insertAtIndexInSelectedGenres(int index, int item) =>
      selectedGenres.insert(index, item);
  void updateSelectedGenresAtIndex(int index, Function(int) updateFn) =>
      selectedGenres[index] = updateFn(selectedGenres[index]);

  ///  State fields for stateful widgets in this page.

  // Model for CHRD_app_Bar2 component.
  late CHRDAppBar2Model cHRDAppBar2Model;
  // Stores action output result for [Backend Call - Insert Row] action in CHRD_app_Bar2 widget.
  VenuesRow? createVenueSkip;
  // Stores action output result for [Backend Call - Insert Row] action in CHRD_app_Bar2 widget.
  VenueContentRow? contentListOutputSkip;
  // Model for CHRD_label_Column_Text component.
  late CHRDLabelColumnTextModel cHRDLabelColumnTextModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel;
  // Stores action output result for [Backend Call - API (Claim Invite)] action in CHRD_Label_Btn widget.
  ApiCallResponse? clainInviteOutput;
  // Stores action output result for [Backend Call - Insert Row] action in CHRD_Label_Btn widget.
  VenuesRow? createVenue;
  // Stores action output result for [Backend Call - Insert Row] action in CHRD_Label_Btn widget.
  VenueContentRow? contentListOutput;

  @override
  void initState(BuildContext context) {
    cHRDAppBar2Model = createModel(context, () => CHRDAppBar2Model());
    cHRDLabelColumnTextModel =
        createModel(context, () => CHRDLabelColumnTextModel());
    cHRDLabelBtnModel = createModel(context, () => CHRDLabelBtnModel());
  }

  @override
  void dispose() {
    cHRDAppBar2Model.dispose();
    cHRDLabelColumnTextModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    cHRDLabelBtnModel.dispose();
  }
}
