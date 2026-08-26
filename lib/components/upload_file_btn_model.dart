import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'upload_file_btn_widget.dart' show UploadFileBtnWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UploadFileBtnModel extends FlutterFlowModel<UploadFileBtnWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - pickVideoImageAndThumbnail] action in IconButton widget.
  List<FFUploadedFile>? file;
  bool isDataUploading_uploadedImages = false;
  FFUploadedFile uploadedLocalFile_uploadedImages =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadedImages = '';

  // Stores action output result for [Custom Action - pickVideoImageAndThumbnail] action in Container widget.
  List<FFUploadedFile>? filesContent;
  bool isDataUploading_uploadedContentImages = false;
  FFUploadedFile uploadedLocalFile_uploadedContentImages =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadedContentImages = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
