import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/musician/components/c_h_r_d_label_invit_user/c_h_r_d_label_invit_user_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_with_border/c_h_r_d_label_text_field_with_border_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_app_bar2/c_h_r_d_app_bar2_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'musician_add_band_widget.dart' show MusicianAddBandWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MusicianAddBandModel extends FlutterFlowModel<MusicianAddBandWidget> {
  ///  Local state fields for this page.

  String? bandImage =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/bp65dmpbc2m7/musician_Profile.png';

  ///  State fields for stateful widgets in this page.

  // Model for CHRD_app_Bar2 component.
  late CHRDAppBar2Model cHRDAppBar2Model;
  // Model for CHRD_label_Column_Text component.
  late CHRDLabelColumnTextModel cHRDLabelColumnTextModel;
  bool isDataUploading_uploadBandPhoto = false;
  FFUploadedFile uploadedLocalFile_uploadBandPhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadBandPhoto = '';

  // Model for Band_Name.
  late CHRDLabelTextFieldWithBorderModel bandNameModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for CHRD_Label_Invit_User component.
  late CHRDLabelInvitUserModel cHRDLabelInvitUserModel;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel;
  // Stores action output result for [Backend Call - Insert Row] action in CHRD_Label_Btn widget.
  BandsRow? bandOutput;

  @override
  void initState(BuildContext context) {
    cHRDAppBar2Model = createModel(context, () => CHRDAppBar2Model());
    cHRDLabelColumnTextModel =
        createModel(context, () => CHRDLabelColumnTextModel());
    bandNameModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    cHRDLabelInvitUserModel =
        createModel(context, () => CHRDLabelInvitUserModel());
    cHRDLabelBtnModel = createModel(context, () => CHRDLabelBtnModel());
  }

  @override
  void dispose() {
    cHRDAppBar2Model.dispose();
    cHRDLabelColumnTextModel.dispose();
    bandNameModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    cHRDLabelInvitUserModel.dispose();
    cHRDLabelBtnModel.dispose();
  }
}
