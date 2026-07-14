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
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_with_border/c_h_r_d_label_text_field_with_border_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_video_player_component/c_h_r_d_video_player_component_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'adding_performance_stages_model.dart';
export 'adding_performance_stages_model.dart';

class AddingPerformanceStagesWidget extends StatefulWidget {
  const AddingPerformanceStagesWidget({
    super.key,
    this.venueId,
  });

  final int? venueId;

  static String routeName = 'adding_performance_stages';
  static String routePath = '/addingPerformanceStages';

  @override
  State<AddingPerformanceStagesWidget> createState() =>
      _AddingPerformanceStagesWidgetState();
}

class _AddingPerformanceStagesWidgetState
    extends State<AddingPerformanceStagesWidget> {
  late AddingPerformanceStagesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddingPerformanceStagesModel());

    _model.descriptionTextController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();

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
                    'assets/images/add_performance.png',
                  ).image,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(21.0, 0.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.cHRDBackBtnModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CHRDBackBtnWidget(
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        btnAction: () async {
                          context.safePop();
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
                        heading:
                            'Add performance stages for  ${FFAppState().vanueName}',
                        subHeading: 'Can be changed when posting gig',
                      ),
                    ),
                  ),
                ]
                    .addToStart(SizedBox(height: 56.0))
                    .addToEnd(SizedBox(height: 20.0)),
              ),
            ),
            Expanded(
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.cHRDLabelTextFieldWithBorderModel,
                          updateCallback: () => safeSetState(() {}),
                          child: CHRDLabelTextFieldWithBorderWidget(
                            labelText: 'Title',
                            hintText: 'Main Stage',
                            freezeEmailInput: true,
                            onChange: () async {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).neutralDark900,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.descriptionTextController,
                                  focusNode: _model.descriptionFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Description',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    hintText:
                                        'Please provide information about the location of this stage at your venue. Tech power notes, capacity of people and more here.',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0x8DFFFFFF),
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .neutralDark900,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  maxLines: 3,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  enableInteractiveSelection: true,
                                  validator: _model
                                      .descriptionTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (false)
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  'Images',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Container(
                                child: Builder(
                                  builder: (context) {
                                    final performanceStages = functions
                                            .addImageAtFirstIndex(FFAppState()
                                                .performanceStagesContentList
                                                .toList())
                                            ?.toList() ??
                                        [];

                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 1.0,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: performanceStages.length,
                                      itemBuilder:
                                          (context, performanceStagesIndex) {
                                        final performanceStagesItem =
                                            performanceStages[
                                                performanceStagesIndex];
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(-0.27, 0.24),
                                          child: Builder(
                                            builder: (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (performanceStagesIndex ==
                                                    0) {
                                                  final selectedMedia =
                                                      await selectMediaWithSourceBottomSheet(
                                                    context: context,
                                                    storageFolderPath:
                                                        'performanceStages',
                                                    allowPhoto: true,
                                                    allowVideo: true,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    safeSetState(() => _model
                                                            .isDataUploading_performanceStagesUrl =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    var downloadUrls =
                                                        <String>[];
                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                    originalFilename:
                                                                        m.originalFilename,
                                                                  ))
                                                              .toList();

                                                      downloadUrls =
                                                          await uploadSupabaseStorageFiles(
                                                        bucketName: 'venueC',
                                                        selectedFiles:
                                                            selectedMedia,
                                                      );
                                                    } finally {
                                                      _model.isDataUploading_performanceStagesUrl =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                                .length ==
                                                            selectedMedia
                                                                .length &&
                                                        downloadUrls.length ==
                                                            selectedMedia
                                                                .length) {
                                                      safeSetState(() {
                                                        _model.uploadedLocalFile_performanceStagesUrl =
                                                            selectedUploadedFiles
                                                                .first;
                                                        _model.uploadedFileUrl_performanceStagesUrl =
                                                            downloadUrls.first;
                                                      });
                                                    } else {
                                                      safeSetState(() {});
                                                      return;
                                                    }
                                                  }

                                                  if (_model
                                                          .uploadedFileUrl_performanceStagesUrl !=
                                                      FFAppState()
                                                          .performanceStagesContentList
                                                          .lastOrNull) {
                                                    FFAppState()
                                                        .addToPerformanceStagesContentList(
                                                            _model
                                                                .uploadedFileUrl_performanceStagesUrl);
                                                    safeSetState(() {});
                                                  } else {
                                                    return;
                                                  }
                                                } else {
                                                  if (functions.isVideoUrl(FFAppState()
                                                          .venueContentVenueList
                                                          .elementAtOrNull(
                                                              performanceStagesIndex)) ==
                                                      true) {
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
                                                                  '${FFAppState().performanceStagesContentList.elementAtOrNull(performanceStagesIndex)}',
                                                              callBackAction:
                                                                  () async {},
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    return;
                                                  }
                                                }
                                              },
                                              child: Container(
                                                width: 110.0,
                                                height: 120.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .neutralDark900,
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: Image.network(
                                                      functions.isVideoUrl(FFAppState()
                                                              .performanceStagesContentList
                                                              .elementAtOrNull(
                                                                  performanceStagesIndex))!
                                                          ? 'https://kasnaqcqfuqnfydsjvpy.supabase.co/storage/v1/object/public/venueC/loginGradient.png'
                                                          : '${performanceStagesItem}',
                                                    ).image,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    if (performanceStagesIndex !=
                                                        0)
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
                                                              await deleteSupabaseFileFromPublicUrl(FFAppState()
                                                                  .performanceStagesContentList
                                                                  .elementAtOrNull(
                                                                      performanceStagesIndex)!);
                                                              FFAppState()
                                                                  .removeAtIndexFromPerformanceStagesContentList(
                                                                      performanceStagesIndex);
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    if (functions.isVideoUrl(FFAppState()
                                                            .performanceStagesContentList
                                                            .elementAtOrNull(
                                                                performanceStagesIndex)) ==
                                                        true)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Builder(
                                                          builder: (context) =>
                                                              InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await showDialog(
                                                                barrierColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(dialogContext)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          CHRDVideoPlayerComponentWidget(
                                                                        videoUrl:
                                                                            '${FFAppState().performanceStagesContentList.elementAtOrNull(performanceStagesIndex)}',
                                                                        callBackAction:
                                                                            () async {},
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .video,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                .divide(SizedBox(height: 11.0))
                                .addToStart(SizedBox(height: 8.0)),
                          ),
                        Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  final venueContent = functions
                                          .addSampleFirstIndex(FFAppState()
                                              .performanceStageContent
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
                                    itemCount: venueContent.length,
                                    itemBuilder: (context, venueContentIndex) {
                                      final venueContentItem =
                                          venueContent[venueContentIndex];
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (((venueContentItem
                                                              .thumbnailImage !=
                                                          null &&
                                                      venueContentItem
                                                              .thumbnailImage !=
                                                          '') &&
                                                  (venueContentItem.content !=
                                                          null &&
                                                      venueContentItem
                                                              .content !=
                                                          '')) &&
                                              (venueContentIndex != 0))
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
                                          if (((venueContentItem
                                                              .thumbnailImage !=
                                                          null &&
                                                      venueContentItem
                                                              .thumbnailImage !=
                                                          '') &&
                                                  (venueContentItem.content ==
                                                          null ||
                                                      venueContentItem
                                                              .content ==
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
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.network(
                                                                '${venueContentItem.thumbnailImage}',
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
                                                              BorderRadius
                                                                  .circular(
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
                                                      'Key6tx_${venueContentIndex}_of_${venueContent.length}'),
                                                  isContentUpload: true,
                                                  isStageContent: true,
                                                  uploadAction: (uploadedImage,
                                                      uploadedFile) async {
                                                    if (uploadedFile.length ==
                                                        2) {
                                                      _model.uploadMediaFIles =
                                                          await actions
                                                              .uploadMediaToSupabase(
                                                        uploadedFile
                                                            .lastOrNull!,
                                                        'venueC',
                                                        'performanceStages',
                                                      );
                                                      if (FFAppState()
                                                              .userType ==
                                                          Type.Venue) {
                                                        FFAppState()
                                                            .addToPerformanceStageContent(
                                                                ContentListStruct(
                                                          thumbnailImage:
                                                              uploadedImage,
                                                          content: _model
                                                              .uploadMediaFIles,
                                                        ));
                                                        safeSetState(() {});
                                                      }
                                                    } else {
                                                      if (FFAppState()
                                                              .userType ==
                                                          Type.Venue) {
                                                        FFAppState()
                                                            .addToPerformanceStageContent(
                                                                ContentListStruct(
                                                          thumbnailImage:
                                                              uploadedImage,
                                                        ));
                                                        safeSetState(() {});
                                                      }
                                                    }

                                                    FFAppState()
                                                            .isDataUploading =
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
                            ]
                                .divide(SizedBox(height: 14.0))
                                .addToStart(SizedBox(height: 20.0)),
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 14.0))
                          .addToStart(SizedBox(height: 4.0)),
                    ),
                  ),
                ),
              ),
            ),
            if (_model.isDataUploading_performanceStagesUrl)
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
            if (false)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: wrapWithModel(
                  model: _model.cHRDLabelBtnModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: CHRDLabelBtnWidget(
                    heading: 'Add Stage',
                    txtColor: FlutterFlowTheme.of(context).primaryText,
                    btnColor: FlutterFlowTheme.of(context).primaryViolet,
                    borderColor: FlutterFlowTheme.of(context).primaryViolet,
                    hight: 45.0,
                    headingFontSize: 14,
                    isDisiable:
                        FFAppState().performanceStagesContentList.length < 1,
                    onTab: () async {
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        return;
                      }
                      FFAppState()
                          .removeAtIndexFromPerformanceStagesContentList(0);
                      _model.performanceStageAddResponse =
                          await PerformanceStagesTable().insert({
                        'venue_id': FFAppState().venueId,
                        'name': _model.cHRDLabelTextFieldWithBorderModel
                            .textController.text,
                        'content': FFAppState().performanceStagesContentList,
                        'description': _model.descriptionTextController.text,
                      });
                      FFAppState().performanceStagesContentList = [];
                      FFAppState().addToPerformanceStagesContentList(
                          'https://kasnaqcqfuqnfydsjvpy.supabase.co/storage/v1/object/public/venueC/addImage.png');
                      context.safePop();

                      safeSetState(() {});
                    },
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: wrapWithModel(
                model: _model.cHRDLabelBtnModel2,
                updateCallback: () => safeSetState(() {}),
                child: CHRDLabelBtnWidget(
                  heading: 'Add Stage New',
                  txtColor: FlutterFlowTheme.of(context).primaryText,
                  btnColor: FlutterFlowTheme.of(context).primaryViolet,
                  borderColor: FlutterFlowTheme.of(context).primaryViolet,
                  hight: 45.0,
                  headingFontSize: 14,
                  isDisiable: FFAppState().performanceStageContent.length < 1,
                  onTab: () async {
                    var _shouldSetState = false;
                    if (_model.formKey.currentState == null ||
                        !_model.formKey.currentState!.validate()) {
                      return;
                    }
                    _model.addedPerformanceStage =
                        await PerformanceStagesTable().insert({
                      'venue_id': FFAppState().venueId,
                      'name': _model.cHRDLabelTextFieldWithBorderModel
                          .textController.text,
                      'description': _model.descriptionTextController.text,
                      'created_at':
                          supaSerialize<DateTime>(getCurrentTimestamp),
                      'updated_at':
                          supaSerialize<DateTime>(getCurrentTimestamp),
                    });
                    _shouldSetState = true;
                    _model.stageContentInsertion =
                        await VenueGroup.insertStageContentCall.call(
                      pStageId: _model.addedPerformanceStage?.id,
                      pContentList: FFAppState()
                          .performanceStageContent
                          .map((e) => e.content)
                          .toList(),
                      pThumbnailList: FFAppState()
                          .performanceStageContent
                          .map((e) => e.thumbnailImage)
                          .toList(),
                    );

                    _shouldSetState = true;
                    if ((_model.stageContentInsertion?.succeeded ?? true)) {
                      context.safePop();
                      if (_shouldSetState) safeSetState(() {});
                      return;
                    } else {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text(getJsonField(
                              (_model.stageContentInsertion?.jsonBody ?? ''),
                              r'''$.message''',
                            ).toString()),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                      if (_shouldSetState) safeSetState(() {});
                      return;
                    }

                    if (_shouldSetState) safeSetState(() {});
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
