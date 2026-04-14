import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/musician/components/c_h_r_d_label_skip_btn/c_h_r_d_label_skip_btn_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'add_venues2_widget.dart' show AddVenues2Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddVenues2Model extends FlutterFlowModel<AddVenues2Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for CHRD_Label_Skip_Btn component.
  late CHRDLabelSkipBtnModel cHRDLabelSkipBtnModel;
  // Model for CHRD_label_Column_Text component.
  late CHRDLabelColumnTextModel cHRDLabelColumnTextModel;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel;

  @override
  void initState(BuildContext context) {
    cHRDLabelSkipBtnModel = createModel(context, () => CHRDLabelSkipBtnModel());
    cHRDLabelColumnTextModel =
        createModel(context, () => CHRDLabelColumnTextModel());
    cHRDLabelBtnModel = createModel(context, () => CHRDLabelBtnModel());
  }

  @override
  void dispose() {
    cHRDLabelSkipBtnModel.dispose();
    cHRDLabelColumnTextModel.dispose();
    cHRDLabelBtnModel.dispose();
  }
}
