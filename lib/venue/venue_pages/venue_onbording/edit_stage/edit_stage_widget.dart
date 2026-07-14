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
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/venue/venue_pages/venue_onbording/c_h_r_d_image_component/c_h_r_d_image_component_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_video_player_component/c_h_r_d_video_player_component_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'edit_stage_model.dart';
export 'edit_stage_model.dart';

class EditStageWidget extends StatefulWidget {
  const EditStageWidget({
    super.key,
    this.stageId,
  });

  final int? stageId;

  static String routeName = 'editStage';
  static String routePath = '/editStage';

  @override
  State<EditStageWidget> createState() => _EditStageWidgetState();
}

class _EditStageWidgetState extends State<EditStageWidget> {
  late EditStageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditStageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().performanceStageContent = [];
      safeSetState(() {});
      _model.stageDetailOutput = await VenueGroup.getStageDetailCall.call(
        pStageId: widget!.stageId,
      );

      if ((_model.stageDetailOutput?.succeeded ?? true)) {
        safeSetState(() {
          _model.descriptionTextController?.text = getJsonField(
            (_model.stageDetailOutput?.jsonBody ?? ''),
            r'''$.stage.description''',
          ).toString();
        });
        safeSetState(() {
          _model.titleTextController?.text = getJsonField(
            (_model.stageDetailOutput?.jsonBody ?? ''),
            r'''$.stage.name''',
          ).toString();
        });
        return;
      } else {
        return;
      }
    });

    _model.titleTextController ??= TextEditingController();
    _model.titleFocusNode ??= FocusNode();
    _model.titleFocusNode!.addListener(() => safeSetState(() {}));
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
                            'Edit Performance Stage for${FFAppState().vanueName}',
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
              child: Builder(
                builder: (context) {
                  if (_model.stageDetailOutput != null) {
                    return Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF25282E),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2.0, 9.5, 2.0, 9.5),
                                  child: Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: _model.titleTextController,
                                      focusNode: _model.titleFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.titleTextController',
                                        Duration(milliseconds: 0),
                                        () => safeSetState(() {}),
                                      ),
                                      autofocus: false,
                                      textInputAction: TextInputAction.next,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText: 'Title',
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        hintText: 'Main Stage',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0x8BFFFFFF),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
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
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      maxLines: null,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      enableInteractiveSelection: true,
                                      validator: _model
                                          .titleTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 4.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .neutralDark900,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller:
                                            _model.descriptionTextController,
                                        focusNode: _model.descriptionFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'Description',
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                          fillColor:
                                              FlutterFlowTheme.of(context)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        maxLines: 3,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        enableInteractiveSelection: true,
                                        validator: _model
                                            .descriptionTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (false)
                                      Builder(
                                        builder: (context) {
                                          final venueContent = functions
                                                  .addSampleFirstIndex(
                                                      FFAppState()
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
                                            itemBuilder:
                                                (context, venueContentIndex) {
                                              final venueContentItem =
                                                  venueContent[
                                                      venueContentIndex];
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
                                                          (venueContentItem
                                                                      .content !=
                                                                  null &&
                                                              venueContentItem
                                                                      .content !=
                                                                  '')) &&
                                                      (venueContentIndex != 0))
                                                    Builder(
                                                      builder: (context) =>
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
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x693B006D),
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  Image.network(
                                                                '${venueContentItem.thumbnailImage}',
                                                              ).image,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        -1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          4.0,
                                                                          0.0),
                                                                  child:
                                                                      FlutterFlowIconButton(
                                                                    borderRadius:
                                                                        100.0,
                                                                    buttonSize:
                                                                        32.0,
                                                                    fillColor:
                                                                        Color(
                                                                            0x8D000000),
                                                                    icon: Icon(
                                                                      Icons
                                                                          .close,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      size:
                                                                          16.0,
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
                                                                            venueContentItem.thumbnailImage,
                                                                        content:
                                                                            venueContentItem.content,
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
                                                                  Icons
                                                                      .play_arrow,
                                                                  color: FlutterFlowTheme.of(
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
                                                              (venueContentIndex !=
                                                                  0))
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
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  PageTransition(
                                                                    type: PageTransitionType
                                                                        .fade,
                                                                    child:
                                                                        FlutterFlowExpandedImageView(
                                                                      image: Image
                                                                          .network(
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
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  child: Image
                                                                      .network(
                                                                    '${venueContentItem.thumbnailImage}',
                                                                    width:
                                                                        110.0,
                                                                    height:
                                                                        120.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    errorBuilder: (context,
                                                                            error,
                                                                            stackTrace) =>
                                                                        Image
                                                                            .asset(
                                                                      'assets/images/error_image.jpg',
                                                                      width:
                                                                          110.0,
                                                                      height:
                                                                          120.0,
                                                                      fit: BoxFit
                                                                          .cover,
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
                                                                borderRadius:
                                                                    100.0,
                                                                buttonSize:
                                                                    32.0,
                                                                fillColor: Color(
                                                                    0x8D000000),
                                                                icon: Icon(
                                                                  Icons.close,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  size: 16.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
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
                                                                  safeSetState(
                                                                      () {});
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
                                                        decoration:
                                                            BoxDecoration(),
                                                        child:
                                                            UploadFileBtnWidget(
                                                          key: Key(
                                                              'Key2yi_${venueContentIndex}_of_${venueContent.length}'),
                                                          isContentUpload: true,
                                                          isStageContent: true,
                                                          uploadAction:
                                                              (uploadedImage,
                                                                  uploadedFile) async {
                                                            FFAppState()
                                                                    .isDataUploading =
                                                                false;
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
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final stageContent = getJsonField(
                                            (_model.stageDetailOutput
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.stage_content''',
                                          ).toList();

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
                                            itemCount: stageContent.length,
                                            itemBuilder:
                                                (context, stageContentIndex) {
                                              final stageContentItem =
                                                  stageContent[
                                                      stageContentIndex];
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (('true' ==
                                                          getJsonField(
                                                            stageContentItem,
                                                            r'''$.is_video''',
                                                          ).toString()) &&
                                                      (stageContentIndex != 0))
                                                    Expanded(
                                                      child: Builder(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
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
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
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
                                                                          '${getJsonField(
                                                                        stageContentItem,
                                                                        r'''$.content''',
                                                                      ).toString()}',
                                                                      videoThumbnail:
                                                                          '${getJsonField(
                                                                        stageContentItem,
                                                                        r'''$.content_thumbnail''',
                                                                      ).toString()}',
                                                                      contentId:
                                                                          getJsonField(
                                                                        stageContentItem,
                                                                        r'''$.id''',
                                                                      ),
                                                                      callBackAction:
                                                                          () async {
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image: Image
                                                                    .network(
                                                                  '${getJsonField(
                                                                    stageContentItem,
                                                                    r'''$.content_thumbnail''',
                                                                  ).toString()}',
                                                                ).image,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .play_arrow,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (('false' ==
                                                          getJsonField(
                                                            stageContentItem,
                                                            r'''$.is_video''',
                                                          ).toString()) &&
                                                      (stageContentIndex != 0))
                                                    Expanded(
                                                      child: Builder(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
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
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
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
                                                                        CHRDImageComponentWidget(
                                                                      imageUrl:
                                                                          getJsonField(
                                                                        stageContentItem,
                                                                        r'''$.content_thumbnail''',
                                                                      ).toString(),
                                                                      contentID:
                                                                          getJsonField(
                                                                        stageContentItem,
                                                                        r'''$.id''',
                                                                      ),
                                                                      callbackAction:
                                                                          () async {
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            child:
                                                                Image.network(
                                                              '${getJsonField(
                                                                stageContentItem,
                                                                r'''$.content_thumbnail''',
                                                              ).toString()}',
                                                              width: 100.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (stageContentIndex == 0)
                                                    Container(
                                                      height: 200.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child:
                                                          UploadFileBtnWidget(
                                                        key: Key(
                                                            'Key7tp_${stageContentIndex}_of_${stageContent.length}'),
                                                        isContentUpload: true,
                                                        uploadAction:
                                                            (uploadedImage,
                                                                uploadedFile) async {
                                                          var _shouldSetState =
                                                              false;
                                                          if (uploadedFile
                                                                  .length ==
                                                              2) {
                                                            _model.editUploadMediaFIles =
                                                                await actions
                                                                    .uploadMediaToSupabase(
                                                              uploadedFile
                                                                  .lastOrNull!,
                                                              'venueC',
                                                              'performanceStages',
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if (FFAppState()
                                                                    .userType ==
                                                                Type.Venue) {
                                                              await StageContentTable()
                                                                  .insert({
                                                                'created_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                                'content': _model
                                                                    .editUploadMediaFIles,
                                                                'stage_id':
                                                                    widget!
                                                                        .stageId,
                                                                'content_thumbnail':
                                                                    uploadedImage,
                                                              });
                                                            } else {
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                          } else {
                                                            if (FFAppState()
                                                                    .userType ==
                                                                Type.Venue) {
                                                              await StageContentTable()
                                                                  .insert({
                                                                'created_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                                'stage_id':
                                                                    widget!
                                                                        .stageId,
                                                                'content_thumbnail':
                                                                    uploadedImage,
                                                              });
                                                            } else {
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                          }

                                                          FFAppState()
                                                                  .isDataUploading =
                                                              false;
                                                          safeSetState(() {});
                                                          if (Navigator.of(
                                                                  context)
                                                              .canPop()) {
                                                            context.pop();
                                                          }
                                                          context.pushNamed(
                                                            EditStageWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'stageId':
                                                                  serializeParam(
                                                                widget!.stageId,
                                                                ParamType.int,
                                                              ),
                                                            }.withoutNulls,
                                                          );

                                                          if (_shouldSetState)
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
                    );
                  } else {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 60.0,
                          height: 60.0,
                          child: custom_widgets.CustomLoader(
                            width: 60.0,
                            height: 60.0,
                            color: FlutterFlowTheme.of(context).primaryViolet,
                          ),
                        ),
                      ],
                    );
                  }
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
                  heading: 'Update',
                  txtColor: FlutterFlowTheme.of(context).primaryText,
                  btnColor: FlutterFlowTheme.of(context).primaryViolet,
                  borderColor: FlutterFlowTheme.of(context).primaryViolet,
                  hight: 45.0,
                  headingFontSize: 14,
                  onTab: () async {
                    if (_model.formKey.currentState == null ||
                        !_model.formKey.currentState!.validate()) {
                      return;
                    }
                    await PerformanceStagesTable().update(
                      data: {
                        'name': _model.titleTextController.text,
                        'description': _model.descriptionTextController.text,
                        'updated_at':
                            supaSerialize<DateTime>(getCurrentTimestamp),
                      },
                      matchingRows: (rows) => rows.eqOrNull(
                        'id',
                        widget!.stageId,
                      ),
                    );
                    context.safePop();
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
