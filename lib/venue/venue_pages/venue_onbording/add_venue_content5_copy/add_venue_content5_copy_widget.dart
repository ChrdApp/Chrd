import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_app_bar2/c_h_r_d_app_bar2_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_video_player_component/c_h_r_d_video_player_component_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_venue_content5_copy_model.dart';
export 'add_venue_content5_copy_model.dart';

class AddVenueContent5CopyWidget extends StatefulWidget {
  const AddVenueContent5CopyWidget({super.key});

  static String routeName = 'add_venue_content5Copy';
  static String routePath = '/addVenueContent5Copy';

  @override
  State<AddVenueContent5CopyWidget> createState() =>
      _AddVenueContent5CopyWidgetState();
}

class _AddVenueContent5CopyWidgetState
    extends State<AddVenueContent5CopyWidget> {
  late AddVenueContent5CopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddVenueContent5CopyModel());

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
        backgroundColor: Colors.black,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/Rectangle_4495_(2).png',
                  ).image,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(21.0, 0.0, 19.0, 0.0),
                    child: wrapWithModel(
                      model: _model.cHRDAppBar2Model,
                      updateCallback: () => safeSetState(() {}),
                      child: CHRDAppBar2Widget(
                        step: 3,
                        skip: 'Skip',
                        progressValue: 0.3,
                        hideSkipButton: _model.hideSkipButton,
                        count: 8,
                        onNavBack: () async {
                          context.safePop();
                        },
                        onSkip: () async {
                          context.pushNamed(
                            VenueSocialMedia6Widget.routeName,
                            queryParameters: {
                              'type': serializeParam(
                                'Venue',
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                      ),
                    ),
                  ),
                ]
                    .addToStart(SizedBox(height: 56.0))
                    .addToEnd(SizedBox(height: 20.0)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          final contentList =
                              FFAppState().venueContentVenueList.toList();

                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 0.9,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: contentList.length,
                            itemBuilder: (context, contentListIndex) {
                              final contentListItem =
                                  contentList[contentListIndex];
                              return Align(
                                alignment: AlignmentDirectional(-0.27, 0.24),
                                child: Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      var _shouldSetState = false;
                                      if (contentListIndex == 0) {
                                        if (_model
                                                .isDataUploading_venueContentUrl1 ==
                                            true) {
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }

                                        _model.imageVideoPath =
                                            await actions.pickFileWithSizeLimit(
                                          context,
                                          20.0,
                                          'video',
                                        );
                                        _shouldSetState = true;
                                        if (_model.imageVideoPath != null &&
                                            (_model.imageVideoPath?.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          {
                                            safeSetState(() => _model
                                                    .isDataUploading_venueContentUrl1 =
                                                true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];
                                            var selectedMedia =
                                                <SelectedFile>[];
                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles = _model
                                                      .imageVideoPath!
                                                      .bytes!
                                                      .isNotEmpty
                                                  ? [_model.imageVideoPath!]
                                                  : <FFUploadedFile>[];
                                              selectedMedia =
                                                  selectedFilesFromUploadedFiles(
                                                selectedUploadedFiles,
                                                storageFolderPath:
                                                    'venueContent',
                                              );
                                              downloadUrls =
                                                  await uploadSupabaseStorageFiles(
                                                bucketName: 'venueC',
                                                selectedFiles: selectedMedia,
                                              );
                                            } finally {
                                              _model.isDataUploading_venueContentUrl1 =
                                                  false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedMedia.length &&
                                                downloadUrls.length ==
                                                    selectedMedia.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile_venueContentUrl1 =
                                                    selectedUploadedFiles.first;
                                                _model.uploadedFileUrl_venueContentUrl1 =
                                                    downloadUrls.first;
                                              });
                                            } else {
                                              safeSetState(() {});
                                              return;
                                            }
                                          }

                                          if ((_model.uploadedFileUrl_venueContentUrl1 !=
                                                  FFAppState()
                                                      .venueContentVenueList
                                                      .lastOrNull) &&
                                              (_model.uploadedFileUrl_venueContentUrl1 !=
                                                      null &&
                                                  _model.uploadedFileUrl_venueContentUrl1 !=
                                                      '')) {
                                            FFAppState()
                                                .addToVenueContentVenueList(_model
                                                    .uploadedFileUrl_venueContentUrl1);
                                            safeSetState(() {});
                                            _model.hideSkipButton = true;
                                            safeSetState(() {});
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Video size must be under 20 mb.',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                      } else {
                                        if (functions.isVideoUrl(FFAppState()
                                                .venueContentVenueList
                                                .elementAtOrNull(
                                                    contentListIndex)) ==
                                            true) {
                                          await showDialog(
                                            barrierColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child:
                                                      CHRDVideoPlayerComponentWidget(
                                                    videoUrl:
                                                        '${FFAppState().venueContentVenueList.elementAtOrNull(contentListIndex)}',
                                                    callBackAction: () async {},
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      }

                                      if (_shouldSetState) safeSetState(() {});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .neutralDark900,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.network(
                                            functions.isVideoUrl(FFAppState()
                                                    .venueContentVenueList
                                                    .elementAtOrNull(
                                                        contentListIndex))!
                                                ? 'https://kasnaqcqfuqnfydsjvpy.supabase.co/storage/v1/object/public/venueC/loginGradient.png'
                                                : '${contentListItem}',
                                          ).image,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Stack(
                                        children: [
                                          if (contentListIndex != 0)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 4.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderRadius: 100.0,
                                                  buttonSize: 32.0,
                                                  fillColor: Color(0x8D000000),
                                                  icon: Icon(
                                                    Icons.close,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    size: 16.0,
                                                  ),
                                                  onPressed: () async {
                                                    await deleteSupabaseFileFromPublicUrl(
                                                        FFAppState()
                                                            .venueContentVenueList
                                                            .elementAtOrNull(
                                                                contentListIndex)!);
                                                    FFAppState()
                                                        .removeAtIndexFromVenueContentVenueList(
                                                            contentListIndex);
                                                    safeSetState(() {});
                                                    if (FFAppState()
                                                            .venueContentVenueList
                                                            .length <=
                                                        1) {
                                                      _model.hideSkipButton =
                                                          false;
                                                      safeSetState(() {});
                                                    }
                                                    safeSetState(() {
                                                      _model.isDataUploading_venueContentUrl1 =
                                                          false;
                                                      _model.uploadedLocalFile_venueContentUrl1 =
                                                          FFUploadedFile(
                                                              bytes: Uint8List
                                                                  .fromList([]),
                                                              originalFilename:
                                                                  '');
                                                      _model.uploadedFileUrl_venueContentUrl1 =
                                                          '';
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          if (functions.isVideoUrl(FFAppState()
                                                  .venueContentVenueList
                                                  .elementAtOrNull(
                                                      contentListIndex)) ==
                                              true)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Builder(
                                                builder: (context) => InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showDialog(
                                                      barrierColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      dialogContext)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child:
                                                                CHRDVideoPlayerComponentWidget(
                                                              videoUrl:
                                                                  '${FFAppState().venueContentVenueList.elementAtOrNull(contentListIndex)}',
                                                              callBackAction:
                                                                  () async {},
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: FaIcon(
                                                    FontAwesomeIcons.video,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 40.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 14.0))
                      .addToStart(SizedBox(height: 20.0)),
                ),
              ),
            ),
            if (_model.isDataUploading_venueContentUrl1)
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
                                color: FlutterFlowTheme.of(context).primaryText,
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
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: wrapWithModel(
                model: _model.cHRDLabelBtnModel,
                updateCallback: () => safeSetState(() {}),
                child: CHRDLabelBtnWidget(
                  heading: 'Next',
                  txtColor: FlutterFlowTheme.of(context).primaryText,
                  btnColor: FlutterFlowTheme.of(context).primaryViolet,
                  borderColor: FlutterFlowTheme.of(context).primaryViolet,
                  hight: 45.0,
                  headingFontSize: 14,
                  isDisiable: FFAppState().venueContentVenueList.length <= 1,
                  onTab: () async {
                    FFAppState().updateVenueAccountCreateStruct(
                      (e) => e
                        ..content = FFAppState().venueContentVenueList.toList(),
                    );
                    safeSetState(() {});

                    context.pushNamed(
                      VenueSocialMedia6Widget.routeName,
                      queryParameters: {
                        'type': serializeParam(
                          'Venue',
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );
                  },
                ),
              ),
            ),
          ].addToEnd(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
