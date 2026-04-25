import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/upload_file_btn_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_app_bar2/c_h_r_d_app_bar2_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_video_player_component/c_h_r_d_video_player_component_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'add_venue_content5_model.dart';
export 'add_venue_content5_model.dart';

class AddVenueContent5Widget extends StatefulWidget {
  const AddVenueContent5Widget({
    super.key,
    this.venueId,
  });

  final int? venueId;

  static String routeName = 'add_venue_content5';
  static String routePath = '/addVenueContent5';

  @override
  State<AddVenueContent5Widget> createState() => _AddVenueContent5WidgetState();
}

class _AddVenueContent5WidgetState extends State<AddVenueContent5Widget> {
  late AddVenueContent5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddVenueContent5Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.venueId != null) {
        FFAppState().contentList = [];
        safeSetState(() {});
        _model.venueImageOutput = await VenueContentTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'venue_id',
            widget!.venueId,
          ),
        );
        for (int loop1Index = 0;
            loop1Index < _model.venueImageOutput!.length;
            loop1Index++) {
          final currentLoop1Item = _model.venueImageOutput![loop1Index];
          FFAppState().addToContentList(ContentListStruct(
            thumbnailImage: _model.venueImageOutput
                ?.elementAtOrNull(loop1Index)
                ?.venueThumbnail,
            content:
                _model.venueImageOutput?.elementAtOrNull(loop1Index)?.content,
          ));
          safeSetState(() {});
        }
      } else {
        return;
      }
    });

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
                        step: FFAppState().userType == Type.Musician ? 5 : 3,
                        skip: 'Skip',
                        progressValue:
                            FFAppState().userType == Type.Musician ? 0.75 : 0.3,
                        hideSkipButton: widget!.venueId != null ? true : false,
                        count: FFAppState().userType == Type.Musician ? 6 : 8,
                        isEdit: widget!.venueId != null ? true : false,
                        onNavBack: () async {
                          context.pop();
                        },
                        onSkip: () async {
                          context.pushNamed(
                            VenueSocialMedia6Widget.routeName,
                            queryParameters: {
                              'type': serializeParam(
                                FFAppState().userType?.name,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.cHRDLabelColumnTextModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CHRDLabelColumnTextWidget(
                        heading: FFAppState().userType == Type.Venue
                            ? 'Add content for ${FFAppState().vanueName}'
                            : 'Add Content',
                        subHeading: FFAppState().userType == Type.Venue
                            ? 'Upload photos or videos to showcase your venue space and highlight the best moments to attract more bookings'
                            : 'Upload photos or videos to showcase your talents',
                      ),
                    ),
                  ),
                ]
                    .addToStart(SizedBox(height: 56.0))
                    .addToEnd(SizedBox(height: 20.0)),
              ),
            ),
            if (false)
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            final contentList = FFAppState()
                                .venueContentVenueList
                                .map((e) => e)
                                .toList();

                            return GridView.builder(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                0,
                                0,
                                12.0,
                              ),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 1.0,
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
                                                  .isDataUploading_venueContentUrl ==
                                              true) {
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }

                                          _model.imageVideoPath = await actions
                                              .pickFileWithSizeLimit(
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
                                                      .isDataUploading_venueContentUrl =
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
                                                      FFAppState().userType ==
                                                              Type.Musician
                                                          ? 'Musician Content'
                                                          : 'venueContent',
                                                );
                                                downloadUrls =
                                                    await uploadSupabaseStorageFiles(
                                                  bucketName:
                                                      FFAppState().userType ==
                                                              Type.Musician
                                                          ? 'musician'
                                                          : 'venueC',
                                                  selectedFiles: selectedMedia,
                                                );
                                              } finally {
                                                _model.isDataUploading_venueContentUrl =
                                                    false;
                                              }
                                              if (selectedUploadedFiles
                                                          .length ==
                                                      selectedMedia.length &&
                                                  downloadUrls.length ==
                                                      selectedMedia.length) {
                                                safeSetState(() {
                                                  _model.uploadedLocalFile_venueContentUrl =
                                                      selectedUploadedFiles
                                                          .first;
                                                  _model.uploadedFileUrl_venueContentUrl =
                                                      downloadUrls.first;
                                                });
                                              } else {
                                                safeSetState(() {});
                                                return;
                                              }
                                            }

                                            if ((_model.uploadedFileUrl_venueContentUrl !=
                                                    FFAppState()
                                                        .venueContentVenueList
                                                        .lastOrNull) &&
                                                (_model.uploadedFileUrl_venueContentUrl !=
                                                        null &&
                                                    _model.uploadedFileUrl_venueContentUrl !=
                                                        '')) {
                                              FFAppState()
                                                  .addToVenueContentVenueList(_model
                                                      .uploadedFileUrl_venueContentUrl);
                                              safeSetState(() {});
                                              _model.hideSkipButton = true;
                                              safeSetState(() {});
                                            }
                                          } else {
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
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
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
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
                                          }
                                        }

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 110.0,
                                        height: 120.0,
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
                                                    fillColor:
                                                        Color(0x8D000000),
                                                    icon: Icon(
                                                      Icons.close,
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                        _model.isDataUploading_venueContentUrl =
                                                            false;
                                                        _model.uploadedLocalFile_venueContentUrl =
                                                            FFUploadedFile(
                                                                bytes: Uint8List
                                                                    .fromList(
                                                                        []),
                                                                originalFilename:
                                                                    '');
                                                        _model.uploadedFileUrl_venueContentUrl =
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
                                                        builder:
                                                            (dialogContext) {
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
                                                      color:
                                                          FlutterFlowTheme.of(
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
            if (FFAppState().userType == Type.Venue)
              Expanded(
                child: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final venueContent = functions
                                      .addSampleFirstIndex(
                                          FFAppState().contentList.toList())
                                      ?.toList() ??
                                  [];

                              return GridView.builder(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  12.0,
                                ),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 1.0,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: venueContent.length,
                                itemBuilder: (context, venueContentIndex) {
                                  final venueContentItem =
                                      venueContent[venueContentIndex];
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (((venueContentItem.thumbnailImage !=
                                                      null &&
                                                  venueContentItem
                                                          .thumbnailImage !=
                                                      '') &&
                                              (venueContentItem.content !=
                                                      null &&
                                                  venueContentItem.content !=
                                                      '')) &&
                                          (venueContentIndex != 0))
                                        Builder(
                                          builder: (context) => InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showDialog(
                                                barrierColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child:
                                                          CHRDVideoPlayerComponentWidget(
                                                        videoUrl:
                                                            '${venueContentItem.content}',
                                                        callBackAction:
                                                            () async {},
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 110.0,
                                              height: 120.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x693B006D),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    '${venueContentItem.thumbnailImage}',
                                                  ).image,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  4.0,
                                                                  0.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderRadius: 100.0,
                                                        buttonSize: 32.0,
                                                        fillColor:
                                                            Color(0x8D000000),
                                                        icon: Icon(
                                                          Icons.close,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          size: 16.0,
                                                        ),
                                                        onPressed: () async {
                                                          await deleteSupabaseFileFromPublicUrl(
                                                              '${venueContentItem.content}');
                                                          await deleteSupabaseFileFromPublicUrl(
                                                              '${venueContentItem.thumbnailImage}');
                                                          FFAppState()
                                                              .removeFromContentList(
                                                                  ContentListStruct(
                                                            thumbnailImage:
                                                                venueContentItem
                                                                    .thumbnailImage,
                                                            content:
                                                                venueContentItem
                                                                    .content,
                                                          ));
                                                          safeSetState(() {});
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 0.0),
                                                    child: Icon(
                                                      Icons.play_arrow,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (((venueContentItem.thumbnailImage !=
                                                      null &&
                                                  venueContentItem
                                                          .thumbnailImage !=
                                                      '') &&
                                              (venueContentItem.content ==
                                                      null ||
                                                  venueContentItem.content ==
                                                      '')) &&
                                          (venueContentIndex != 0))
                                        Container(
                                          width: 110.0,
                                          height: 120.0,
                                          child: Stack(
                                            children: [
                                              if (((venueContentItem
                                                                  .thumbnailImage !=
                                                              null &&
                                                          venueContentItem
                                                                  .thumbnailImage !=
                                                              '') &&
                                                      (venueContentItem
                                                                  .content ==
                                                              null ||
                                                          venueContentItem
                                                                  .content ==
                                                              '')) &&
                                                  (venueContentIndex != 0))
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await Navigator.push(
                                                      context,
                                                      PageTransition(
                                                        type: PageTransitionType
                                                            .fade,
                                                        child:
                                                            FlutterFlowExpandedImageView(
                                                          image: Image.network(
                                                            '${venueContentItem.thumbnailImage}',
                                                            fit: BoxFit.contain,
                                                            errorBuilder: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.jpg',
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                          allowRotation: false,
                                                          tag:
                                                              '${venueContentItem.thumbnailImage}',
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag:
                                                        '${venueContentItem.thumbnailImage}',
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      child: Image.network(
                                                        '${venueContentItem.thumbnailImage}',
                                                        width: 110.0,
                                                        height: 120.0,
                                                        fit: BoxFit.cover,
                                                        errorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                          'assets/images/error_image.jpg',
                                                          width: 110.0,
                                                          height: 120.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
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
                                                    fillColor:
                                                        Color(0x8D000000),
                                                    icon: Icon(
                                                      Icons.close,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 16.0,
                                                    ),
                                                    onPressed: () async {
                                                      await deleteSupabaseFileFromPublicUrl(
                                                          venueContentItem
                                                              .thumbnailImage);
                                                      FFAppState()
                                                          .removeFromContentList(
                                                              ContentListStruct(
                                                        thumbnailImage:
                                                            venueContentItem
                                                                .thumbnailImage,
                                                      ));
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (venueContentIndex == 0)
                                        Expanded(
                                          child: Container(
                                            width: 110.0,
                                            height: 120.0,
                                            decoration: BoxDecoration(),
                                            child: UploadFileBtnWidget(
                                              key: Key(
                                                  'Keyib6_${venueContentIndex}_of_${venueContent.length}'),
                                              isContentUpload: true,
                                              uploadAction: (uploadedImage,
                                                  uploadedFile) async {
                                                if (uploadedFile.length == 2) {
                                                  _model.uploadMediaFIles =
                                                      await actions
                                                          .uploadMediaToSupabase(
                                                    uploadedFile.lastOrNull!,
                                                    FFAppState().userType ==
                                                            Type.Musician
                                                        ? 'musician'
                                                        : 'venueC',
                                                    FFAppState().userType ==
                                                            Type.Musician
                                                        ? 'Musician Content'
                                                        : 'venueContent',
                                                  );
                                                  if (FFAppState().userType ==
                                                      Type.Venue) {
                                                    FFAppState()
                                                        .addToContentList(
                                                            ContentListStruct(
                                                      thumbnailImage:
                                                          uploadedImage,
                                                      content: _model
                                                          .uploadMediaFIles,
                                                    ));
                                                    safeSetState(() {});
                                                  }
                                                } else {
                                                  if (FFAppState().userType ==
                                                      Type.Venue) {
                                                    FFAppState()
                                                        .addToContentList(
                                                            ContentListStruct(
                                                      thumbnailImage:
                                                          uploadedImage,
                                                    ));
                                                    safeSetState(() {});
                                                  }
                                                }

                                                FFAppState().isDataUploading =
                                                    false;
                                                safeSetState(() {});

                                                safeSetState(() {});
                                              },
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 14.0))
                        .addToStart(SizedBox(height: 20.0)),
                  ),
                ),
              ),
            if (FFAppState().userType == Type.Musician)
              Expanded(
                child: FutureBuilder<List<MusicianContentRow>>(
                  future: MusicianContentTable().queryRows(
                    queryFn: (q) => q.eqOrNull(
                      'created_by',
                      FFAppState().userId,
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<MusicianContentRow>
                        musicContainerMusicianContentRowList = snapshot.data!;

                    return Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final musicianContentList = functions
                                          .addDemoATfirstIndexMusician(
                                              musicContainerMusicianContentRowList
                                                  .toList())
                                          ?.toList() ??
                                      [];

                                  return GridView.builder(
                                    padding: EdgeInsets.fromLTRB(
                                      0,
                                      0,
                                      0,
                                      12.0,
                                    ),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 10.0,
                                      childAspectRatio: 1.0,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: musicianContentList.length,
                                    itemBuilder:
                                        (context, musicianContentListIndex) {
                                      final musicianContentListItem =
                                          musicianContentList[
                                              musicianContentListIndex];
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if ((musicianContentListItem
                                                          .content !=
                                                      null &&
                                                  musicianContentListItem
                                                          .content !=
                                                      '') &&
                                              (musicianContentListIndex != 0))
                                            Builder(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
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
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
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
                                                                musicianContentListItem
                                                                    .content!,
                                                            callBackAction:
                                                                () async {},
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  width: 110.0,
                                                  height: 120.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x693B006D),
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.network(
                                                        musicianContentListItem
                                                            .videoThumbnail!,
                                                      ).image,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      4.0,
                                                                      0.0),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderRadius: 100.0,
                                                            buttonSize: 32.0,
                                                            fillColor: Color(
                                                                0x8D000000),
                                                            icon: Icon(
                                                              Icons.close,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 16.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await deleteSupabaseFileFromPublicUrl(
                                                                  musicianContentListItem
                                                                      .content!);
                                                              await deleteSupabaseFileFromPublicUrl(
                                                                  musicianContentListItem
                                                                      .videoThumbnail!);
                                                              _model.deleteMusicianContent =
                                                                  await MusicianContentTable()
                                                                      .delete(
                                                                matchingRows:
                                                                    (rows) => rows
                                                                        .eqOrNull(
                                                                  'id',
                                                                  musicianContentListItem
                                                                      .id,
                                                                ),
                                                                returnRows:
                                                                    true,
                                                              );

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons.play_arrow,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if (((musicianContentListItem
                                                              .videoThumbnail !=
                                                          null &&
                                                      musicianContentListItem
                                                              .videoThumbnail !=
                                                          '') &&
                                                  (musicianContentListItem
                                                              .content ==
                                                          null ||
                                                      musicianContentListItem
                                                              .content ==
                                                          '')) &&
                                              (musicianContentListIndex != 0))
                                            Container(
                                              width: 110.0,
                                              height: 120.0,
                                              child: Stack(
                                                children: [
                                                  if (((musicianContentListItem
                                                                      .videoThumbnail !=
                                                                  null &&
                                                              musicianContentListItem
                                                                      .videoThumbnail !=
                                                                  '') &&
                                                          (musicianContentListItem
                                                                      .content ==
                                                                  null ||
                                                              musicianContentListItem
                                                                      .content ==
                                                                  '')) &&
                                                      (musicianContentListIndex !=
                                                          0))
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.network(
                                                                musicianContentListItem
                                                                    .videoThumbnail!,
                                                                fit: BoxFit
                                                                    .contain,
                                                                errorBuilder: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.jpg',
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: musicianContentListItem
                                                                  .videoThumbnail!,
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: musicianContentListItem
                                                            .videoThumbnail!,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          child: Image.network(
                                                            musicianContentListItem
                                                                .videoThumbnail!,
                                                            width: 110.0,
                                                            height: 120.0,
                                                            fit: BoxFit.cover,
                                                            errorBuilder: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.jpg',
                                                              width: 110.0,
                                                              height: 120.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  4.0,
                                                                  0.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderRadius: 100.0,
                                                        buttonSize: 32.0,
                                                        fillColor:
                                                            Color(0x8D000000),
                                                        icon: Icon(
                                                          Icons.close,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          size: 16.0,
                                                        ),
                                                        onPressed: () async {
                                                          await deleteSupabaseFileFromPublicUrl(
                                                              musicianContentListItem
                                                                  .videoThumbnail!);
                                                          _model.deleteImageContentMusician =
                                                              await MusicianContentTable()
                                                                  .delete(
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'id',
                                                              musicianContentListItem
                                                                  .id,
                                                            ),
                                                            returnRows: true,
                                                          );

                                                          safeSetState(() {});
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          if (musicianContentListIndex == 0)
                                            Container(
                                              height: 200.0,
                                              decoration: BoxDecoration(),
                                              child: UploadFileBtnWidget(
                                                key: Key(
                                                    'Keyb5l_${musicianContentListIndex}_of_${musicianContentList.length}'),
                                                isContentUpload: true,
                                                uploadAction: (uploadedImage,
                                                    uploadedFile) async {
                                                  if (uploadedFile.length ==
                                                      2) {
                                                    _model.uploadMediaMusicianFIles =
                                                        await actions
                                                            .uploadMediaToSupabase(
                                                      uploadedFile.lastOrNull!,
                                                      FFAppState().userType ==
                                                              Type.Musician
                                                          ? 'musician'
                                                          : 'venueC',
                                                      FFAppState().userType ==
                                                              Type.Musician
                                                          ? 'Musician Content'
                                                          : 'venueContent',
                                                    );
                                                    if (FFAppState().userType ==
                                                        Type.Venue) {
                                                      await VenueContentTable()
                                                          .insert({
                                                        'content': _model
                                                            .uploadMediaMusicianFIles,
                                                        'created_at': supaSerialize<
                                                                DateTime>(
                                                            getCurrentTimestamp),
                                                        'venue_id':
                                                            widget!.venueId,
                                                        'venue_thumbnail':
                                                            uploadedImage,
                                                      });
                                                    } else {
                                                      await MusicianContentTable()
                                                          .insert({
                                                        'content': _model
                                                            .uploadMediaMusicianFIles,
                                                        'created_at': supaSerialize<
                                                                DateTime>(
                                                            getCurrentTimestamp),
                                                        'created_by':
                                                            FFAppState().userId,
                                                        'video_thumbnail':
                                                            uploadedImage,
                                                      });
                                                    }
                                                  } else {
                                                    if (FFAppState().userType ==
                                                        Type.Venue) {
                                                      await VenueContentTable()
                                                          .insert({
                                                        'created_at': supaSerialize<
                                                                DateTime>(
                                                            getCurrentTimestamp),
                                                        'venue_id':
                                                            widget!.venueId,
                                                        'venue_thumbnail':
                                                            uploadedImage,
                                                      });
                                                    } else {
                                                      await MusicianContentTable()
                                                          .insert({
                                                        'created_at': supaSerialize<
                                                                DateTime>(
                                                            getCurrentTimestamp),
                                                        'created_by':
                                                            FFAppState().userId,
                                                        'video_thumbnail':
                                                            uploadedImage,
                                                      });
                                                    }
                                                  }

                                                  FFAppState().isDataUploading =
                                                      false;
                                                  safeSetState(() {});

                                                  safeSetState(() {});
                                                },
                                              ),
                                            ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ]
                            .divide(SizedBox(height: 14.0))
                            .addToStart(SizedBox(height: 20.0)),
                      ),
                    );
                  },
                ),
              ),
            if (FFAppState().isDataUploading)
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
                  heading: widget!.venueId != null ? 'Update' : 'Next',
                  txtColor: FlutterFlowTheme.of(context).primaryText,
                  btnColor: FlutterFlowTheme.of(context).primaryViolet,
                  borderColor: FlutterFlowTheme.of(context).primaryViolet,
                  hight: 45.0,
                  headingFontSize: 14,
                  onTab: () async {
                    if (widget!.venueId != null) {
                      if (FFAppState().userType == Type.Venue) {
                        _model.apiResultev9 =
                            await VenueGroup.deleteVenueCall.call(
                          pVenueId: widget!.venueId,
                          pContentJsonJson: functions
                              .convertToJson(FFAppState().contentList.toList()),
                        );

                        context.safePop();
                      }
                    } else {
                      if (FFAppState().userType == Type.Musician) {
                        for (int loop1Index = 0;
                            loop1Index < FFAppState().contentList.length;
                            loop1Index++) {
                          final currentLoop1Item =
                              FFAppState().contentList[loop1Index];
                          await MusicianContentTable().insert({
                            'created_by': FFAppState().userId,
                            'content': FFAppState()
                                .contentList
                                .elementAtOrNull(loop1Index)
                                ?.content,
                            'created_at':
                                supaSerialize<DateTime>(getCurrentTimestamp),
                            'video_thumbnail': FFAppState()
                                .contentList
                                .elementAtOrNull(loop1Index)
                                ?.thumbnailImage,
                          });
                        }
                        FFAppState().venueContentVenueList = [];
                        safeSetState(() {});

                        context.goNamed(
                          VenueSocialMedia6Widget.routeName,
                          queryParameters: {
                            'type': serializeParam(
                              Type.Musician.name,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        FFAppState().updateVenueAccountCreateStruct(
                          (e) => e
                            ..content =
                                FFAppState().venueContentVenueList.toList(),
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
                      }
                    }

                    safeSetState(() {});
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
