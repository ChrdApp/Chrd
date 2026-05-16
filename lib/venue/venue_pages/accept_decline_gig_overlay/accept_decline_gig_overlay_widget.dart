import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_accept_gig/c_h_r_d_accept_gig_widget.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_row_with_icon/c_h_r_d_row_with_icon_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_video_player_component/c_h_r_d_video_player_component_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'accept_decline_gig_overlay_model.dart';
export 'accept_decline_gig_overlay_model.dart';

class AcceptDeclineGigOverlayWidget extends StatefulWidget {
  const AcceptDeclineGigOverlayWidget({
    super.key,
    required this.slotId,
    required this.threadId,
  });

  final int? slotId;
  final int? threadId;

  static String routeName = 'accept_decline_gig_overlay';
  static String routePath = '/acceptDeclineGigOverlay';

  @override
  State<AcceptDeclineGigOverlayWidget> createState() =>
      _AcceptDeclineGigOverlayWidgetState();
}

class _AcceptDeclineGigOverlayWidgetState
    extends State<AcceptDeclineGigOverlayWidget> with TickerProviderStateMixin {
  late AcceptDeclineGigOverlayModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AcceptDeclineGigOverlayModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 1030.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 1630.0.ms,
            duration: 600.0.ms,
            begin: Offset(0, 0),
            end: Offset(0, 0.349),
          ),
        ],
      ),
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
      future: MusicianGroup.getContractDetailsCall.call(
        slotId: widget!.slotId,
        gigThreaadId: widget!.threadId,
        musicianId: FFAppState().userId,
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
        final acceptDeclineGigOverlayGetContractDetailsResponse =
            snapshot.data!;

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
              child: Stack(
                children: [
                  Column(
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 48.0,
                            height: 48.0,
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
                                stops: [0.0, 0.3, 0.4, 0.5, 0.6, 0.7, 1.0],
                                begin: AlignmentDirectional(-1.0, 0.0),
                                end: AlignmentDirectional(1.0, 0),
                              ),
                              shape: BoxShape.circle,
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(500.0),
                                  child: CachedNetworkImage(
                                    fadeInDuration: Duration(milliseconds: 500),
                                    fadeOutDuration:
                                        Duration(milliseconds: 500),
                                    imageUrl: valueOrDefault<String>(
                                      '${true.toString()}' ==
                                              getJsonField(
                                                acceptDeclineGigOverlayGetContractDetailsResponse
                                                    .jsonBody,
                                                r'''$.data.is_booked''',
                                              ).toString()
                                          ? getJsonField(
                                              acceptDeclineGigOverlayGetContractDetailsResponse
                                                  .jsonBody,
                                              r'''$.data.venue_photo''',
                                            ).toString()
                                          : 'https://kasnaqcqfuqnfydsjvpy.supabase.co/storage/v1/object/public/venueC/error.png',
                                      'https://kasnaqcqfuqnfydsjvpy.supabase.co/storage/v1/object/public/venueC/error.png',
                                    ),
                                    width: 46.0,
                                    height: 46.0,
                                    fit: BoxFit.cover,
                                    errorWidget: (context, error, stackTrace) =>
                                        Image.asset(
                                      'assets/images/error_image.jpg',
                                      width: 46.0,
                                      height: 46.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      getJsonField(
                                        acceptDeclineGigOverlayGetContractDetailsResponse
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
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    getJsonField(
                                      acceptDeclineGigOverlayGetContractDetailsResponse
                                          .jsonBody,
                                      r'''$.data.venue_address''',
                                    ).toString(),
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
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: MusicianGroup.getContractDetailsCall.isBooked(
                              acceptDeclineGigOverlayGetContractDetailsResponse
                                  .jsonBody,
                            )!
                                ? 'Booked'
                                : (MusicianGroup.getContractDetailsCall
                                            .contractPrice(
                                          acceptDeclineGigOverlayGetContractDetailsResponse
                                              .jsonBody,
                                        ) ==
                                        '\$0'
                                    ? MusicianGroup.getContractDetailsCall
                                        .slotPrice(
                                        acceptDeclineGigOverlayGetContractDetailsResponse
                                            .jsonBody,
                                      )!
                                    : MusicianGroup.getContractDetailsCall
                                        .contractPrice(
                                        acceptDeclineGigOverlayGetContractDetailsResponse
                                            .jsonBody,
                                      )!),
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
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if ('None' !=
                                    getJsonField(
                                      acceptDeclineGigOverlayGetContractDetailsResponse
                                          .jsonBody,
                                      r'''$.data.repeat_type''',
                                    ).toString())
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Reoccurring gig',
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
                                            acceptDeclineGigOverlayGetContractDetailsResponse
                                                .jsonBody,
                                            r'''$.data.repeat_type''',
                                          ).toString()} from ${getJsonField(
                                            acceptDeclineGigOverlayGetContractDetailsResponse
                                                .jsonBody,
                                            r'''$.data.start_date''',
                                          ).toString()} until ${getJsonField(
                                            acceptDeclineGigOverlayGetContractDetailsResponse
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
                                      Divider(
                                        thickness: 0.5,
                                        color: Color(0x4DFFFFFF),
                                      ),
                                    ].divide(SizedBox(height: 3.0)),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              FFIcons.kweb1,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            Text(
                                              'Time zone (EST)',
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
                                          ].divide(SizedBox(width: 10.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 0.5,
                                      decoration: BoxDecoration(
                                        color: Color(0x4CFFFFFF),
                                      ),
                                    ),
                                    Row(
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
                                                getJsonField(
                                                  acceptDeclineGigOverlayGetContractDetailsResponse
                                                      .jsonBody,
                                                  r'''$.data.start_date''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                              if (false)
                                                Text(
                                                  'in ${_model.days}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 4.0),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Time (EST)',
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
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    getJsonField(
                                                      acceptDeclineGigOverlayGetContractDetailsResponse
                                                          .jsonBody,
                                                      r'''$.data.start_time''',
                                                    ).toString(),
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                  Text(
                                                    '-',
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                  Text(
                                                    getJsonField(
                                                      acceptDeclineGigOverlayGetContractDetailsResponse
                                                          .jsonBody,
                                                      r'''$.data.end_time''',
                                                    ).toString(),
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 0.5,
                                      decoration: BoxDecoration(
                                        color: Color(0x4CFFFFFF),
                                      ),
                                    ),
                                  ],
                                ),
                                wrapWithModel(
                                  model: _model.cHRDRowWithIconModel1,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CHRDRowWithIconWidget(
                                    head: 'Load time',
                                    leadingIcon: Icon(
                                      FFIcons.klordTime,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    subHead: getJsonField(
                                      acceptDeclineGigOverlayGetContractDetailsResponse
                                          .jsonBody,
                                      r'''$.data.load_time''',
                                    ).toString(),
                                    showArrow:
                                        FFAppState().userType == Type.Venue,
                                    onTap: () async {},
                                  ),
                                ),
                                Divider(
                                  thickness: 0.5,
                                  color: Color(0x4CFFFFFF),
                                ),
                                wrapWithModel(
                                  model: _model.cHRDRowWithIconModel2,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CHRDRowWithIconWidget(
                                    head: 'Load duration',
                                    leadingIcon: Icon(
                                      Icons.watch_later_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    subHead: getJsonField(
                                      acceptDeclineGigOverlayGetContractDetailsResponse
                                          .jsonBody,
                                      r'''$.data.load_duration''',
                                    ).toString(),
                                    showArrow: false,
                                    onTap: () async {},
                                  ),
                                ),
                                Divider(
                                  thickness: 0.5,
                                  color: Color(0x4CFFFFFF),
                                ),
                                wrapWithModel(
                                  model: _model.cHRDRowWithIconModel3,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CHRDRowWithIconWidget(
                                    head: 'Stage',
                                    leadingIcon: Icon(
                                      FFIcons.kframe483343,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 12.0,
                                    ),
                                    subHead: getJsonField(
                                      acceptDeclineGigOverlayGetContractDetailsResponse
                                          .jsonBody,
                                      r'''$.data.stage_name''',
                                    ).toString(),
                                    showArrow:
                                        FFAppState().userType == Type.Venue,
                                    onTap: () async {},
                                  ),
                                ),
                                Builder(
                                  builder: (context) {
                                    final stageImages = getJsonField(
                                      acceptDeclineGigOverlayGetContractDetailsResponse
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
                                                                    '${getJsonField(
                                                                  stageImagesItem,
                                                                  r'''$.content''',
                                                                ).toString()}',
                                                                isViewOnly:
                                                                    true,
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
                                                        color:
                                                            Color(0x693B006D),
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
                                                            BorderRadius
                                                                .circular(12.0),
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
                                                                image: Image
                                                                    .network(
                                                                  getJsonField(
                                                                    stageImagesItem,
                                                                    r'''$.content_thumbnail''',
                                                                  ).toString(),
                                                                  fit: BoxFit
                                                                      .contain,
                                                                  errorBuilder: (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      Image
                                                                          .asset(
                                                                    'assets/images/error_image.jpg',
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                                allowRotation:
                                                                    false,
                                                                tag:
                                                                    getJsonField(
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
                                                            child:
                                                                Image.network(
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
                                                                fit: BoxFit
                                                                    .cover,
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
                                Divider(
                                  thickness: 0.5,
                                  color: Color(0x4DFFFFFF),
                                ),
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 55.0, 0.0),
                                      child: Text(
                                        getJsonField(
                                          acceptDeclineGigOverlayGetContractDetailsResponse
                                              .jsonBody,
                                          r'''$.data.venue_description''',
                                        ).toString(),
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
                              ]
                                  .divide(SizedBox(height: 13.0))
                                  .addToStart(SizedBox(height: 28.0))
                                  .addToEnd(SizedBox(height: 18.0)),
                            ),
                          ),
                        ),
                      ),
                      if (!MusicianGroup.getContractDetailsCall.isBooked(
                        acceptDeclineGigOverlayGetContractDetailsResponse
                            .jsonBody,
                      )!)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 5.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: wrapWithModel(
                                  model: _model.cHRDLabelBtnModel1,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CHRDLabelBtnWidget(
                                    heading: 'Decline',
                                    txtColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    btnColor:
                                        FlutterFlowTheme.of(context).btnColor,
                                    borderColor:
                                        FlutterFlowTheme.of(context).btnColor,
                                    hight: 45.0,
                                    headingFontSize: 14,
                                    isDisiable: false,
                                    onTab: () async {
                                      _model.userOutputDecline =
                                          await UsersTable().queryRows(
                                        queryFn: (q) => q.eqOrNull(
                                          'id',
                                          FFAppState().userId,
                                        ),
                                      );
                                      await GigContractsTable().update(
                                        data: {
                                          'contract_status':
                                              GigStatus.Declined.name,
                                          'updated_at': supaSerialize<DateTime>(
                                              getCurrentTimestamp),
                                        },
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'gig_thread_id',
                                          widget!.threadId,
                                        ),
                                      );
                                      await ThreadMessagesTable().insert({
                                        'created_at': supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                        'thread_id': widget!.threadId,
                                        'sender_id': FFAppState().userId,
                                        'message_type': 'toast',
                                        'message_content':
                                            'Musician Declined Gig',
                                        'alternate_message':
                                            'Gig Declined by You',
                                      });
                                      _model.sendNotificationDeclinedOutput =
                                          await NotificationGroup
                                              .sendNotificationCall
                                              .call(
                                        title:
                                            '${_model.userOutputDecline?.firstOrNull?.name} declined your request',
                                        description:
                                            '${_model.userOutputDecline?.firstOrNull?.name} declined your booking request.',
                                        sendToList: (int var1) {
                                          return List<String>.from(
                                              [var1.toString()]);
                                        }(getJsonField(
                                          acceptDeclineGigOverlayGetContractDetailsResponse
                                              .jsonBody,
                                          r'''$..created_by''',
                                        )),
                                        type: 'PerformerDeclined',
                                        usertype: FFAppState().userType?.name,
                                        dataJson: <String, dynamic>{
                                          'thread_id': widget!.threadId,
                                          'is_venue': 'true',
                                          'image': _model.userOutputDecline
                                              ?.firstOrNull?.profilePhoto,
                                        },
                                      );

                                      await NotificationTable().insert({
                                        'user_id': getJsonField(
                                          acceptDeclineGigOverlayGetContractDetailsResponse
                                              .jsonBody,
                                          r'''$..created_by''',
                                        ),
                                        'title':
                                            '${_model.userOutputDecline?.firstOrNull?.name} declined your request',
                                        'description':
                                            '${_model.userOutputDecline?.firstOrNull?.name} declined your booking request.',
                                        'type': 'PerformerDeclined',
                                        'usertype': FFAppState().userType?.name,
                                        'data': <String, dynamic>{
                                          'thread_id': widget!.threadId,
                                          'is_venue': 'true',
                                          'image': _model.userOutputDecline
                                              ?.firstOrNull?.profilePhoto,
                                        },
                                        'is_read': false,
                                        'created_at': supaSerialize<DateTime>(
                                            functions.toUtcTimestamp(
                                                getCurrentTimestamp)),
                                        'updated_at': supaSerialize<DateTime>(
                                            functions.toUtcTimestamp(
                                                getCurrentTimestamp)),
                                      });

                                      context.goNamed(
                                        CustomChatVenueWidget.routeName,
                                        queryParameters: {
                                          'threadId': serializeParam(
                                            widget!.threadId,
                                            ParamType.int,
                                          ),
                                          'isVenue': serializeParam(
                                            false,
                                            ParamType.bool,
                                          ),
                                        }.withoutNulls,
                                      );

                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Builder(
                                  builder: (context) => wrapWithModel(
                                    model: _model.cHRDLabelBtnModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CHRDLabelBtnWidget(
                                      heading: 'Accept',
                                      txtColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      btnColor: Color(0xFF8B2BE3),
                                      borderColor: FlutterFlowTheme.of(context)
                                          .primaryViolet,
                                      hight: 45.0,
                                      headingFontSize: 14,
                                      isDisiable: false,
                                      onTab: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.8,
                                                  child: CHRDAcceptGigWidget(
                                                    dateTime: getJsonField(
                                                      acceptDeclineGigOverlayGetContractDetailsResponse
                                                          .jsonBody,
                                                      r'''$.data.start_date''',
                                                    ).toString(),
                                                    price: MusicianGroup
                                                                .getContractDetailsCall
                                                                .contractPrice(
                                                              acceptDeclineGigOverlayGetContractDetailsResponse
                                                                  .jsonBody,
                                                            ) ==
                                                            '\$0'
                                                        ? MusicianGroup
                                                            .getContractDetailsCall
                                                            .slotPrice(
                                                            acceptDeclineGigOverlayGetContractDetailsResponse
                                                                .jsonBody,
                                                          )!
                                                        : MusicianGroup
                                                            .getContractDetailsCall
                                                            .contractPrice(
                                                            acceptDeclineGigOverlayGetContractDetailsResponse
                                                                .jsonBody,
                                                          )!,
                                                    acceptBtnAction: () async {
                                                      var _shouldSetState =
                                                          false;
                                                      _model.checkBookingSlot =
                                                          await MusicianGroup
                                                              .checkBookingSlotCall
                                                              .call(
                                                        pSlotId: widget!.slotId,
                                                      );

                                                      _shouldSetState = true;
                                                      if ('200' ==
                                                          getJsonField(
                                                            (_model.checkBookingSlot
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.status''',
                                                          ).toString()) {
                                                        _model.userOutputAccept =
                                                            await UsersTable()
                                                                .queryRows(
                                                          queryFn: (q) =>
                                                              q.eqOrNull(
                                                            'id',
                                                            FFAppState().userId,
                                                          ),
                                                        );
                                                        _shouldSetState = true;
                                                        await GigContractsTable()
                                                            .update(
                                                          data: {
                                                            'contract_status':
                                                                GigStatus.Booked
                                                                    .name,
                                                            'updated_at':
                                                                supaSerialize<
                                                                        DateTime>(
                                                                    getCurrentTimestamp),
                                                            'accepted_at':
                                                                supaSerialize<
                                                                        DateTime>(
                                                                    getCurrentTimestamp),
                                                          },
                                                          matchingRows:
                                                              (rows) =>
                                                                  rows.eqOrNull(
                                                            'gig_thread_id',
                                                            widget!.threadId,
                                                          ),
                                                        );
                                                        await ThreadMessagesTable()
                                                            .insert({
                                                          'created_at':
                                                              supaSerialize<
                                                                      DateTime>(
                                                                  getCurrentTimestamp),
                                                          'thread_id':
                                                              widget!.threadId,
                                                          'sender_id':
                                                              FFAppState()
                                                                  .userId,
                                                          'message_type':
                                                              'toast',
                                                          'message_content':
                                                              'Musician Accepted Gig',
                                                          'alternate_message':
                                                              'Gig Accepted by You',
                                                        });
                                                        await MusicianGroup
                                                            .bookGigCall
                                                            .call(
                                                          threadId:
                                                              widget!.threadId,
                                                          price: (String var1) {
                                                            return double.parse(
                                                                var1
                                                                    .replaceAll(
                                                                        '\$',
                                                                        '')
                                                                    .replaceAll(
                                                                        ' ',
                                                                        ''));
                                                          }(MusicianGroup
                                                              .getContractDetailsCall
                                                              .contractPrice(
                                                            acceptDeclineGigOverlayGetContractDetailsResponse
                                                                .jsonBody,
                                                          )!),
                                                        );

                                                        _model.sendNotificationAcceptedOutput =
                                                            await NotificationGroup
                                                                .sendNotificationCall
                                                                .call(
                                                          title:
                                                              '${_model.userOutputAccept?.firstOrNull?.name} accepted your request',
                                                          description:
                                                              '${_model.userOutputAccept?.firstOrNull?.name} accepted your booking. View details.',
                                                          sendToList:
                                                              (int var1) {
                                                            return List<
                                                                String>.from([
                                                              var1.toString()
                                                            ]);
                                                          }(getJsonField(
                                                            acceptDeclineGigOverlayGetContractDetailsResponse
                                                                .jsonBody,
                                                            r'''$..created_by''',
                                                          )),
                                                          type:
                                                              'PerformerAccepted',
                                                          usertype: FFAppState()
                                                              .userType
                                                              ?.name,
                                                          dataJson: <String,
                                                              dynamic>{
                                                            'thread_id': widget!
                                                                .threadId,
                                                            'is_venue': 'true',
                                                            'image': _model
                                                                .userOutputAccept
                                                                ?.firstOrNull
                                                                ?.profilePhoto,
                                                          },
                                                        );

                                                        _shouldSetState = true;
                                                        await NotificationTable()
                                                            .insert({
                                                          'user_id':
                                                              getJsonField(
                                                            acceptDeclineGigOverlayGetContractDetailsResponse
                                                                .jsonBody,
                                                            r'''$..created_by''',
                                                          ),
                                                          'title':
                                                              '${_model.userOutputAccept?.firstOrNull?.name} accepted your request',
                                                          'description':
                                                              '${_model.userOutputAccept?.firstOrNull?.name} accepted your booking. View details.',
                                                          'type':
                                                              'PerformerAccepted',
                                                          'usertype':
                                                              FFAppState()
                                                                  .userType
                                                                  ?.name,
                                                          'data':
                                                              <String, dynamic>{
                                                            'thread_id': widget!
                                                                .threadId,
                                                            'is_venue': 'true',
                                                            'image': _model
                                                                .userOutputAccept
                                                                ?.firstOrNull
                                                                ?.profilePhoto,
                                                          },
                                                          'is_read': false,
                                                          'created_at': supaSerialize<
                                                                  DateTime>(
                                                              functions
                                                                  .toUtcTimestamp(
                                                                      getCurrentTimestamp)),
                                                          'updated_at': supaSerialize<
                                                                  DateTime>(
                                                              functions
                                                                  .toUtcTimestamp(
                                                                      getCurrentTimestamp)),
                                                        });
                                                        Navigator.pop(context);
                                                        _model.showConfetti =
                                                            true;
                                                        safeSetState(() {});
                                                        await Future.delayed(
                                                          Duration(
                                                            milliseconds: 4000,
                                                          ),
                                                        );
                                                        _model.showConfetti =
                                                            false;
                                                        safeSetState(() {});

                                                        context.goNamed(
                                                          CustomChatVenueWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'threadId':
                                                                serializeParam(
                                                              widget!.threadId,
                                                              ParamType.int,
                                                            ),
                                                            'isVenue':
                                                                serializeParam(
                                                              false,
                                                              ParamType.bool,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              content: Text(
                                                                  getJsonField(
                                                                (_model.checkBookingSlot
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.message''',
                                                              ).toString()),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                        return;
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );

                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                      if (MusicianGroup.getContractDetailsCall.isBooked(
                            acceptDeclineGigOverlayGetContractDetailsResponse
                                .jsonBody,
                          ) ??
                          true)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 5.0, 20.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.safePop();
                            },
                            text: 'Close',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 45.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primaryViolet,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                    ]
                        .addToStart(SizedBox(height: 28.0))
                        .addToEnd(SizedBox(height: 33.0)),
                  ),
                  if (_model.showConfetti)
                    Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/046_Confetti_Overlay.png',
                          ).image,
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
