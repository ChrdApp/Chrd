import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_list_image_widget.dart';
import '/components/loader_placeholder_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'c_h_r_d_switching_venue_in_messages_widget.dart'
    show CHRDSwitchingVenueInMessagesWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CHRDSwitchingVenueInMessagesModel
    extends FlutterFlowModel<CHRDSwitchingVenueInMessagesWidget> {
  ///  Local state fields for this component.

  bool isSelected = false;

  ///  State fields for stateful widgets in this component.

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
