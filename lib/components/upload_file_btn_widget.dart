import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'upload_file_btn_model.dart';
export 'upload_file_btn_model.dart';

class UploadFileBtnWidget extends StatefulWidget {
  const UploadFileBtnWidget({
    super.key,
    required this.uploadAction,
    bool? isContentUpload,
  }) : this.isContentUpload = isContentUpload ?? false;

  final Future Function(
      String uploadedImage, List<FFUploadedFile> uploadedFile)? uploadAction;
  final bool isContentUpload;

  @override
  State<UploadFileBtnWidget> createState() => _UploadFileBtnWidgetState();
}

class _UploadFileBtnWidgetState extends State<UploadFileBtnWidget> {
  late UploadFileBtnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadFileBtnModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!widget!.isContentUpload)
          FlutterFlowIconButton(
            borderRadius: 100.0,
            buttonSize: 82.0,
            fillColor: FlutterFlowTheme.of(context).neutralDark900,
            icon: Icon(
              Icons.add,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
            onPressed: () async {
              _model.file = await actions.pickVideoImageAndThumbnail(
                context,
              );
              if (_model.file != null && (_model.file)!.isNotEmpty) {
                {
                  safeSetState(
                      () => _model.isDataUploading_uploadedImages = true);
                  var selectedUploadedFiles = <FFUploadedFile>[];
                  var selectedMedia = <SelectedFile>[];
                  var downloadUrls = <String>[];
                  try {
                    selectedUploadedFiles =
                        _model.file!.firstOrNull!.bytes!.isNotEmpty
                            ? [_model.file!.firstOrNull!]
                            : <FFUploadedFile>[];
                    selectedMedia = selectedFilesFromUploadedFiles(
                      selectedUploadedFiles,
                      storageFolderPath: 'Profile Highlight',
                    );
                    downloadUrls = await uploadSupabaseStorageFiles(
                      bucketName: 'musician',
                      selectedFiles: selectedMedia,
                    );
                  } finally {
                    _model.isDataUploading_uploadedImages = false;
                  }
                  if (selectedUploadedFiles.length == selectedMedia.length &&
                      downloadUrls.length == selectedMedia.length) {
                    safeSetState(() {
                      _model.uploadedLocalFile_uploadedImages =
                          selectedUploadedFiles.first;
                      _model.uploadedFileUrl_uploadedImages =
                          downloadUrls.first;
                    });
                  } else {
                    safeSetState(() {});
                    return;
                  }
                }

                await widget.uploadAction?.call(
                  _model.uploadedFileUrl_uploadedImages,
                  _model.file!,
                );
              }

              safeSetState(() {});
            },
          ),
        if (!widget!.isContentUpload)
          Text(
            'Add Highlight',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
        if (widget!.isContentUpload)
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              var _shouldSetState = false;
              if (!FFAppState().isDataUploading) {
                _model.filesContent = await actions.pickVideoImageAndThumbnail(
                  context,
                );
                _shouldSetState = true;
                if (_model.filesContent != null &&
                    (_model.filesContent)!.isNotEmpty) {
                  FFAppState().isDataUploading = true;
                  FFAppState().update(() {});
                  {
                    safeSetState(() =>
                        _model.isDataUploading_uploadedContentImages = true);
                    var selectedUploadedFiles = <FFUploadedFile>[];
                    var selectedMedia = <SelectedFile>[];
                    var downloadUrls = <String>[];
                    try {
                      selectedUploadedFiles =
                          _model.filesContent!.firstOrNull!.bytes!.isNotEmpty
                              ? [_model.filesContent!.firstOrNull!]
                              : <FFUploadedFile>[];
                      selectedMedia = selectedFilesFromUploadedFiles(
                        selectedUploadedFiles,
                        storageFolderPath:
                            FFAppState().userType == Type.Musician
                                ? 'Musician Content'
                                : 'venueContent',
                      );
                      downloadUrls = await uploadSupabaseStorageFiles(
                        bucketName: FFAppState().userType == Type.Musician
                            ? 'musician'
                            : 'venueC',
                        selectedFiles: selectedMedia,
                      );
                    } finally {
                      _model.isDataUploading_uploadedContentImages = false;
                    }
                    if (selectedUploadedFiles.length == selectedMedia.length &&
                        downloadUrls.length == selectedMedia.length) {
                      safeSetState(() {
                        _model.uploadedLocalFile_uploadedContentImages =
                            selectedUploadedFiles.first;
                        _model.uploadedFileUrl_uploadedContentImages =
                            downloadUrls.first;
                      });
                    } else {
                      safeSetState(() {});
                      return;
                    }
                  }

                  await widget.uploadAction?.call(
                    _model.uploadedFileUrl_uploadedContentImages,
                    _model.filesContent!,
                  );
                }
              } else {
                if (_shouldSetState) safeSetState(() {});
                return;
              }

              if (_shouldSetState) safeSetState(() {});
            },
            child: Container(
              width: 110.0,
              height: 120.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).neutralDark900,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 34.0,
              ),
            ),
          ),
      ].divide(SizedBox(height: 9.0)),
    );
  }
}
