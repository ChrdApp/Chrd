import '/backend/api_requests/api_calls.dart';
import '/components/confirmation_dialog_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_row_with_icon/c_h_r_d_row_with_icon_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_video_player_component/c_h_r_d_video_player_component_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'venue_details_overlay_model.dart';
export 'venue_details_overlay_model.dart';

class VenueDetailsOverlayWidget extends StatefulWidget {
  const VenueDetailsOverlayWidget({
    super.key,
    required this.slotId,
  });

  final int? slotId;

  static String routeName = 'venue_details_overlay';
  static String routePath = '/venueDetailsOverlay';

  @override
  State<VenueDetailsOverlayWidget> createState() =>
      _VenueDetailsOverlayWidgetState();
}

class _VenueDetailsOverlayWidgetState extends State<VenueDetailsOverlayWidget> {
  late VenueDetailsOverlayModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VenueDetailsOverlayModel());

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
        final venueDetailsOverlayGetSingleSlotDetailsResponse = snapshot.data!;

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
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 20.0),
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
                                fadeOutDuration: Duration(milliseconds: 500),
                                imageUrl: '${true.toString()}' ==
                                        getJsonField(
                                          venueDetailsOverlayGetSingleSlotDetailsResponse
                                              .jsonBody,
                                          r'''$.data.is_booked''',
                                        ).toString()
                                    ? valueOrDefault<String>(
                                        getJsonField(
                                          venueDetailsOverlayGetSingleSlotDetailsResponse
                                              .jsonBody,
                                          r'''$.data.venue_photo''',
                                        )?.toString(),
                                        'https://kasnaqcqfuqnfydsjvpy.supabase.co/storage/v1/object/public/venueC/loginGradient.png',
                                      )
                                    : 'https://kasnaqcqfuqnfydsjvpy.supabase.co/storage/v1/object/public/venueC/error.png',
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
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                SelectTalentWidget.routeName,
                                queryParameters: {
                                  'venueId': serializeParam(
                                    0,
                                    ParamType.int,
                                  ),
                                  'slotId': serializeParam(
                                    widget!.slotId,
                                    ParamType.int,
                                  ),
                                  'venueName': serializeParam(
                                    '',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    '${getJsonField(
                                      venueDetailsOverlayGetSingleSlotDetailsResponse
                                          .jsonBody,
                                      r'''$.data.venue_name''',
                                    ).toString()}:',
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
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        SelectTalentWidget.routeName,
                                        queryParameters: {
                                          'venueId': serializeParam(
                                            getJsonField(
                                              venueDetailsOverlayGetSingleSlotDetailsResponse
                                                  .jsonBody,
                                              r'''$.data.venue_id''',
                                            ),
                                            ParamType.int,
                                          ),
                                          'slotId': serializeParam(
                                            widget!.slotId,
                                            ParamType.int,
                                          ),
                                          'venueName': serializeParam(
                                            getJsonField(
                                              venueDetailsOverlayGetSingleSlotDetailsResponse
                                                  .jsonBody,
                                              r'''$.data.venue_name''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Text(
                                      'true' ==
                                              getJsonField(
                                                venueDetailsOverlayGetSingleSlotDetailsResponse
                                                    .jsonBody,
                                                r'''$.data.is_booked''',
                                              ).toString()
                                          ? 'Musician\'s Name'
                                          : 'Invite Performer',
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
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(width: 9.0))
                        .addToStart(SizedBox(width: 19.0))
                        .addToEnd(SizedBox(width: 13.0)),
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
                            if ('None' !=
                                getJsonField(
                                  venueDetailsOverlayGetSingleSlotDetailsResponse
                                      .jsonBody,
                                  r'''$.data.repeat_type''',
                                ).toString())
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        venueDetailsOverlayGetSingleSlotDetailsResponse
                                            .jsonBody,
                                        r'''$.data.repeat_type''',
                                      ).toString()} from ${getJsonField(
                                        venueDetailsOverlayGetSingleSlotDetailsResponse
                                            .jsonBody,
                                        r'''$.data.start_date''',
                                      ).toString()} until ${getJsonField(
                                        venueDetailsOverlayGetSingleSlotDetailsResponse
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        Text(
                                          'Time zone (EST)',
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
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
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {},
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
                                                venueDetailsOverlayGetSingleSlotDetailsResponse
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
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {},
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
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
                                                  getJsonField(
                                                    venueDetailsOverlayGetSingleSlotDetailsResponse
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
                                                Text(
                                                  getJsonField(
                                                    venueDetailsOverlayGetSingleSlotDetailsResponse
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
                                          ],
                                        ),
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                subHead: getJsonField(
                                  venueDetailsOverlayGetSingleSlotDetailsResponse
                                      .jsonBody,
                                  r'''$.data.load_time''',
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
                              model: _model.cHRDRowWithIconModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: CHRDRowWithIconWidget(
                                head: 'Load duration',
                                leadingIcon: Icon(
                                  Icons.watch_later_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                subHead: getJsonField(
                                  venueDetailsOverlayGetSingleSlotDetailsResponse
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 12.0,
                                ),
                                subHead: VenueGroup.getSingleSlotDetailsCall
                                    .stageName(
                                  venueDetailsOverlayGetSingleSlotDetailsResponse
                                      .jsonBody,
                                )!,
                                showArrow: false,
                                onTap: () async {},
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                final stageImages = getJsonField(
                                  venueDetailsOverlayGetSingleSlotDetailsResponse
                                      .jsonBody,
                                  r'''$..stage_content''',
                                ).toList();

                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(stageImages.length,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                                .circular(12.0),
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
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  getJsonField(
                                    venueDetailsOverlayGetSingleSlotDetailsResponse
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
                              ].divide(SizedBox(height: 3.0)),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Builder(
                                      builder: (context) => wrapWithModel(
                                        model: _model.cHRDLabelBtnModel1,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: CHRDLabelBtnWidget(
                                          heading: 'Remove Event',
                                          txtColor: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          btnColor: FlutterFlowTheme.of(context)
                                              .btnColor,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .btnColor,
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
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.8,
                                                      child:
                                                          ConfirmationDialogWidget(
                                                        acceptbtnText: 'Remove',
                                                        title:
                                                            'Are you sure you want to remove this event?',
                                                        acceptBtnAction:
                                                            () async {
                                                          _model.deleteVenueOutput =
                                                              await VenueGroup
                                                                  .deleteVenueOpenSlotsCall
                                                                  .call(
                                                            slotId:
                                                                widget!.slotId,
                                                          );

                                                          if ((_model
                                                                  .deleteVenueOutput
                                                                  ?.succeeded ??
                                                              true)) {
                                                            await NotificationGroup
                                                                .sendVenueCancelledNotificationsCall
                                                                .call(
                                                              jsonJson:
                                                                  getJsonField(
                                                                (_model.deleteVenueOutput
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$..thread_data''',
                                                              ),
                                                            );

                                                            Navigator.pop(
                                                                context);
                                                            context.safePop();
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
                                  if ('None' !=
                                      getJsonField(
                                        venueDetailsOverlayGetSingleSlotDetailsResponse
                                            .jsonBody,
                                        r'''$.data.repeat_type''',
                                      ).toString())
                                    Expanded(
                                      child: wrapWithModel(
                                        model: _model.cHRDLabelBtnModel2,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: CHRDLabelBtnWidget(
                                          heading: 'View Sequence',
                                          txtColor: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          btnColor: Color(0xFF8B2BE3),
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryViolet,
                                          hight: 45.0,
                                          headingFontSize: 14,
                                          isDisiable: false,
                                          onTab: () async {
                                            context.pushNamed(
                                              ViewSequenceWidget.routeName,
                                              queryParameters: {
                                                'groupId': serializeParam(
                                                  getJsonField(
                                                    venueDetailsOverlayGetSingleSlotDetailsResponse
                                                        .jsonBody,
                                                    r'''$..group_uuid''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 13.0))
                              .addToStart(SizedBox(height: 28.0))
                              .addToEnd(SizedBox(height: 18.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        FFAppState().slotEndDate = null;
                        FFAppState().slotRepeatType = 'None';
                        FFAppState().startTime = null;
                        FFAppState().endTime = null;
                        safeSetState(() {});
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed(
                          EditingVenueOpenSlotsWidget.routeName,
                          queryParameters: {
                            'slotId': serializeParam(
                              widget!.slotId,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: 'Edit',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 45.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryViolet,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: wrapWithModel(
                      model: _model.cHRDLabelBtnModel3,
                      updateCallback: () => safeSetState(() {}),
                      child: CHRDLabelBtnWidget(
                        heading: 'Send to Performer',
                        txtColor: FlutterFlowTheme.of(context).primaryText,
                        btnColor: FlutterFlowTheme.of(context).primaryViolet,
                        borderColor: FlutterFlowTheme.of(context).btnColor,
                        hight: 45.0,
                        headingFontSize: 14,
                        isDisiable: false,
                        onTab: () async {
                          context.pushNamed(
                            SelectTalentWidget.routeName,
                            queryParameters: {
                              'venueId': serializeParam(
                                getJsonField(
                                  venueDetailsOverlayGetSingleSlotDetailsResponse
                                      .jsonBody,
                                  r'''$.data.venue_id''',
                                ),
                                ParamType.int,
                              ),
                              'slotId': serializeParam(
                                widget!.slotId,
                                ParamType.int,
                              ),
                              'venueName': serializeParam(
                                getJsonField(
                                  venueDetailsOverlayGetSingleSlotDetailsResponse
                                      .jsonBody,
                                  r'''$.data.venue_name''',
                                ).toString(),
                                ParamType.String,
                              ),
                              'venueImage': serializeParam(
                                valueOrDefault<String>(
                                  getJsonField(
                                    venueDetailsOverlayGetSingleSlotDetailsResponse
                                        .jsonBody,
                                    r'''$.data.venue_photo''',
                                  )?.toString(),
                                  'https://kasnaqcqfuqnfydsjvpy.supabase.co/storage/v1/object/public/venueC/loginGradient.png',
                                ),
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                      ),
                    ),
                  ),
                ]
                    .addToStart(SizedBox(height: 28.0))
                    .addToEnd(SizedBox(height: 33.0)),
              ),
            ),
          ),
        );
      },
    );
  }
}
