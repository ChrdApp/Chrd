import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_date_time_select/c_h_r_d_date_time_select_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_performance_stages/c_h_r_d_performance_stages_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_row_with_icon/c_h_r_d_row_with_icon_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'adding_venue_open_slots_model.dart';
export 'adding_venue_open_slots_model.dart';

class AddingVenueOpenSlotsWidget extends StatefulWidget {
  const AddingVenueOpenSlotsWidget({
    super.key,
    this.timeSelected,
    this.venueId,
    required this.isMusician,
    this.slotId,
  });

  final String? timeSelected;

  /// Venue id provided by loggedin user.
  final int? venueId;

  /// Are you musician or venue
  final bool? isMusician;

  final int? slotId;

  static String routeName = 'adding_venue_open_slots';
  static String routePath = '/addingVenueOpenSlots';

  @override
  State<AddingVenueOpenSlotsWidget> createState() =>
      _AddingVenueOpenSlotsWidgetState();
}

class _AddingVenueOpenSlotsWidgetState
    extends State<AddingVenueOpenSlotsWidget> {
  late AddingVenueOpenSlotsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddingVenueOpenSlotsModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
                    'assets/images/open_slot.png',
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
                          Icons.arrow_back,
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
                        heading: 'Add open slots',
                        subHeading:
                            'Add open event dates and details  Can add or edit in profile.',
                      ),
                    ),
                  ),
                ]
                    .addToStart(SizedBox(height: 56.0))
                    .addToEnd(SizedBox(height: 20.0)),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
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
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final _datePicked1Date =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: getCurrentTimestamp,
                                          firstDate: getCurrentTimestamp,
                                          lastDate: DateTime(2050),
                                          builder: (context, child) {
                                            return wrapInMaterialDatePickerTheme(
                                              context,
                                              child!,
                                              headerBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              headerForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              headerTextStyle: FlutterFlowTheme
                                                      .of(context)
                                                  .headlineLarge
                                                  .override(
                                                    font:
                                                        GoogleFonts.interTight(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLarge
                                                              .fontStyle,
                                                    ),
                                                    fontSize: 32.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLarge
                                                            .fontStyle,
                                                  ),
                                              pickerBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              pickerForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              selectedDateTimeBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryViolet,
                                              selectedDateTimeForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              actionButtonForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              iconSize: 24.0,
                                            );
                                          },
                                        );

                                        if (_datePicked1Date != null) {
                                          safeSetState(() {
                                            _model.datePicked1 = DateTime(
                                              _datePicked1Date.year,
                                              _datePicked1Date.month,
                                              _datePicked1Date.day,
                                            );
                                          });
                                        } else if (_model.datePicked1 != null) {
                                          safeSetState(() {
                                            _model.datePicked1 =
                                                getCurrentTimestamp;
                                          });
                                        }
                                        _model.days = functions
                                                    .getDateDifferenceInDays(
                                                        _model.datePicked1) ==
                                                'null'
                                            ? ''
                                            : functions.getDateDifferenceInDays(
                                                _model.datePicked1);
                                        safeSetState(() {});
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Date',
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
                                            valueOrDefault<String>(
                                              dateTimeFormat("EEE, MMM d, yyyy",
                                                  _model.datePicked1),
                                              'Select',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.bold,
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
                                          Text(
                                            'in ${valueOrDefault<String>(
                                              _model.days,
                                              '-',
                                            )}',
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
                                    Container(
                                      width: 0.5,
                                      height: 90.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x4DFFFFFF),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
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
                                                    height: 250.0,
                                                    child:
                                                        CHRDDateTimeSelectWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          );

                                          _model.time = (FFAppState()
                                                          .startTime !=
                                                      null) &&
                                                  (FFAppState().endTime != null)
                                              ? functions.findTime(
                                                  FFAppState().startTime,
                                                  FFAppState().endTime)
                                              : 'Select';
                                          _model.loadDurationTime =
                                              valueOrDefault<String>(
                                            (FFAppState().startTime != null) &&
                                                    (_model.selectedTime !=
                                                        null)
                                                ? functions.findTime(
                                                    _model.selectedTime,
                                                    FFAppState().startTime)
                                                : '--',
                                            '-',
                                          );
                                          safeSetState(() {});
                                          _model.loadTime = null;
                                          _model.loadDurationTime = '-';
                                          safeSetState(() {});
                                        },
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
                                                  valueOrDefault<String>(
                                                    dateTimeFormat("jm",
                                                        FFAppState().startTime),
                                                    'Select',
                                                  ),
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
                                                  valueOrDefault<String>(
                                                    dateTimeFormat("jm",
                                                        FFAppState().endTime),
                                                    'Select',
                                                  ),
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
                                            Text(
                                              valueOrDefault<String>(
                                                _model.time,
                                                '-',
                                              ),
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
                                head: 'repeat',
                                leadingIcon: Icon(
                                  FFIcons.krepeat1,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                subHead: FFAppState().slotRepeatType,
                                onTap: () async {
                                  if (_model.datePicked1 != null) {
                                    context.pushNamed(
                                      RepeatOverLayWidget.routeName,
                                      queryParameters: {
                                        'type': serializeParam(
                                          'Venue',
                                          ParamType.String,
                                        ),
                                        'selected': serializeParam(
                                          _model.datePicked1,
                                          ParamType.DateTime,
                                        ),
                                      }.withoutNulls,
                                    );

                                    return;
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Please select start date first.',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .warning,
                                      ),
                                    );
                                    return;
                                  }
                                },
                              ),
                            ),
                            Divider(
                              thickness: 0.5,
                              color: Color(0x4CFFFFFF),
                            ),
                            if (widget!.isMusician == false)
                              wrapWithModel(
                                model: _model.cHRDRowWithIconModel2,
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
                                      dateTimeFormat("jm", _model.loadTime),
                                  showArrow: false,
                                  onTap: () async {
                                    var _shouldSetState = false;
                                    if ((FFAppState().startTime != null) &&
                                        (FFAppState().endTime != null)) {
                                      _model.selectedTime = await actions
                                          .showConstrainedTimePicker(
                                        context,
                                        FFAppState().startTime!,
                                        FFAppState().startTime,
                                      );
                                      _shouldSetState = true;
                                      _model.loadDurationTime =
                                          valueOrDefault<String>(
                                        (FFAppState().startTime != null) &&
                                                (_model.selectedTime != null)
                                            ? functions.findTime(
                                                _model.selectedTime,
                                                FFAppState().startTime)
                                            : '--',
                                        '-',
                                      );
                                      _model.loadTime = _model.selectedTime;
                                      safeSetState(() {});
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            () {
                                              if ((FFAppState().startTime ==
                                                      null) &&
                                                  (FFAppState().endTime ==
                                                      null)) {
                                                return 'Please select start time and end time.';
                                              } else if ((FFAppState()
                                                          .startTime !=
                                                      null) &&
                                                  (FFAppState().endTime ==
                                                      null)) {
                                                return 'Please select a end time first.';
                                              } else {
                                                return 'Please select a start time first.';
                                              }
                                            }(),
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .warning,
                                        ),
                                      );
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                ),
                              ),
                            if (widget!.isMusician == false)
                              Divider(
                                thickness: 0.5,
                                color: Color(0x4CFFFFFF),
                              ),
                            if (widget!.isMusician == false)
                              wrapWithModel(
                                model: _model.cHRDRowWithIconModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: CHRDRowWithIconWidget(
                                  head: 'Load duration',
                                  leadingIcon: Icon(
                                    Icons.watch_later_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  subHead: _model.loadDurationTime!,
                                  showArrow: false,
                                  onTap: () async {},
                                ),
                              ),
                            if (widget!.isMusician == false)
                              Divider(
                                thickness: 0.5,
                                color: Color(0x4CFFFFFF),
                              ),
                            if (widget!.isMusician == false)
                              Builder(
                                builder: (context) => wrapWithModel(
                                  model: _model.cHRDRowWithIconModel4,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CHRDRowWithIconWidget(
                                    head: 'Stage',
                                    leadingIcon: Icon(
                                      FFIcons.kframe483343,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 12.0,
                                    ),
                                    subHead: valueOrDefault<String>(
                                      getJsonField(
                                        _model.performanceStage,
                                        r'''$.name''',
                                      )?.toString(),
                                      'Select',
                                    ),
                                    onTap: () async {
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
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
                                                  venueId:
                                                      widget!.venueId == null
                                                          ? FFAppState().venueId
                                                          : widget!.venueId!,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() =>
                                          _model.performanceStage = value));

                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ),
                            Column(
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
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
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
                                    ),
                                  ].divide(SizedBox(width: 10.0)),
                                ),
                                Container(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    autofocus: false,
                                    enabled: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context)
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
                                      hintText: 'Enter Gig Notes ',
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
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: Color(0x7B7B7B7B),
                                    ),
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
                                          fontSize: 12.0,
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
                                    maxLines: 4,
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    enableInteractiveSelection: true,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ].divide(SizedBox(height: 8.0)),
                            ),
                          ]
                              .divide(SizedBox(height: 15.0))
                              .addToStart(SizedBox(height: 4.0))
                              .addToEnd(SizedBox(height: 18.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: wrapWithModel(
                model: _model.cHRDLabelBtnModel,
                updateCallback: () => safeSetState(() {}),
                child: CHRDLabelBtnWidget(
                  heading: 'Add Slot',
                  txtColor: FlutterFlowTheme.of(context).primaryText,
                  btnColor: FlutterFlowTheme.of(context).primaryViolet,
                  borderColor: FlutterFlowTheme.of(context).primaryViolet,
                  hight: 45.0,
                  headingFontSize: 14,
                  isDisiable: false,
                  onTab: () async {
                    var _shouldSetState = false;
                    if (widget!.isMusician == true) {
                      _model.musicianValidationOutupt =
                          await actions.validateMusicianSlotFields(
                        _model.datePicked1,
                        FFAppState().startTime,
                        FFAppState().endTime,
                      );
                      _shouldSetState = true;
                      if (_model.musicianValidationOutupt == 'success') {
                        _model.apiResultrh9 =
                            await MusicianGroup.createMusicianOpenSlotCall.call(
                          createdBy: FFAppState().userId,
                          startDate: _model.datePicked1?.toString(),
                          startTime: FFAppState().startTime?.toString(),
                          endTime: FFAppState().endTime?.toString(),
                          timeZone: 'EST',
                          endDate: FFAppState().slotEndDate != null
                              ? FFAppState().slotEndDate?.toString()
                              : getCurrentTimestamp.toString(),
                          repeatType: FFAppState().slotRepeatType,
                        );

                        _shouldSetState = true;
                        if (MusicianGroup.createMusicianOpenSlotCall.status(
                              (_model.apiResultrh9?.jsonBody ?? ''),
                            ) ==
                            'success') {
                          FFAppState().slotEndDate = null;
                          FFAppState().slotRepeatType = 'None';
                          FFAppState().startTime = null;
                          FFAppState().endTime = null;
                          safeSetState(() {});
                          context.pop();
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                MusicianGroup.createMusicianOpenSlotCall
                                    .message(
                                  (_model.apiResultrh9?.jsonBody ?? ''),
                                )!,
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).error,
                            ),
                          );
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              _model.musicianValidationOutupt!,
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).warning,
                          ),
                        );
                        if (_shouldSetState) safeSetState(() {});
                        return;
                      }
                    } else {
                      _model.validationOutupt =
                          await actions.validateSlotFields(
                        _model.datePicked1,
                        FFAppState().startTime,
                        FFAppState().endTime,
                        _model.loadTime,
                        _model.loadDurationTime,
                        getJsonField(
                          _model.performanceStage,
                          r'''$.id''',
                        ),
                      );
                      _shouldSetState = true;
                      if (_model.validationOutupt == 'success') {
                        _model.singleSlotOutput =
                            await VenueGroup.unifiedSlotCreationCall.call(
                          stageId: getJsonField(
                            _model.performanceStage,
                            r'''$.id''',
                          ),
                          venueId: widget!.venueId == null
                              ? FFAppState().venueId
                              : widget!.venueId,
                          startDate:
                              dateTimeFormat("y-M-d", _model.datePicked1),
                          startTime:
                              dateTimeFormat("Hm", FFAppState().startTime),
                          endTime: dateTimeFormat("Hm", FFAppState().endTime),
                          loadTime: dateTimeFormat("Hm", _model.loadTime),
                          loadDuration: _model.loadDurationTime,
                          createdBy: FFAppState().userId,
                          timeZone: 'EST',
                          endDate: FFAppState().slotEndDate != null
                              ? FFAppState().slotEndDate?.toString()
                              : getCurrentTimestamp.toString(),
                          repeatType: FFAppState().slotRepeatType,
                          pNotes: _model.textController.text,
                        );

                        _shouldSetState = true;
                        if (VenueGroup.unifiedSlotCreationCall.status(
                              (_model.singleSlotOutput?.jsonBody ?? ''),
                            ) ==
                            'success') {
                          FFAppState().slotEndDate = null;
                          FFAppState().slotRepeatType = 'None';
                          FFAppState().startTime = null;
                          FFAppState().endTime = null;
                          safeSetState(() {});
                          await NotificationGroup.notifyMusicianForVenueCall
                              .call(
                            venueId: widget!.venueId,
                            slotId: getJsonField(
                              (_model.singleSlotOutput?.jsonBody ?? ''),
                              r'''$.id''',
                            ),
                          );

                          context.pop();
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                VenueGroup.unifiedSlotCreationCall.message(
                                  (_model.singleSlotOutput?.jsonBody ?? ''),
                                )!,
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).error,
                            ),
                          );
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              _model.validationOutupt!,
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).warning,
                          ),
                        );
                        if (_shouldSetState) safeSetState(() {});
                        return;
                      }
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
