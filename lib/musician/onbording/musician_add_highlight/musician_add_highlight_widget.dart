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
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'musician_add_highlight_model.dart';
export 'musician_add_highlight_model.dart';

class MusicianAddHighlightWidget extends StatefulWidget {
  const MusicianAddHighlightWidget({super.key});

  static String routeName = 'musician_add_highlight';
  static String routePath = '/musicianAddHighlight';

  @override
  State<MusicianAddHighlightWidget> createState() =>
      _MusicianAddHighlightWidgetState();
}

class _MusicianAddHighlightWidgetState
    extends State<MusicianAddHighlightWidget> {
  late MusicianAddHighlightModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MusicianAddHighlightModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.9, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Container(
                        width: 42.0,
                        height: 42.0,
                        decoration: BoxDecoration(
                          color: Color(0x2BFFFFFF),
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 6.0,
                              sigmaY: 17.6,
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(-0.15, 0.0),
                      child: Text(
                        'Add Highlight',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                ].addToStart(SizedBox(width: 16.0)),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Thumbnail Name',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        wrapWithModel(
                          model: _model.highlightNameModel,
                          updateCallback: () => safeSetState(() {}),
                          child: CHRDLabelTextFieldWithBorderWidget(
                            labelText: 'Highlight Title',
                            hintText: 'Highlight Title',
                            freezeEmailInput: true,
                            onChange: () async {
                              safeSetState(() {});
                            },
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add highlight ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 100.0,
                                  buttonSize: 82.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .neutralDark900,
                                  icon: Icon(
                                    Icons.add,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    if (_model
                                            .isDataUploading_uploadThumbnail ==
                                        false) {
                                      _model.uploadVideoImage =
                                          await actions.pickFileWithSizeLimit(
                                        context,
                                        5.0,
                                        'video',
                                      );
                                      if (_model.uploadVideoImage != null &&
                                          (_model.uploadVideoImage?.bytes
                                                  ?.isNotEmpty ??
                                              false)) {
                                        {
                                          safeSetState(() => _model
                                                  .isDataUploading_uploadimageVideo =
                                              true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];
                                          var selectedMedia = <SelectedFile>[];
                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles = _model
                                                    .uploadVideoImage!
                                                    .bytes!
                                                    .isNotEmpty
                                                ? [_model.uploadVideoImage!]
                                                : <FFUploadedFile>[];
                                            selectedMedia =
                                                selectedFilesFromUploadedFiles(
                                              selectedUploadedFiles,
                                              storageFolderPath:
                                                  'Profile Highlight',
                                            );
                                            downloadUrls =
                                                await uploadSupabaseStorageFiles(
                                              bucketName: 'musician',
                                              selectedFiles: selectedMedia,
                                            );
                                          } finally {
                                            _model.isDataUploading_uploadimageVideo =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_uploadimageVideo =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl_uploadimageVideo =
                                                  downloadUrls.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedFileUrl_uploadimageVideo !=
                                                null &&
                                            _model.uploadedFileUrl_uploadimageVideo !=
                                                '') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Success',
                                                style: GoogleFonts.montserrat(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                            ),
                                          );
                                          await deleteSupabaseFileFromPublicUrl(
                                              _model
                                                  .uploadedFileUrl_uploadimageVideo);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Error',
                                                style: GoogleFonts.montserrat(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                        }
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Current uploading is under process.',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                ),
                                if ((_model.uploadedFileUrl_uploadimageVideo !=
                                            null &&
                                        _model.uploadedFileUrl_uploadimageVideo !=
                                            '') &&
                                    !functions.isVideoUrl(_model
                                        .uploadedFileUrl_uploadimageVideo)!)
                                  Container(
                                    width: 85.0,
                                    height: 85.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      _model.uploadedFileUrl_uploadimageVideo,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                if (functions.isVideoUrl(_model
                                        .uploadedFileUrl_uploadimageVideo) ??
                                    true)
                                  FlutterFlowMediaDisplay(
                                    path:
                                        _model.uploadedFileUrl_uploadimageVideo,
                                    imageBuilder: (path) => ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        path,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    videoPlayerBuilder: (path) =>
                                        FlutterFlowVideoPlayer(
                                      path: path,
                                      width: double.infinity,
                                      autoPlay: false,
                                      looping: false,
                                      showControls: false,
                                      allowFullScreen: false,
                                      allowPlaybackSpeedMenu: false,
                                      pauseOnNavigate: false,
                                    ),
                                  ),
                              ].divide(SizedBox(height: 8.0)),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                        if (functions.isVideoUrl(
                                _model.uploadedFileUrl_uploadimageVideo) ??
                            true)
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Add a thumbnail image',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  FlutterFlowIconButton(
                                    borderRadius: 100.0,
                                    buttonSize: 82.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .neutralDark900,
                                    icon: Icon(
                                      Icons.add,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      if (_model
                                              .isDataUploading_uploadThumbnail ==
                                          false) {
                                        _model.uploadImage =
                                            await actions.pickFileWithSizeLimit(
                                          context,
                                          5.0,
                                          'image',
                                        );
                                        if (_model.uploadImage != null &&
                                            (_model.uploadImage?.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          {
                                            safeSetState(() => _model
                                                    .isDataUploading_uploadThumbnail =
                                                true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];
                                            var selectedMedia =
                                                <SelectedFile>[];
                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles = _model
                                                      .uploadImage!
                                                      .bytes!
                                                      .isNotEmpty
                                                  ? [_model.uploadImage!]
                                                  : <FFUploadedFile>[];
                                              selectedMedia =
                                                  selectedFilesFromUploadedFiles(
                                                selectedUploadedFiles,
                                                storageFolderPath:
                                                    'Profile Highlight',
                                              );
                                              downloadUrls =
                                                  await uploadSupabaseStorageFiles(
                                                bucketName: 'musician',
                                                selectedFiles: selectedMedia,
                                              );
                                            } finally {
                                              _model.isDataUploading_uploadThumbnail =
                                                  false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedMedia.length &&
                                                downloadUrls.length ==
                                                    selectedMedia.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile_uploadThumbnail =
                                                    selectedUploadedFiles.first;
                                                _model.uploadedFileUrl_uploadThumbnail =
                                                    downloadUrls.first;
                                              });
                                            } else {
                                              safeSetState(() {});
                                              return;
                                            }
                                          }

                                          if (_model.uploadedFileUrl_uploadThumbnail !=
                                                  null &&
                                              _model.uploadedFileUrl_uploadThumbnail !=
                                                  '') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Success',
                                                  style: GoogleFonts.montserrat(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15.0,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 3000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                              ),
                                            );
                                            await deleteSupabaseFileFromPublicUrl(
                                                _model
                                                    .uploadedFileUrl_uploadThumbnail);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Error',
                                                  style: GoogleFonts.montserrat(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 3000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                              ),
                                            );
                                          }
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Current uploading is under process.',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                          ),
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                  ),
                                  if (_model.uploadedFileUrl_uploadThumbnail !=
                                          null &&
                                      _model.uploadedFileUrl_uploadThumbnail !=
                                          '')
                                    Container(
                                      width: 85.0,
                                      height: 85.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        _model.uploadedFileUrl_uploadThumbnail,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                ].divide(SizedBox(width: 30.0)),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                      ]
                          .divide(SizedBox(height: 20.0))
                          .addToStart(SizedBox(height: 50.0))
                          .addToEnd(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
              ),
              if (_model.isDataUploading_uploadThumbnail ||
                  _model.isDataUploading_uploadimageVideo)
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                    child: Container(
                      width: double.infinity,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).success,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 20.0,
                                height: 20.0,
                                child: custom_widgets.CustomLoader(
                                  width: 20.0,
                                  height: 20.0,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              Text(
                                'Uploading.. ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: wrapWithModel(
                  model: _model.cHRDLabelBtnModel,
                  updateCallback: () => safeSetState(() {}),
                  child: CHRDLabelBtnWidget(
                    heading: 'Save',
                    txtColor: FlutterFlowTheme.of(context).primaryText,
                    btnColor: FlutterFlowTheme.of(context).primaryViolet,
                    borderColor: FlutterFlowTheme.of(context).primaryViolet,
                    hight: 52.0,
                    headingFontSize: 16,
                    isDisiable: (_model.highlightNameModel.textController
                                        .text !=
                                    null &&
                                _model.highlightNameModel.textController.text !=
                                    '') &&
                            (_model.uploadedFileUrl_uploadimageVideo != null &&
                                _model.uploadedFileUrl_uploadimageVideo != '')
                        ? false
                        : true,
                    onTab: () async {
                      _model.highlight = await HighlightsTable().insert({
                        'created_at':
                            supaSerialize<DateTime>(getCurrentTimestamp),
                        'highlight_video': functions.isVideoUrl(
                                    _model.uploadedFileUrl_uploadimageVideo) ==
                                true
                            ? _model.uploadedFileUrl_uploadimageVideo
                            : '',
                        'highlight_image': functions.isVideoUrl(
                                    _model.uploadedFileUrl_uploadimageVideo) ==
                                false
                            ? _model.uploadedFileUrl_uploadimageVideo
                            : '',
                        'created_by': FFAppState().userId,
                        'highlight_name':
                            _model.highlightNameModel.textController.text,
                        'thumbnnail_image': functions.isVideoUrl(
                                    _model.uploadedFileUrl_uploadimageVideo) ==
                                true
                            ? _model.uploadedFileUrl_uploadThumbnail
                            : _model.uploadedFileUrl_uploadimageVideo,
                      });

                      context.pushNamed(MusicianProfileWidget.routeName);

                      safeSetState(() {});
                    },
                  ),
                ),
              ),
            ]
                .addToStart(SizedBox(height: 16.0))
                .addToEnd(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
