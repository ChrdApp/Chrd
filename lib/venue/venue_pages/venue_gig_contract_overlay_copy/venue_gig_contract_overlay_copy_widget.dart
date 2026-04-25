import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/confirmation_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_backout_gig/c_h_r_d_backout_gig_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_price_amount/c_h_r_d_price_amount_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_performance_stages/c_h_r_d_performance_stages_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_row_with_icon/c_h_r_d_row_with_icon_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'venue_gig_contract_overlay_copy_model.dart';
export 'venue_gig_contract_overlay_copy_model.dart';

class VenueGigContractOverlayCopyWidget extends StatefulWidget {
  const VenueGigContractOverlayCopyWidget({
    super.key,
    required this.slotId,
    required this.threadId,
    this.musicianName,
  });

  final int? slotId;
  final int? threadId;
  final String? musicianName;

  static String routeName = 'venue_gig_contract_overlayCopy';
  static String routePath = '/venueGigContractOverlayCopy';

  @override
  State<VenueGigContractOverlayCopyWidget> createState() =>
      _VenueGigContractOverlayCopyWidgetState();
}

class _VenueGigContractOverlayCopyWidgetState
    extends State<VenueGigContractOverlayCopyWidget> {
  late VenueGigContractOverlayCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VenueGigContractOverlayCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoader = true;
      safeSetState(() {});
      FFAppState().startTime = null;
      FFAppState().endTime = null;
      safeSetState(() {});
      _model.singleSlotOutput = await VenueGroup.getSingleSlotDetailsCall.call(
        slotId: widget!.slotId,
      );

      if ((_model.singleSlotOutput?.succeeded ?? true)) {
        _model.days = getJsonField(
          (_model.singleSlotOutput?.jsonBody ?? ''),
          r'''$.data.start_date''',
        ).toString();
        _model.selectedStageId = getJsonField(
          (_model.singleSlotOutput?.jsonBody ?? ''),
          r'''$.data.stage_id''',
        );
        _model.loadDurationTime = getJsonField(
          (_model.singleSlotOutput?.jsonBody ?? ''),
          r'''$.data.load_duration''',
        ).toString();
        safeSetState(() {});
        FFAppState().slotRepeatType = getJsonField(
          (_model.singleSlotOutput?.jsonBody ?? ''),
          r'''$.data.repeat_type''',
        ).toString();
        FFAppState().endTime = functions.stringToDateTime(
            getJsonField(
              (_model.singleSlotOutput?.jsonBody ?? ''),
              r'''$.data.end_date''',
            ).toString(),
            getJsonField(
              (_model.singleSlotOutput?.jsonBody ?? ''),
              r'''$.data.end_time''',
            ).toString());
        FFAppState().startTime = functions.stringToDateTime(
            getJsonField(
              (_model.singleSlotOutput?.jsonBody ?? ''),
              r'''$.data.start_date''',
            ).toString(),
            getJsonField(
              (_model.singleSlotOutput?.jsonBody ?? ''),
              r'''$.data.start_time''',
            ).toString());
        FFAppState().slotEndDate = functions.parseDate(getJsonField(
          (_model.singleSlotOutput?.jsonBody ?? ''),
          r'''$.data.end_date''',
        ).toString());
        safeSetState(() {});
      }
      _model.isLoader = false;
      safeSetState(() {});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!_model.isLoader)
                Expanded(
                  child: Column(
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
                                    imageUrl: '${true.toString()}' ==
                                            getJsonField(
                                              (_model.singleSlotOutput
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.data.is_booked''',
                                            ).toString()
                                        ? getJsonField(
                                            (_model.singleSlotOutput
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.data.venue_photo''',
                                          ).toString()
                                        : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/c7i9br13v5fk/error.png',
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
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      '${getJsonField(
                                        (_model.singleSlotOutput?.jsonBody ??
                                            ''),
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
                                        if ('true' !=
                                            getJsonField(
                                              (_model.singleSlotOutput
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.data.is_booked''',
                                            ).toString()) {
                                          context.pushNamed(
                                            SelectTalentWidget.routeName,
                                            queryParameters: {
                                              'venueId': serializeParam(
                                                getJsonField(
                                                  (_model.singleSlotOutput
                                                          ?.jsonBody ??
                                                      ''),
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
                                                  (_model.singleSlotOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.data.venue_name''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        }
                                      },
                                      child: Text(
                                        'true' ==
                                                getJsonField(
                                                  (_model.singleSlotOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.data.is_booked''',
                                                ).toString()
                                            ? getJsonField(
                                                (_model.singleSlotOutput
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.data.musician_name''',
                                              ).toString()
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
                          if (('false' ==
                                  getJsonField(
                                    (_model.singleSlotOutput?.jsonBody ?? ''),
                                    r'''$.data.is_booked''',
                                  ).toString()) &&
                              (FFAppState().userType == Type.Venue))
                            Builder(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.8,
                                            child: CHRDPriceAmountWidget(
                                              confirmAction:
                                                  (priceValue) async {
                                                _model.addedPrice =
                                                    (String value) {
                                                  return double.tryParse(value
                                                          .replaceAll('\$', '')
                                                          .trim()) ??
                                                      0.0;
                                                }(priceValue);
                                                safeSetState(() {});
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                text: _model.addedPrice != null
                                    ? '\$${_model.addedPrice?.toString()}'
                                    : 'Add Price +',
                                options: FFButtonOptions(
                                  height: 28.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryViolet,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                      (_model.singleSlotOutput?.jsonBody ?? ''),
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
                                            (_model.singleSlotOutput
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.data.repeat_type''',
                                          ).toString()} from ${getJsonField(
                                            (_model.singleSlotOutput
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.data.start_date''',
                                          ).toString()} until ${getJsonField(
                                            (_model.singleSlotOutput
                                                    ?.jsonBody ??
                                                ''),
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
                                                    (_model.singleSlotOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.data.start_date''',
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      FFAppState().startTime !=
                                                              null
                                                          ? dateTimeFormat(
                                                              "jm",
                                                              FFAppState()
                                                                  .startTime)
                                                          : getJsonField(
                                                              (_model.singleSlotOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.data.start_time''',
                                                            ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                    Text(
                                                      '-',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                    Text(
                                                      getJsonField(
                                                        (_model.singleSlotOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.data.end_time''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    subHead:
                                        _model.time != null && _model.time != ''
                                            ? _model.time!
                                            : getJsonField(
                                                (_model.singleSlotOutput
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.data.load_time''',
                                              ).toString(),
                                    showArrow:
                                        FFAppState().userType == Type.Venue,
                                    onTap: () async {
                                      var _shouldSetState = false;
                                      if (FFAppState().userType == Type.Venue) {
                                        _model.selectedTimeContract =
                                            await actions
                                                .showConstrainedTimePicker(
                                          context,
                                          FFAppState().startTime!,
                                          FFAppState().startTime,
                                        );
                                        _shouldSetState = true;
                                        _model.loadDurationTime =
                                            valueOrDefault<String>(
                                          (FFAppState().startTime != null) &&
                                                  (_model.selectedTimeContract !=
                                                      null)
                                              ? functions.findTime(
                                                  _model.selectedTimeContract,
                                                  FFAppState().startTime)
                                              : '--',
                                          '-',
                                        );
                                        _model.time = dateTimeFormat(
                                            "jm", _model.selectedTimeContract);
                                        _model.isEdited = true;
                                        safeSetState(() {});
                                      } else {
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }

                                      if (_shouldSetState) safeSetState(() {});
                                    },
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
                                    subHead: _model.loadDurationTime != null &&
                                            _model.loadDurationTime != ''
                                        ? _model.loadDurationTime!
                                        : getJsonField(
                                            (_model.singleSlotOutput
                                                    ?.jsonBody ??
                                                ''),
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
                                Builder(
                                  builder: (context) => wrapWithModel(
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
                                                _model.performanceStage,
                                                r'''$.name''',
                                              ) !=
                                              null
                                          ? getJsonField(
                                              _model.performanceStage,
                                              r'''$.name''',
                                            ).toString()
                                          : getJsonField(
                                              (_model.singleSlotOutput
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.data.stage_name''',
                                            ).toString(),
                                      showArrow:
                                          FFAppState().userType == Type.Venue,
                                      onTap: () async {
                                        if (FFAppState().userType ==
                                            Type.Venue) {
                                          await showDialog(
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
                                                  child: Container(
                                                    height: 300.0,
                                                    child:
                                                        CHRDPerformanceStagesWidget(
                                                      venueId: getJsonField(
                                                        (_model.singleSlotOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.data.venue_id''',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => safeSetState(() =>
                                              _model.performanceStage = value));

                                          _model.isEdited = true;
                                          _model.selectedStageId = getJsonField(
                                            _model.performanceStage,
                                            r'''$.id''',
                                          );
                                          safeSetState(() {});
                                        }

                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
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
                                    Text(
                                      getJsonField(
                                        (_model.singleSlotOutput?.jsonBody ??
                                            ''),
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
                                if ('false' ==
                                    getJsonField(
                                      (_model.singleSlotOutput?.jsonBody ?? ''),
                                      r'''$.data.is_booked''',
                                    ).toString())
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (FFAppState().userType == Type.Venue)
                                          Expanded(
                                            child: Builder(
                                              builder: (context) =>
                                                  wrapWithModel(
                                                model:
                                                    _model.cHRDLabelBtnModel1,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: CHRDLabelBtnWidget(
                                                  heading: 'Remove Event',
                                                  txtColor: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  btnColor: FlutterFlowTheme.of(
                                                          context)
                                                      .btnColor,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                                                ConfirmationDialogWidget(
                                                              acceptbtnText:
                                                                  'Remove',
                                                              title:
                                                                  'Are you sure you want to remove this event?',
                                                              acceptBtnAction:
                                                                  () async {
                                                                _model.deleteGig =
                                                                    await VenueGroup
                                                                        .deleteVenueOpenSlotsCall
                                                                        .call(
                                                                  slotId: widget!
                                                                      .slotId,
                                                                );

                                                                if ((_model
                                                                        .deleteGig
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  await NotificationGroup
                                                                      .sendVenueCancelledNotificationsCall
                                                                      .call(
                                                                    jsonJson:
                                                                        getJsonField(
                                                                      (_model.deleteGig
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$..thread_data''',
                                                                    ),
                                                                  );

                                                                  Navigator.pop(
                                                                      context);
                                                                  context
                                                                      .safePop();
                                                                }
                                                              },
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
                                        if (('None' !=
                                                getJsonField(
                                                  (_model.singleSlotOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.data.repeat_type''',
                                                ).toString()) &&
                                            (FFAppState().userType ==
                                                Type.Venue))
                                          Expanded(
                                            child: wrapWithModel(
                                              model: _model.cHRDLabelBtnModel2,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: CHRDLabelBtnWidget(
                                                heading: 'View Sequence',
                                                txtColor:
                                                    FlutterFlowTheme.of(context)
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
                                                    ViewSequenceWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'groupId': serializeParam(
                                                        getJsonField(
                                                          (_model.singleSlotOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.data.group_uuid''',
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
                      if (('true' !=
                              getJsonField(
                                (_model.singleSlotOutput?.jsonBody ?? ''),
                                r'''$.data.is_booked''',
                              ).toString()) &&
                          (FFAppState().userType == Type.Venue))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: wrapWithModel(
                            model: _model.cHRDLabelBtnModel3,
                            updateCallback: () => safeSetState(() {}),
                            child: CHRDLabelBtnWidget(
                              heading: 'true' ==
                                      getJsonField(
                                        (_model.singleSlotOutput?.jsonBody ??
                                            ''),
                                        r'''$.data.is_booked''',
                                      ).toString()
                                  ? 'Close'
                                  : 'Modify contract',
                              txtColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              btnColor:
                                  FlutterFlowTheme.of(context).primaryViolet,
                              borderColor:
                                  FlutterFlowTheme.of(context).btnColor,
                              hight: 45.0,
                              headingFontSize: 14,
                              isDisiable:
                                  (_model.addedPrice != null) || _model.isEdited
                                      ? false
                                      : true,
                              onTab: () async {
                                var _shouldSetState = false;
                                if ('true' ==
                                    getJsonField(
                                      (_model.singleSlotOutput?.jsonBody ?? ''),
                                      r'''$.data.is_booked''',
                                    ).toString()) {
                                  context.safePop();
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                } else {
                                  if (_model.isEdited) {
                                    _model.updateSlot = await VenueGroup
                                        .updateVenueSlotsUnifiedCall
                                        .call(
                                      slotId: widget!.slotId,
                                      stageId: _model.selectedStageId,
                                      venueId: getJsonField(
                                        (_model.singleSlotOutput?.jsonBody ??
                                            ''),
                                        r'''$.data.venue_id''',
                                      ),
                                      startDate: getJsonField(
                                        (_model.singleSlotOutput?.jsonBody ??
                                            ''),
                                        r'''$.data.start_date''',
                                      ).toString(),
                                      startTime: getJsonField(
                                        (_model.singleSlotOutput?.jsonBody ??
                                            ''),
                                        r'''$.data.start_time''',
                                      ).toString(),
                                      endTime: getJsonField(
                                        (_model.singleSlotOutput?.jsonBody ??
                                            ''),
                                        r'''$.data.end_time''',
                                      ).toString(),
                                      timeZone: 'EST',
                                      updatedBy: FFAppState().userId,
                                      endDate: getJsonField(
                                        (_model.singleSlotOutput?.jsonBody ??
                                            ''),
                                        r'''$.data.end_date''',
                                      ).toString(),
                                      repeatType: FFAppState().slotRepeatType,
                                      loadTime: _model.time != null &&
                                              _model.time != ''
                                          ? _model.time
                                          : getJsonField(
                                              (_model.singleSlotOutput
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.data.load_time''',
                                            ).toString(),
                                      loadDuration:
                                          _model.loadDurationTime != null &&
                                                  _model.loadDurationTime != ''
                                              ? _model.loadDurationTime
                                              : getJsonField(
                                                  (_model.singleSlotOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.data.load_duration''',
                                                ).toString(),
                                    );

                                    _shouldSetState = true;
                                    safeSetState(() {});
                                    if ((_model.updateSlot?.succeeded ??
                                        true)) {
                                      if (_model.addedPrice != null) {
                                        await GigContractsTable().update(
                                          data: {
                                            'price': _model.addedPrice,
                                            'updated_at':
                                                supaSerialize<DateTime>(
                                                    getCurrentTimestamp),
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'gig_thread_id',
                                            widget!.threadId,
                                          ),
                                        );
                                        await ThreadMessagesTable().insert({
                                          'message_type': 'click',
                                          'created_at': supaSerialize<DateTime>(
                                              getCurrentTimestamp),
                                          'thread_id': widget!.threadId,
                                          'sender_id': FFAppState().userId,
                                          'message_content':
                                              'Changes made to the gig proposal',
                                          'alternate_message':
                                              'Venue made changes to the gig proposal',
                                        });
                                      } else {
                                        await ThreadMessagesTable().insert({
                                          'message_type': 'toast',
                                          'created_at': supaSerialize<DateTime>(
                                              getCurrentTimestamp),
                                          'thread_id': widget!.threadId,
                                          'sender_id': FFAppState().userId,
                                          'message_content':
                                              'You made changes in gig',
                                          'alternate_message':
                                              'Venue updated the gig.',
                                        });
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Update failed. Please try again.',
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
                                                  .warning,
                                        ),
                                      );
                                    }
                                  } else {
                                    if (_model.addedPrice != null) {
                                      await GigContractsTable().update(
                                        data: {
                                          'price': _model.addedPrice,
                                          'updated_at': supaSerialize<DateTime>(
                                              getCurrentTimestamp),
                                        },
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'gig_thread_id',
                                          widget!.threadId,
                                        ),
                                      );
                                      await ThreadMessagesTable().insert({
                                        'message_type': 'click',
                                        'created_at': supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                        'thread_id': widget!.threadId,
                                        'sender_id': FFAppState().userId,
                                        'message_content':
                                            'Changes made to the gig proposal',
                                        'alternate_message':
                                            'Venue made changes to the gig proposal',
                                      });
                                    }
                                  }

                                  context.safePop();
                                }

                                if (_shouldSetState) safeSetState(() {});
                              },
                            ),
                          ),
                        ),
                      if (('true' ==
                              getJsonField(
                                (_model.singleSlotOutput?.jsonBody ?? ''),
                                r'''$.data.is_booked''',
                              ).toString()) &&
                          (FFAppState().userType == Type.Musician))
                        Builder(
                          builder: (context) => Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: wrapWithModel(
                              model: _model.cHRDLabelBtnModel4,
                              updateCallback: () => safeSetState(() {}),
                              child: CHRDLabelBtnWidget(
                                heading: 'Back out',
                                txtColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                btnColor:
                                    FlutterFlowTheme.of(context).primaryViolet,
                                borderColor:
                                    FlutterFlowTheme.of(context).btnColor,
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
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: CHRDBackoutGigWidget(
                                            dateTime: getJsonField(
                                              (_model.singleSlotOutput
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.data.start_date''',
                                            ).toString(),
                                            price: '${getJsonField(
                                              (_model.singleSlotOutput
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.data.start_time''',
                                            ).toString()} - ${getJsonField(
                                              (_model.singleSlotOutput
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.data.end_time''',
                                            ).toString()}',
                                            acceptActionBtn:
                                                (reasonFieldValue) async {
                                              await GigContractsTable().update(
                                                data: {
                                                  'contract_status':
                                                      GigStatus.Open.name,
                                                  'updated_at':
                                                      supaSerialize<DateTime>(
                                                          getCurrentTimestamp),
                                                  'accepted_at':
                                                      supaSerialize<DateTime>(
                                                          null),
                                                },
                                                matchingRows: (rows) =>
                                                    rows.eqOrNull(
                                                  'gig_thread_id',
                                                  widget!.threadId,
                                                ),
                                              );
                                              await ThreadMessagesTable()
                                                  .insert({
                                                'created_at':
                                                    supaSerialize<DateTime>(
                                                        getCurrentTimestamp),
                                                'thread_id': widget!.threadId,
                                                'sender_id':
                                                    FFAppState().userId,
                                                'message_type': 'text',
                                                'message_content':
                                                    reasonFieldValue,
                                              });
                                              await ThreadMessagesTable()
                                                  .insert({
                                                'created_at':
                                                    supaSerialize<DateTime>(
                                                        getCurrentTimestamp),
                                                'thread_id': widget!.threadId,
                                                'sender_id':
                                                    FFAppState().userId,
                                                'message_type': 'toast',
                                                'message_content':
                                                    'Performer has backed out from this gig.',
                                              });
                                              _model.backOutOutput =
                                                  await MusicianGroup
                                                      .backOutCall
                                                      .call(
                                                pThreadId: widget!.threadId,
                                              );

                                              await NotificationGroup
                                                  .sendNotificationCall
                                                  .call(
                                                title: 'Performer Backed Out',
                                                type: 'PerformerBackedout',
                                                description:
                                                    'The performer has backed out of the booking. Please review and take necessary action.',
                                                sendToList: (int var1) {
                                                  return List<String>.from(
                                                      [var1.toString()]);
                                                }(getJsonField(
                                                  (_model.singleSlotOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$..created_by''',
                                                )),
                                                usertype:
                                                    FFAppState().userType?.name,
                                                dataJson: <String, dynamic>{
                                                  'thread_id': widget!.threadId,
                                                  'is_venue': 'true',
                                                },
                                              );

                                              await NotificationTable().insert({
                                                'user_id': getJsonField(
                                                  (_model.singleSlotOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$..created_by''',
                                                ),
                                                'title': 'Performer Backed Out',
                                                'description':
                                                    'The performer has backed out of the booking. Please review and take necessary action.',
                                                'type': 'PerformerBackedout',
                                                'data': <String, dynamic>{
                                                  'thread_id': widget!.threadId,
                                                  'is_venue': 'true',
                                                },
                                                'usertype':
                                                    FFAppState().userType?.name,
                                                'is_read': false,
                                                'created_at':
                                                    supaSerialize<DateTime>(
                                                        getCurrentTimestamp),
                                                'updated_at':
                                                    supaSerialize<DateTime>(
                                                        getCurrentTimestamp),
                                              });

                                              context.goNamed(
                                                NavPageWidget.routeName,
                                                queryParameters: {
                                                  'index': serializeParam(
                                                    2,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
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
                    ]
                        .addToStart(SizedBox(height: 28.0))
                        .addToEnd(SizedBox(height: 33.0)),
                  ),
                ),
              if (_model.isLoader)
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 45.0,
                    height: 45.0,
                    child: custom_widgets.CustomLoader(
                      width: 45.0,
                      height: 45.0,
                      color: FlutterFlowTheme.of(context).primaryViolet,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
