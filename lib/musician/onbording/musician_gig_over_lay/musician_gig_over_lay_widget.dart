import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_icon_with_text/c_h_r_d_icon_with_text_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_video_player_component/c_h_r_d_video_player_component_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'musician_gig_over_lay_model.dart';
export 'musician_gig_over_lay_model.dart';

class MusicianGigOverLayWidget extends StatefulWidget {
  const MusicianGigOverLayWidget({
    super.key,
    required this.slotId,
    this.venueId,
    this.venueOwnerId,
  });

  final int? slotId;
  final int? venueId;
  final int? venueOwnerId;

  static String routeName = 'musician_gig_over_lay';
  static String routePath = '/musicianGigOverLay';

  @override
  State<MusicianGigOverLayWidget> createState() =>
      _MusicianGigOverLayWidgetState();
}

class _MusicianGigOverLayWidgetState extends State<MusicianGigOverLayWidget> {
  late MusicianGigOverLayModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MusicianGigOverLayModel());

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
      future: VenueGroup.getSingleSlotDetailsCall.call(
        slotId: widget!.slotId,
        pCurrentUserId: FFAppState().userId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        final musicianGigOverLayGetSingleSlotDetailsResponse = snapshot.data!;

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
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 20.0),
                          child: wrapWithModel(
                            model: _model.cHRDBackBtnModel,
                            updateCallback: () => safeSetState(() {}),
                            child: CHRDBackBtnWidget(
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                              btnAction: () async {
                                context.pop();
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xFF343840),
                              width: 1.0,
                            ),
                          ),
                          child: Container(
                            width: 48.0,
                            height: 48.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              getJsonField(
                                musicianGigOverLayGetSingleSlotDetailsResponse
                                    .jsonBody,
                                r'''$.data.venue_photo''',
                              ).toString(),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                'assets/images/error_image.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  getJsonField(
                                    musicianGigOverLayGetSingleSlotDetailsResponse
                                        .jsonBody,
                                    r'''$.data.venue_name''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Text(
                                getJsonField(
                                  musicianGigOverLayGetSingleSlotDetailsResponse
                                      .jsonBody,
                                  r'''$.data.venue_address''',
                                ).toString(),
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
                              if (widget!.venueOwnerId != FFAppState().userId)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      ViewVenuePlannerWidget.routeName,
                                      queryParameters: {
                                        'venueId': serializeParam(
                                          widget!.venueId,
                                          ParamType.int,
                                        ),
                                        'venueOwnerId': serializeParam(
                                          widget!.venueOwnerId,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Text(
                                    'View venue calendar',
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
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                          decoration: TextDecoration.underline,
                                        ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        if (false)
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'Apply for price',
                            options: FFButtonOptions(
                              height: 28.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primaryViolet,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                      ]
                          .divide(SizedBox(width: 9.0))
                          .addToStart(SizedBox(width: 19.0))
                          .addToEnd(SizedBox(width: 13.0)),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 1.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    () {
                                      if ('None' ==
                                          getJsonField(
                                            musicianGigOverLayGetSingleSlotDetailsResponse
                                                .jsonBody,
                                            r'''$.data.repeat_type''',
                                          ).toString()) {
                                        return 'One-time gig';
                                      } else if ('Daily' ==
                                          getJsonField(
                                            musicianGigOverLayGetSingleSlotDetailsResponse
                                                .jsonBody,
                                            r'''$.data.repeat_type''',
                                          ).toString()) {
                                        return 'Daily recurring';
                                      } else {
                                        return 'Weekly recurring';
                                      }
                                    }(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 55.0, 0.0),
                                    child: Text(
                                      'Repeats ${getJsonField(
                                        musicianGigOverLayGetSingleSlotDetailsResponse
                                            .jsonBody,
                                        r'''$.data.repeat_type''',
                                      ).toString()} from ${getJsonField(
                                        musicianGigOverLayGetSingleSlotDetailsResponse
                                            .jsonBody,
                                        r'''$.data.start_date''',
                                      ).toString()} until ${getJsonField(
                                        musicianGigOverLayGetSingleSlotDetailsResponse
                                            .jsonBody,
                                        r'''$.data.end_date''',
                                      ).toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic,
                                            ),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            fontStyle: FontStyle.italic,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 3.0)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 22.0, 0.0, 11.0),
                              child: Container(
                                width: double.infinity,
                                height: 0.5,
                                decoration: BoxDecoration(
                                  color: Color(0x4CFFFFFF),
                                ),
                              ),
                            ),
                            wrapWithModel(
                              model: _model.cHRDIconWithTextModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: CHRDIconWithTextWidget(
                                heading: VenueGroup.getSingleSlotDetailsCall
                                    .entertainment(
                                  musicianGigOverLayGetSingleSlotDetailsResponse
                                      .jsonBody,
                                )!,
                                icon: Icon(
                                  FFIcons.kheadsetMic,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 11.0, 0.0, 11.0),
                              child: Container(
                                width: double.infinity,
                                height: 0.5,
                                decoration: BoxDecoration(
                                  color: Color(0x4CFFFFFF),
                                ),
                              ),
                            ),
                            wrapWithModel(
                              model: _model.cHRDIconWithTextModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: CHRDIconWithTextWidget(
                                heading:
                                    VenueGroup.getSingleSlotDetailsCall.genre(
                                  musicianGigOverLayGetSingleSlotDetailsResponse
                                      .jsonBody,
                                )!,
                                icon: Icon(
                                  FFIcons.kgenres,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 11.0, 0.0, 11.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 0.5,
                                    decoration: BoxDecoration(
                                      color: Color(0x4CFFFFFF),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 11.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Date',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0x98FFFFFF),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Text(
                                              getJsonField(
                                                musicianGigOverLayGetSingleSlotDetailsResponse
                                                    .jsonBody,
                                                r'''$.data.start_date''',
                                              ).toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                            if (false)
                                              Text(
                                                'in ${_model.days}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0x98FFFFFF),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            Text(
                                              VenueGroup
                                                  .getSingleSlotDetailsCall
                                                  .startsInDuration(
                                                musicianGigOverLayGetSingleSlotDetailsResponse
                                                    .jsonBody,
                                              )!,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0x98FFFFFF),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 6.0, 0.0, 6.0),
                                        child: Container(
                                          width: 0.2,
                                          height: 82.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x19FFFFFF),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Time (EST)',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0x98FFFFFF),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '${getJsonField(
                                                    musicianGigOverLayGetSingleSlotDetailsResponse
                                                        .jsonBody,
                                                    r'''$.data.start_time''',
                                                  ).toString()}-${getJsonField(
                                                    musicianGigOverLayGetSingleSlotDetailsResponse
                                                        .jsonBody,
                                                    r'''$.data.end_time''',
                                                  ).toString()}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            if (false)
                                              Text(
                                                'in ${_model.days}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0x98FFFFFF),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            Text(
                                              VenueGroup
                                                  .getSingleSlotDetailsCall
                                                  .duration(
                                                musicianGigOverLayGetSingleSlotDetailsResponse
                                                    .jsonBody,
                                              )!,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0x98FFFFFF),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 11.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 0.5,
                                    decoration: BoxDecoration(
                                      color: Color(0x4CFFFFFF),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            wrapWithModel(
                              model: _model.cHRDIconWithTextModel3,
                              updateCallback: () => safeSetState(() {}),
                              child: CHRDIconWithTextWidget(
                                heading: '${getJsonField(
                                  musicianGigOverLayGetSingleSlotDetailsResponse
                                      .jsonBody,
                                  r'''$.data.load_time''',
                                ).toString()} load time',
                                icon: Icon(
                                  FFIcons.klordTime,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Divider(
                              height: 22.0,
                              thickness: 0.5,
                              color: Color(0x4CFFFFFF),
                            ),
                            wrapWithModel(
                              model: _model.cHRDIconWithTextModel4,
                              updateCallback: () => safeSetState(() {}),
                              child: CHRDIconWithTextWidget(
                                heading: '${getJsonField(
                                  musicianGigOverLayGetSingleSlotDetailsResponse
                                      .jsonBody,
                                  r'''$.data.load_duration''',
                                ).toString()} load duration',
                                icon: Icon(
                                  FFIcons.khistory1,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Divider(
                              height: 22.0,
                              thickness: 0.5,
                              color: Color(0x4CFFFFFF),
                            ),
                            wrapWithModel(
                              model: _model.cHRDIconWithTextModel5,
                              updateCallback: () => safeSetState(() {}),
                              child: CHRDIconWithTextWidget(
                                heading: getJsonField(
                                  musicianGigOverLayGetSingleSlotDetailsResponse
                                      .jsonBody,
                                  r'''$.data.stage_name''',
                                ).toString(),
                                icon: Icon(
                                  FFIcons.kframe483343,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 14.0,
                                ),
                              ),
                            ),
                            if (false)
                              Divider(
                                thickness: 0.5,
                                color: Color(0x4DFFFFFF),
                              ),
                            if (false)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Venue notes',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Text(
                                    'We have a strict policy of no drinking. We will provide 1 meal per person',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.normal,
                                            fontStyle: FontStyle.italic,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .neutralDark500,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.italic,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 3.0)),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final stageImages = getJsonField(
                                    musicianGigOverLayGetSingleSlotDetailsResponse
                                        .jsonBody,
                                    r'''$..stage_content''',
                                  ).toList();

                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children:
                                          List.generate(stageImages.length,
                                              (stageImagesIndex) {
                                        final stageImagesItem =
                                            stageImages[stageImagesIndex];
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (true ==
                                                getJsonField(
                                                  stageImagesItem,
                                                  r'''$.is_video''',
                                                ))
                                              Builder(
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
                                                                  '${getJsonField(
                                                                stageImagesItem,
                                                                r'''$.content''',
                                                              ).toString()}',
                                                              isViewOnly: true,
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
                                                          getJsonField(
                                                            stageImagesItem,
                                                            r'''$.content_thumbnail''',
                                                          ).toString(),
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
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.play_arrow,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (false ==
                                                getJsonField(
                                                  stageImagesItem,
                                                  r'''$.is_video''',
                                                ))
                                              Container(
                                                width: 110.0,
                                                height: 120.0,
                                                child: Stack(
                                                  children: [
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
                                                                getJsonField(
                                                                  stageImagesItem,
                                                                  r'''$.content_thumbnail''',
                                                                ).toString(),
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
                                                              tag: getJsonField(
                                                                stageImagesItem,
                                                                r'''$.content_thumbnail''',
                                                              ).toString(),
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: getJsonField(
                                                          stageImagesItem,
                                                          r'''$.content_thumbnail''',
                                                        ).toString(),
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          child: Image.network(
                                                            getJsonField(
                                                              stageImagesItem,
                                                              r'''$.content_thumbnail''',
                                                            ).toString(),
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
                                                  ],
                                                ),
                                              ),
                                          ],
                                        );
                                      }).divide(SizedBox(width: 12.0)),
                                    ),
                                  );
                                },
                              ),
                            ),
                            if (('${''}' !=
                                    getJsonField(
                                      musicianGigOverLayGetSingleSlotDetailsResponse
                                          .jsonBody,
                                      r'''$.data.notes''',
                                    ).toString()) &&
                                ('null' !=
                                    getJsonField(
                                      musicianGigOverLayGetSingleSlotDetailsResponse
                                          .jsonBody,
                                      r'''$.data.notes''',
                                    ).toString()))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.insert_drive_file_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Gig Notes',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0x7B7B7B7B),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              getJsonField(
                                                musicianGigOverLayGetSingleSlotDetailsResponse
                                                    .jsonBody,
                                                r'''$.data.notes''',
                                              ).toString(),
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                              ),
                          ]
                              .addToStart(SizedBox(height: 40.0))
                              .addToEnd(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 19.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 15.0),
                            child: wrapWithModel(
                              model: _model.cHRDLabelBtnModel,
                              updateCallback: () => safeSetState(() {}),
                              child: CHRDLabelBtnWidget(
                                heading: getJsonField(
                                  musicianGigOverLayGetSingleSlotDetailsResponse
                                      .jsonBody,
                                  r'''$..data.is_inquired''',
                                )
                                    ? 'Inquired'
                                    : 'Apply',
                                txtColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                btnColor: Color(0xFF8B2BE3),
                                borderColor:
                                    FlutterFlowTheme.of(context).primaryViolet,
                                hight: 45.0,
                                headingFontSize: 14,
                                isDisiable: false,
                                onTab: () async {
                                  var _shouldSetState = false;
                                  _model.upsertOutput =
                                      await VenueGroup.upsertGigsCall.call(
                                    venueId: widget!.venueId,
                                    musicianId: FFAppState().userId,
                                    slotid: widget!.slotId,
                                    venueOwnerId: widget!.venueOwnerId,
                                  );

                                  _shouldSetState = true;
                                  if ((_model.upsertOutput?.succeeded ??
                                      true)) {
                                    if ('true' ==
                                        getJsonField(
                                          (_model.upsertOutput?.jsonBody ?? ''),
                                          r'''$..slot_thread_is_created_now''',
                                        ).toString()) {
                                      _model.userOutput =
                                          await UsersTable().queryRows(
                                        queryFn: (q) => q.eqOrNull(
                                          'id',
                                          FFAppState().userId,
                                        ),
                                      );
                                      _shouldSetState = true;
                                      _model.sendNotificationOutput =
                                          await NotificationGroup
                                              .sendNotificationCall
                                              .call(
                                        title:
                                            '${_model.userOutput?.firstOrNull?.name} applied',
                                        description:
                                            '${_model.userOutput?.firstOrNull?.name} applied to your gig. Check now.',
                                        sendToList: (int var1) {
                                          return List<String>.from(
                                              [var1.toString()]);
                                        }(widget!.venueOwnerId!),
                                        type: 'PerformerApplied',
                                        usertype: FFAppState().userType?.name,
                                        dataJson: <String, dynamic>{
                                          'thread_id': getJsonField(
                                            (_model.upsertOutput?.jsonBody ??
                                                ''),
                                            r'''$..slot_thread_id''',
                                          ),
                                          'isVenue': 'true',
                                          'image': _model.userOutput
                                              ?.firstOrNull?.profilePhoto,
                                        },
                                      );

                                      _shouldSetState = true;
                                      await NotificationTable().insert({
                                        'user_id': widget!.venueOwnerId,
                                        'title':
                                            '${_model.userOutput?.firstOrNull?.name} applied',
                                        'description':
                                            '${_model.userOutput?.firstOrNull?.name} applied to your gig. Check now.',
                                        'type': 'PerformerApplied',
                                        'usertype': FFAppState().userType?.name,
                                        'is_read': false,
                                        'data': <String, dynamic>{
                                          'thread_id': getJsonField(
                                            (_model.upsertOutput?.jsonBody ??
                                                ''),
                                            r'''$..slot_thread_id''',
                                          ),
                                          'isVenue': 'true',
                                          'image': _model.userOutput
                                              ?.firstOrNull?.profilePhoto,
                                        },
                                        'created_at': supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                        'updated_at': supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                      });
                                    }

                                    context.pushNamed(
                                      CustomChatVenueWidget.routeName,
                                      queryParameters: {
                                        'threadId': serializeParam(
                                          getJsonField(
                                            (_model.upsertOutput?.jsonBody ??
                                                ''),
                                            r'''$..slot_thread_id''',
                                          ),
                                          ParamType.int,
                                        ),
                                        'isVenue': serializeParam(
                                          false,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                    );

                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else {
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) safeSetState(() {});
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
