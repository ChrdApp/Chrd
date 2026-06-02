import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/fan/fan_creation/fan_creation_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/musician/components/musician_creation/musician_creation_widget.dart';
import '/musician/components/venue_creation/venue_creation_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'account_creation6_widget.dart' show AccountCreation6Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccountCreation6Model extends FlutterFlowModel<AccountCreation6Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for CHRD_label_Column_Text component.
  late CHRDLabelColumnTextModel cHRDLabelColumnTextModel;
  // Model for fan_creation component.
  late FanCreationModel fanCreationModel;
  // Model for musician_creation component.
  late MusicianCreationModel musicianCreationModel;
  // Model for venue_creation component.
  late VenueCreationModel venueCreationModel;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel;

  @override
  void initState(BuildContext context) {
    cHRDLabelColumnTextModel =
        createModel(context, () => CHRDLabelColumnTextModel());
    fanCreationModel = createModel(context, () => FanCreationModel());
    musicianCreationModel = createModel(context, () => MusicianCreationModel());
    venueCreationModel = createModel(context, () => VenueCreationModel());
    cHRDLabelBtnModel = createModel(context, () => CHRDLabelBtnModel());
  }

  @override
  void dispose() {
    cHRDLabelColumnTextModel.dispose();
    fanCreationModel.dispose();
    musicianCreationModel.dispose();
    venueCreationModel.dispose();
    cHRDLabelBtnModel.dispose();
  }
}
