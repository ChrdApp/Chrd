import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_app_bar2/c_h_r_d_app_bar2_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'musician_added_content_widget.dart' show MusicianAddedContentWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MusicianAddedContentModel
    extends FlutterFlowModel<MusicianAddedContentWidget> {
  ///  Local state fields for this page.

  bool hideSkipButton = false;

  ///  State fields for stateful widgets in this page.

  // Model for CHRD_app_Bar2 component.
  late CHRDAppBar2Model cHRDAppBar2Model;
  // Model for CHRD_label_Column_Text component.
  late CHRDLabelColumnTextModel cHRDLabelColumnTextModel;
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
    cHRDLabelBtnModel.dispose();
  }
}
