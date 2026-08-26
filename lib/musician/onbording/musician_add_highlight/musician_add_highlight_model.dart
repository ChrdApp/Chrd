import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_with_border/c_h_r_d_label_text_field_with_border_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'musician_add_highlight_widget.dart' show MusicianAddHighlightWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MusicianAddHighlightModel
    extends FlutterFlowModel<MusicianAddHighlightWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for highlight_name.
  late CHRDLabelTextFieldWithBorderModel highlightNameModel;
  // Stores action output result for [Custom Action - pickFileWithSizeLimit] action in IconButton widget.
  FFUploadedFile? uploadVideoImage;
  bool isDataUploading_uploadimageVideo = false;
  FFUploadedFile uploadedLocalFile_uploadimageVideo =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadimageVideo = '';

  // Stores action output result for [Custom Action - pickFileWithSizeLimit] action in IconButton widget.
  FFUploadedFile? uploadImage;
  bool isDataUploading_uploadThumbnail = false;
  FFUploadedFile uploadedLocalFile_uploadThumbnail =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadThumbnail = '';

  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel;
  // Stores action output result for [Backend Call - Insert Row] action in CHRD_Label_Btn widget.
  HighlightsRow? highlight;

  @override
  void initState(BuildContext context) {
    highlightNameModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    cHRDLabelBtnModel = createModel(context, () => CHRDLabelBtnModel());
  }

  @override
  void dispose() {
    highlightNameModel.dispose();
    cHRDLabelBtnModel.dispose();
  }
}
