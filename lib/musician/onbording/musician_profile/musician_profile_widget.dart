import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/upload_file_btn_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/musician/musician_components/musician_nav_bar/musician_nav_bar_widget.dart';
import '/venue/venue_pages/venue_components/c_h_r_d_profile_post/c_h_r_d_profile_post_widget.dart';
import '/venue/venue_pages/venue_onbording/c_h_r_d_image_component/c_h_r_d_image_component_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_video_player_component/c_h_r_d_video_player_component_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'musician_profile_model.dart';
export 'musician_profile_model.dart';

class MusicianProfileWidget extends StatefulWidget {
  const MusicianProfileWidget({super.key});

  static String routeName = 'musician_profile';
  static String routePath = '/musicianProfile';

  @override
  State<MusicianProfileWidget> createState() => _MusicianProfileWidgetState();
}

class _MusicianProfileWidgetState extends State<MusicianProfileWidget> {
  late MusicianProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MusicianProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() => _model.apiRequestCompleter = null);
      await _model.waitForApiRequestCompleted();
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

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(MusicianGroup.getPerformerDetailsCall.call(
              performerId: FFAppState().userId,
              venueOwnerId: null,
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final musicianProfileGetPerformerDetailsResponse = snapshot.data!;

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
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 270.0,
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 191.0,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.asset(
                                          'assets/images/Musician_Profile_Wallpaper_Background.png',
                                        ).image,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.8),
                                    child: Container(
                                      width: 106.0,
                                      height: 106.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF01CDD0),
                                            Color(0xFF04C8D0),
                                            Color(0xFF0EBCD1),
                                            Color(0xFF20A7D4),
                                            Color(0xFF3A89D8),
                                            Color(0xFF6951DC),
                                            Color(0xFF8D28E3)
                                          ],
                                          stops: [
                                            0.0,
                                            0.3,
                                            0.4,
                                            0.5,
                                            0.6,
                                            0.7,
                                            1.0
                                          ],
                                          begin:
                                              AlignmentDirectional(-1.0, 0.0),
                                          end: AlignmentDirectional(1.0, 0),
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: 103.0,
                                          height: 103.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                Duration(milliseconds: 500),
                                            fadeOutDuration:
                                                Duration(milliseconds: 500),
                                            imageUrl: getJsonField(
                                              musicianProfileGetPerformerDetailsResponse
                                                  .jsonBody,
                                              r'''$.user.profile_photo''',
                                            ).toString(),
                                            fit: BoxFit.cover,
                                            errorWidget:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/error_image.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (false)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.4, 0.95),
                                      child: Container(
                                        width: 56.0,
                                        height: 56.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFF01CDD0),
                                              Color(0xFF04C8D0),
                                              Color(0xFF0EBCD1),
                                              Color(0xFF20A7D4),
                                              Color(0xFF3A89D8),
                                              Color(0xFF6951DC),
                                              Color(0xFF8D28E3)
                                            ],
                                            stops: [
                                              0.0,
                                              0.3,
                                              0.4,
                                              0.5,
                                              0.6,
                                              0.7,
                                              1.0
                                            ],
                                            begin:
                                                AlignmentDirectional(0.0, -1.0),
                                            end: AlignmentDirectional(0, 1.0),
                                          ),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            width: 2.0,
                                          ),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Visibility(
                                          visible: false,
                                          child: Container(
                                            width: 55.0,
                                            height: 55.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              'assets/images/User_profile_Logo.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    getJsonField(
                                      musicianProfileGetPerformerDetailsResponse
                                          .jsonBody,
                                      r'''$.user.name''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  if (false)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 2.0, 0.0, 0.0),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'DJ for ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: 'Highoff Group',
                                              style: GoogleFonts.montserrat(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryViolet,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.0,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          NavPageWidget.routeName,
                                          queryParameters: {
                                            'index': serializeParam(
                                              2,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: 62.0,
                                        height: 62.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/Group_482831_(1).png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (false)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.5, 0.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .neutralDark900,
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              RatingBarIndicator(
                                                itemBuilder: (context, index) =>
                                                    Icon(
                                                  Icons.star_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .openColor,
                                                ),
                                                direction: Axis.horizontal,
                                                rating: 3.0,
                                                unratedColor: Color(0x29FFB140),
                                                itemCount: 5,
                                                itemSize: 17.0,
                                              ),
                                              Text(
                                                '(10)',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ]
                                                .divide(SizedBox(width: 6.0))
                                                .addToStart(
                                                    SizedBox(width: 10.0))
                                                .addToEnd(
                                                    SizedBox(width: 15.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: wrapWithModel(
                                                model: _model
                                                    .cHRDProfilePostModel1,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: CHRDProfilePostWidget(
                                                  heading: '0',
                                                  subHeading: 'Gigs played',
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              child: wrapWithModel(
                                                model: _model
                                                    .cHRDProfilePostModel2,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: CHRDProfilePostWidget(
                                                  heading: getJsonField(
                                                    musicianProfileGetPerformerDetailsResponse
                                                        .jsonBody,
                                                    r'''$.musician_content_count''',
                                                  ).toString(),
                                                  subHeading: 'Posts',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 6.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                context.pushNamed(
                                                    EditMusicianProfileWidget
                                                        .routeName);
                                              },
                                              text: 'Edit Profile',
                                              options: FFButtonOptions(
                                                height: 44.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0x27FFFFFF),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .interTight(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(37.0),
                                              ),
                                            ),
                                          ),
                                          if (false)
                                            Expanded(
                                              child: FFButtonWidget(
                                                onPressed: () {
                                                  print('Button pressed ...');
                                                },
                                                text: 'Share',
                                                options: FFButtonOptions(
                                                  height: 44.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            font: GoogleFonts
                                                                .interTight(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                            ),
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: Color(0x60E8EBEE),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          37.0),
                                                ),
                                              ),
                                            ),
                                        ].divide(SizedBox(width: 10.0)),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(),
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              wrapWithModel(
                                                model:
                                                    _model.uploadFileBtnModel1,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: UploadFileBtnWidget(
                                                  uploadAction: (uploadedImage,
                                                      uploadedFile) async {
                                                    if (uploadedFile.length ==
                                                        2) {
                                                      {
                                                        safeSetState(() => _model
                                                                .isDataUploading_uploadedVideo =
                                                            true);
                                                        var selectedUploadedFiles =
                                                            <FFUploadedFile>[];
                                                        var selectedMedia =
                                                            <SelectedFile>[];
                                                        var downloadUrls =
                                                            <String>[];
                                                        try {
                                                          selectedUploadedFiles =
                                                              uploadedFile
                                                                      .lastOrNull!
                                                                      .bytes!
                                                                      .isNotEmpty
                                                                  ? [
                                                                      uploadedFile
                                                                          .lastOrNull!
                                                                    ]
                                                                  : <FFUploadedFile>[];
                                                          selectedMedia =
                                                              selectedFilesFromUploadedFiles(
                                                            selectedUploadedFiles,
                                                            storageFolderPath:
                                                                'Profile Highlight',
                                                          );
                                                          downloadUrls =
                                                              await uploadSupabaseStorageFiles(
                                                            bucketName:
                                                                'musician',
                                                            selectedFiles:
                                                                selectedMedia,
                                                          );
                                                        } finally {
                                                          _model.isDataUploading_uploadedVideo =
                                                              false;
                                                        }
                                                        if (selectedUploadedFiles
                                                                    .length ==
                                                                selectedMedia
                                                                    .length &&
                                                            downloadUrls
                                                                    .length ==
                                                                selectedMedia
                                                                    .length) {
                                                          safeSetState(() {
                                                            _model.uploadedLocalFile_uploadedVideo =
                                                                selectedUploadedFiles
                                                                    .first;
                                                            _model.uploadedFileUrl_uploadedVideo =
                                                                downloadUrls
                                                                    .first;
                                                          });
                                                        } else {
                                                          safeSetState(() {});
                                                          return;
                                                        }
                                                      }

                                                      _model.highlightVideo =
                                                          await HighlightsTable()
                                                              .insert({
                                                        'created_at': supaSerialize<
                                                                DateTime>(
                                                            getCurrentTimestamp),
                                                        'highlight_video': _model
                                                            .uploadedFileUrl_uploadedVideo,
                                                        'highlight_image':
                                                            uploadedImage,
                                                        'created_by':
                                                            FFAppState().userId,
                                                        'thumbnnail_image':
                                                            uploadedImage,
                                                      });
                                                    } else {
                                                      _model.highlightImage =
                                                          await HighlightsTable()
                                                              .insert({
                                                        'created_at': supaSerialize<
                                                                DateTime>(
                                                            getCurrentTimestamp),
                                                        'highlight_image':
                                                            uploadedImage,
                                                        'created_by':
                                                            FFAppState().userId,
                                                        'thumbnnail_image':
                                                            uploadedImage,
                                                      });
                                                    }

                                                    safeSetState(() => _model
                                                            .apiRequestCompleter =
                                                        null);
                                                    await _model
                                                        .waitForApiRequestCompleted();

                                                    safeSetState(() {});
                                                  },
                                                ),
                                              ),
                                              if (getJsonField(
                                                    musicianProfileGetPerformerDetailsResponse
                                                        .jsonBody,
                                                    r'''$.highlights''',
                                                  ) !=
                                                  null)
                                                Builder(
                                                  builder: (context) {
                                                    final stories =
                                                        getJsonField(
                                                      musicianProfileGetPerformerDetailsResponse
                                                          .jsonBody,
                                                      r'''$.highlights''',
                                                    ).toList();

                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          stories.length,
                                                          (storiesIndex) {
                                                        final storiesItem =
                                                            stories[
                                                                storiesIndex];
                                                        return Builder(
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
                                                              if (getJsonField(
                                                                storiesItem,
                                                                r'''$.is_video''',
                                                              )) {
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
                                                                              getJsonField(
                                                                            storiesItem,
                                                                            r'''$.highlight_video''',
                                                                          ).toString(),
                                                                          videoThumbnail:
                                                                              getJsonField(
                                                                            storiesItem,
                                                                            r'''$.highlight_image''',
                                                                          ).toString(),
                                                                          contentId:
                                                                              getJsonField(
                                                                            storiesItem,
                                                                            r'''$.id''',
                                                                          ),
                                                                          isHighlight:
                                                                              true,
                                                                          callBackAction:
                                                                              () async {
                                                                            safeSetState(() {});
                                                                            safeSetState(() =>
                                                                                _model.apiRequestCompleter = null);
                                                                            await _model.waitForApiRequestCompleted();
                                                                          },
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              } else {
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
                                                                            CHRDImageComponentWidget(
                                                                          imageUrl:
                                                                              getJsonField(
                                                                            storiesItem,
                                                                            r'''$.highlight_image''',
                                                                          ).toString(),
                                                                          contentID:
                                                                              getJsonField(
                                                                            storiesItem,
                                                                            r'''$.id''',
                                                                          ),
                                                                          isHighlight:
                                                                              true,
                                                                          callbackAction:
                                                                              () async {
                                                                            safeSetState(() {});
                                                                            safeSetState(() =>
                                                                                _model.apiRequestCompleter = null);
                                                                            await _model.waitForApiRequestCompleted();
                                                                          },
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              }
                                                            },
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  width: 82.0,
                                                                  height: 82.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                    ),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 72.0,
                                                                    height:
                                                                        72.0,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      fadeInDuration:
                                                                          Duration(
                                                                              milliseconds: 500),
                                                                      fadeOutDuration:
                                                                          Duration(
                                                                              milliseconds: 500),
                                                                      imageUrl:
                                                                          getJsonField(
                                                                        storiesItem,
                                                                        r'''$.highlight_image''',
                                                                      ).toString(),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Highlight',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 9.0)),
                                                            ),
                                                          ),
                                                        );
                                                      }).divide(SizedBox(
                                                          width: 20.0)),
                                                    );
                                                  },
                                                ),
                                            ].divide(SizedBox(width: 20.0)),
                                          ),
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(height: 20.0))
                                        .addToStart(SizedBox(height: 23.5))
                                        .addToEnd(SizedBox(height: 20.0)),
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    color: Color(0x33FFFFFF),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 0.0),
                                      child: Text(
                                        'Musician Statement',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Wrap(
                                          spacing: 0.0,
                                          runSpacing: 0.0,
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Text(
                                                _model.isTextExpanded
                                                    ? getJsonField(
                                                        musicianProfileGetPerformerDetailsResponse
                                                            .jsonBody,
                                                        r'''$.user.musician_statement''',
                                                      ).toString()
                                                    : ((String text) {
                                                        return text.length <=
                                                                200
                                                            ? text
                                                            : '${text.substring(0, 200)}...';
                                                      }(getJsonField(
                                                        musicianProfileGetPerformerDetailsResponse
                                                            .jsonBody,
                                                        r'''$.user.musician_statement''',
                                                      ).toString())),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            if (((getJsonField(
                                                          musicianProfileGetPerformerDetailsResponse
                                                              .jsonBody,
                                                          r'''$.user.musician_statement''',
                                                        ).toString().length >
                                                        200) ==
                                                    true) &&
                                                !_model.isTextExpanded)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (_model.isTextExpanded) {
                                                      _model.isTextExpanded =
                                                          false;
                                                      safeSetState(() {});
                                                    } else {
                                                      _model.isTextExpanded =
                                                          true;
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                  child: Text(
                                                    ' Read More',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryCyan,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 24.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                if ('' !=
                                                    getJsonField(
                                                      musicianProfileGetPerformerDetailsResponse
                                                          .jsonBody,
                                                      r'''$.social_media.instagram''',
                                                    ).toString())
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
                                                      await launchURL(
                                                          getJsonField(
                                                        musicianProfileGetPerformerDetailsResponse
                                                            .jsonBody,
                                                        r'''$.social_media.instagram''',
                                                      ).toString());
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Image.asset(
                                                          'assets/images/instagram.png',
                                                          width: 14.0,
                                                          height: 14.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        Text(
                                                          'Instagram',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if ('' !=
                                                    getJsonField(
                                                      musicianProfileGetPerformerDetailsResponse
                                                          .jsonBody,
                                                      r'''$.social_media.x''',
                                                    ).toString())
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
                                                      await launchURL(
                                                          getJsonField(
                                                        musicianProfileGetPerformerDetailsResponse
                                                            .jsonBody,
                                                        r'''$.social_media.x''',
                                                      ).toString());
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Image.asset(
                                                          'assets/images/twitter-x-icon-logo-116902890413xbfexhf8l.png',
                                                          width: 14.0,
                                                          height: 14.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        Text(
                                                          'X',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if ('' !=
                                                    getJsonField(
                                                      musicianProfileGetPerformerDetailsResponse
                                                          .jsonBody,
                                                      r'''$.social_media.facebook''',
                                                    ).toString())
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
                                                      await launchURL(
                                                          getJsonField(
                                                        musicianProfileGetPerformerDetailsResponse
                                                            .jsonBody,
                                                        r'''$.social_media.facebook''',
                                                      ).toString());
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Image.asset(
                                                          'assets/images/facebook.png',
                                                          width: 14.0,
                                                          height: 14.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        Text(
                                                          'fb',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if ('' !=
                                                    getJsonField(
                                                      musicianProfileGetPerformerDetailsResponse
                                                          .jsonBody,
                                                      r'''$.social_media.youtube''',
                                                    ).toString())
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
                                                      await launchURL(
                                                          getJsonField(
                                                        musicianProfileGetPerformerDetailsResponse
                                                            .jsonBody,
                                                        r'''$.social_media.youtube''',
                                                      ).toString());
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Image.asset(
                                                          'assets/images/youtube-logo-featured.png',
                                                          height: 14.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        Text(
                                                          'youtube',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                              ].divide(SizedBox(width: 18.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    color: Color(0x33FFFFFF),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 19.0, 0.0, 0.0),
                                      child: Text(
                                        'Posts (${getJsonField(
                                          musicianProfileGetPerformerDetailsResponse
                                              .jsonBody,
                                          r'''$.musician_content_count''',
                                        ).toString()})',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final musicianPost = getJsonField(
                                              musicianProfileGetPerformerDetailsResponse
                                                  .jsonBody,
                                              r'''$.musician_content''',
                                            ).toList();

                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                crossAxisSpacing: 10.0,
                                                mainAxisSpacing: 18.0,
                                                childAspectRatio: 1.0,
                                              ),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: musicianPost.length,
                                              itemBuilder:
                                                  (context, musicianPostIndex) {
                                                final musicianPostItem =
                                                    musicianPost[
                                                        musicianPostIndex];
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (('true' ==
                                                            getJsonField(
                                                              musicianPostItem,
                                                              r'''$.is_video''',
                                                            ).toString()) &&
                                                        (musicianPostIndex !=
                                                            0))
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
                                                                            '${getJsonField(
                                                                          musicianPostItem,
                                                                          r'''$.content''',
                                                                        ).toString()}',
                                                                        videoThumbnail:
                                                                            '${getJsonField(
                                                                          musicianPostItem,
                                                                          r'''$.video_thumbnail''',
                                                                        ).toString()}',
                                                                        contentId:
                                                                            getJsonField(
                                                                          musicianPostItem,
                                                                          r'''$.id''',
                                                                        ),
                                                                        callBackAction:
                                                                            () async {
                                                                          safeSetState(
                                                                              () {});
                                                                          safeSetState(() =>
                                                                              _model.apiRequestCompleter = null);
                                                                          await _model
                                                                              .waitForApiRequestCompleted();
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
                                                                color: Color(
                                                                    0x693B006D),
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .network(
                                                                    getJsonField(
                                                                      musicianPostItem,
                                                                      r'''$.video_thumbnail''',
                                                                    ).toString(),
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
                                                              musicianPostItem,
                                                              r'''$.is_video''',
                                                            ).toString()) &&
                                                        (musicianPostIndex !=
                                                            0))
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
                                                                          CHRDImageComponentWidget(
                                                                        imageUrl:
                                                                            getJsonField(
                                                                          musicianPostItem,
                                                                          r'''$.video_thumbnail''',
                                                                        ).toString(),
                                                                        contentID:
                                                                            getJsonField(
                                                                          musicianPostItem,
                                                                          r'''$.id''',
                                                                        ),
                                                                        callbackAction:
                                                                            () async {
                                                                          safeSetState(
                                                                              () {});
                                                                          safeSetState(() =>
                                                                              _model.apiRequestCompleter = null);
                                                                          await _model
                                                                              .waitForApiRequestCompleted();
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
                                                                  musicianPostItem,
                                                                  r'''$.video_thumbnail''',
                                                                ).toString()}',
                                                                width: 100.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (false)
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
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              var _shouldSetState =
                                                                  false;
                                                              if (musicianPostIndex ==
                                                                  0) {
                                                                if (_model
                                                                        .uploadedFileUrl_musicianPostsOutput ==
                                                                    'true') {
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                }

                                                                _model.imageVideoPathOutput =
                                                                    await actions
                                                                        .pickFileWithSizeLimit(
                                                                  context,
                                                                  20.0,
                                                                  'video',
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                if (_model.imageVideoPathOutput !=
                                                                        null &&
                                                                    (_model
                                                                            .imageVideoPathOutput
                                                                            ?.bytes
                                                                            ?.isNotEmpty ??
                                                                        false)) {
                                                                  {
                                                                    safeSetState(() =>
                                                                        _model.isDataUploading_musicianPostsOutput =
                                                                            true);
                                                                    var selectedUploadedFiles =
                                                                        <FFUploadedFile>[];
                                                                    var selectedMedia =
                                                                        <SelectedFile>[];
                                                                    var downloadUrls =
                                                                        <String>[];
                                                                    try {
                                                                      selectedUploadedFiles = _model
                                                                              .imageVideoPathOutput!
                                                                              .bytes!
                                                                              .isNotEmpty
                                                                          ? [
                                                                              _model.imageVideoPathOutput!
                                                                            ]
                                                                          : <FFUploadedFile>[];
                                                                      selectedMedia =
                                                                          selectedFilesFromUploadedFiles(
                                                                        selectedUploadedFiles,
                                                                        storageFolderPath:
                                                                            'Musician Posts',
                                                                      );
                                                                      downloadUrls =
                                                                          await uploadSupabaseStorageFiles(
                                                                        bucketName:
                                                                            'musician',
                                                                        selectedFiles:
                                                                            selectedMedia,
                                                                      );
                                                                    } finally {
                                                                      _model.isDataUploading_musicianPostsOutput =
                                                                          false;
                                                                    }
                                                                    if (selectedUploadedFiles.length ==
                                                                            selectedMedia
                                                                                .length &&
                                                                        downloadUrls.length ==
                                                                            selectedMedia.length) {
                                                                      safeSetState(
                                                                          () {
                                                                        _model.uploadedLocalFile_musicianPostsOutput =
                                                                            selectedUploadedFiles.first;
                                                                        _model.uploadedFileUrl_musicianPostsOutput =
                                                                            downloadUrls.first;
                                                                      });
                                                                    } else {
                                                                      safeSetState(
                                                                          () {});
                                                                      return;
                                                                    }
                                                                  }

                                                                  if ((_model.uploadedFileUrl_musicianPostsOutput !=
                                                                          FFAppState()
                                                                              .musicianAddImages
                                                                              .lastOrNull) &&
                                                                      (_model.uploadedFileUrl_musicianPostsOutput !=
                                                                              null &&
                                                                          _model.uploadedFileUrl_musicianPostsOutput !=
                                                                              '')) {
                                                                    await MusicianContentTable()
                                                                        .insert({
                                                                      'content':
                                                                          _model
                                                                              .uploadedFileUrl_musicianPostsOutput,
                                                                      'created_at':
                                                                          supaSerialize<DateTime>(
                                                                              getCurrentTimestamp),
                                                                      'created_by':
                                                                          FFAppState()
                                                                              .userId,
                                                                    });
                                                                    safeSetState(
                                                                        () {});
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  } else {
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                } else {
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                }
                                                              } else {
                                                                if (functions.isVideoUrl(FFAppState()
                                                                        .venueContentVenueList
                                                                        .elementAtOrNull(
                                                                            musicianPostIndex)) ==
                                                                    true) {
                                                                  await showDialog(
                                                                    barrierColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(dialogContext).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              CHRDVideoPlayerComponentWidget(
                                                                            videoUrl:
                                                                                '${FFAppState().venueContentVenueList.elementAtOrNull(musicianPostIndex)}',
                                                                            callBackAction:
                                                                                () async {},
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );

                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                } else {
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                }
                                                              }

                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                            },
                                                            child: Container(
                                                              width: 100.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x25FFFFFF),
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
                                                                  FaIcon(
                                                                    FontAwesomeIcons
                                                                        .plus,
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
                                                    if (musicianPostIndex == 0)
                                                      Container(
                                                        height: 200.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child:
                                                            UploadFileBtnWidget(
                                                          key: Key(
                                                              'Keyqql_${musicianPostIndex}_of_${musicianPost.length}'),
                                                          isContentUpload: true,
                                                          uploadAction:
                                                              (uploadedImage,
                                                                  uploadedFile) async {
                                                            if (uploadedFile
                                                                    .length ==
                                                                2) {
                                                              _model.uploadMediaMusicianFIles =
                                                                  await actions
                                                                      .uploadMediaToSupabase(
                                                                uploadedFile
                                                                    .lastOrNull!,
                                                                FFAppState().userType ==
                                                                        Type.Musician
                                                                    ? 'musician'
                                                                    : 'venueC',
                                                                FFAppState().userType ==
                                                                        Type.Musician
                                                                    ? 'Musician Content'
                                                                    : 'venueContent',
                                                              );
                                                              await MusicianContentTable()
                                                                  .insert({
                                                                'content': _model
                                                                    .uploadMediaMusicianFIles,
                                                                'created_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                                'created_by':
                                                                    FFAppState()
                                                                        .userId,
                                                                'video_thumbnail':
                                                                    uploadedImage,
                                                              });
                                                            } else {
                                                              await MusicianContentTable()
                                                                  .insert({
                                                                'created_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                                'created_by':
                                                                    FFAppState()
                                                                        .userId,
                                                                'video_thumbnail':
                                                                    uploadedImage,
                                                              });
                                                            }

                                                            FFAppState()
                                                                    .isDataUploading =
                                                                false;
                                                            safeSetState(() {});
                                                            safeSetState(() =>
                                                                _model.apiRequestCompleter =
                                                                    null);
                                                            await _model
                                                                .waitForApiRequestCompleted();
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
                                    ]
                                        .addToStart(SizedBox(height: 28.0))
                                        .addToEnd(SizedBox(height: 12.0)),
                                  ),
                                  if ((functions.isJsonLengthGreaterThan8(
                                              getJsonField(
                                            musicianProfileGetPerformerDetailsResponse
                                                .jsonBody,
                                            r'''$.musician_content''',
                                          )) ==
                                          true) &&
                                      false)
                                    FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed(
                                            MusicianProfilePostsWidget
                                                .routeName);
                                      },
                                      text: 'View More',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 31.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0x1EFFFFFF),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                ].addToEnd(SizedBox(height: 30.0)),
                              ),
                            ),
                          ].addToEnd(SizedBox(height: 25.0)),
                        ),
                      ),
                    ],
                  ),
                ),
                if (_model.isDataUploading_musicianPostsOutput ||
                    _model.isDataUploading_uploadedVideo ||
                    FFAppState().isDataUploading)
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 20.0),
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                Text(
                                  'Uploading.. ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                  wrapWithModel(
                    model: _model.musicianNavBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: MusicianNavBarWidget(
                      whichScreenActive: WhichScreenMusicianNavBar.profile,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
