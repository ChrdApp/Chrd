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
import 'dart:ui';
import '/index.dart';
import 'venue_entertainment7_widget.dart' show VenueEntertainment7Widget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VenueEntertainment7Model
    extends FlutterFlowModel<VenueEntertainment7Widget> {
  ///  Local state fields for this page.

  List<int> entertainmentSelected = [];
  void addToEntertainmentSelected(int item) => entertainmentSelected.add(item);
  void removeFromEntertainmentSelected(int item) =>
      entertainmentSelected.remove(item);
  void removeAtIndexFromEntertainmentSelected(int index) =>
      entertainmentSelected.removeAt(index);
  void insertAtIndexInEntertainmentSelected(int index, int item) =>
      entertainmentSelected.insert(index, item);
  void updateEntertainmentSelectedAtIndex(int index, Function(int) updateFn) =>
      entertainmentSelected[index] = updateFn(entertainmentSelected[index]);

  ///  State fields for stateful widgets in this page.

  // Model for CHRD_app_Bar2 component.
  late CHRDAppBar2Model cHRDAppBar2Model;
  // Model for CHRD_label_Column_Text component.
  late CHRDLabelColumnTextModel cHRDLabelColumnTextModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel;

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
