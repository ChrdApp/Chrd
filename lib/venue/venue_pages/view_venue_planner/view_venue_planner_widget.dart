import '/backend/api_requests/api_calls.dart';
import '/components/empty_list_image_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/venue/venue_pages/venue_components/c_h_r_d_venue_planner/c_h_r_d_venue_planner_widget.dart';
import '/venue/venue_pages/venue_components/calendar_filter/calendar_filter_widget.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'view_venue_planner_model.dart';
export 'view_venue_planner_model.dart';

class ViewVenuePlannerWidget extends StatefulWidget {
  const ViewVenuePlannerWidget({
    super.key,
    required this.venueId,
    required this.venueOwnerId,
    required this.venueName,
  });

  final int? venueId;
  final int? venueOwnerId;
  final String? venueName;

  static String routeName = 'view_venue_planner';
  static String routePath = '/viewVenuePlanner';

  @override
  State<ViewVenuePlannerWidget> createState() => _ViewVenuePlannerWidgetState();
}

class _ViewVenuePlannerWidgetState extends State<ViewVenuePlannerWidget> {
  late ViewVenuePlannerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewVenuePlannerModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().selectedCalendarDate = '';
      FFAppState().filteredVenueStatus = '';
      FFAppState().FilteredVenueIds = [];
      safeSetState(() {});
      FFAppState().addToFilteredVenueIds(widget!.venueId!.toString());
      safeSetState(() {});
    });

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

    return FutureBuilder<ApiCallResponse>(
      future: VenueGroup.getVenuePlannerSlotsCall.call(
        venueOwnerId: widget!.venueOwnerId,
        selectedDate: FFAppState().selectedCalendarDate,
        searchText: _model.textController.text,
        venueIdsList: (List<String> var1) {
          return var1 == null
              ? <int>[]
              : var1.map((e) => int.tryParse(e) ?? 0).toList();
        }(FFAppState().FilteredVenueIds.toList()),
        slotStatus: FFAppState().filteredVenueStatus,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).alternate,
                  ),
                ),
              ),
            ),
          );
        }
        final viewVenuePlannerGetVenuePlannerSlotsResponse = snapshot.data!;

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
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: ListView(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          0,
                          0,
                          39.0,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 20.0),
                                            child: wrapWithModel(
                                              model: _model.cHRDBackBtnModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: CHRDBackBtnWidget(
                                                icon: Icon(
                                                  Icons.arrow_back_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
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
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${widget!.venueName} Calendar',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 11.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .neutralDark900,
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller:
                                                          _model.textController,
                                                      focusNode: _model
                                                          .textFieldFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.textController',
                                                        Duration(
                                                            milliseconds: 0),
                                                        () =>
                                                            safeSetState(() {}),
                                                      ),
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .hintTxt,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        hintText:
                                                            'Search by name',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .hintTxt,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .neutralDark900,
                                                        prefixIcon: Icon(
                                                          FFIcons.ksearch,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      enableInteractiveSelection:
                                                          true,
                                                      validator: _model
                                                          .textControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                FlutterFlowIconButton(
                                                  borderRadius: 50.0,
                                                  buttonSize: 40.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .neutralDark900,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.slidersH,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    size: 16.0,
                                                  ),
                                                  onPressed: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                CalendarFilterWidget(),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        if (valueOrDefault<String>(
                                              ((String searchField,
                                                          String selectedDate,
                                                          String venueStatus,
                                                          List<String>
                                                              filteredVenues) {
                                                return [
                                                  if ((searchField ?? '')
                                                      .toString()
                                                      .trim()
                                                      .isNotEmpty)
                                                    1,
                                                  if ((selectedDate ?? '')
                                                      .toString()
                                                      .trim()
                                                      .isNotEmpty)
                                                    1,
                                                  if ((venueStatus ?? '')
                                                      .toString()
                                                      .trim()
                                                      .isNotEmpty)
                                                    1,
                                                  if (((filteredVenues ?? [])
                                                          as List)
                                                      .isNotEmpty)
                                                    1,
                                                ].length;
                                              }(
                                                      _model
                                                          .textController.text,
                                                      FFAppState()
                                                          .selectedCalendarDate,
                                                      FFAppState()
                                                          .filteredVenueStatus,
                                                      FFAppState()
                                                          .FilteredVenueIds
                                                          .toList()))
                                                  .toString(),
                                              '0',
                                            ) !=
                                            '0')
                                          Text(
                                            valueOrDefault<String>(
                                                      ((String searchField,
                                                                  String
                                                                      selectedDate) {
                                                        return [
                                                          if ((searchField ??
                                                                  '')
                                                              .toString()
                                                              .trim()
                                                              .isNotEmpty)
                                                            1,
                                                          if (selectedDate !=
                                                              null)
                                                            1,
                                                        ].length;
                                                      }(
                                                              _model
                                                                  .textController
                                                                  .text,
                                                              FFAppState()
                                                                  .selectedCalendarDate))
                                                          .toString(),
                                                      '0',
                                                    ) !=
                                                    '0'
                                                ? '${valueOrDefault<String>(
                                                    ((String searchField,
                                                                String
                                                                    selectedDate) {
                                                      return [
                                                        if (searchField
                                                                ?.trim()
                                                                .isNotEmpty ==
                                                            true)
                                                          1,
                                                        if (selectedDate
                                                                ?.trim()
                                                                .isNotEmpty ==
                                                            true)
                                                          1,
                                                      ].length;
                                                    }(
                                                            _model
                                                                .textController
                                                                .text,
                                                            FFAppState()
                                                                .selectedCalendarDate))
                                                        .toString(),
                                                    '0',
                                                  )} Filter'
                                                : 'No Filter',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                      ].addToEnd(SizedBox(height: 12.0)),
                                    ),
                                    if (valueOrDefault<String>(
                                          ((String searchField,
                                                      String selectedDate,
                                                      String venueStatus,
                                                      List<String> filteredVenues) {
                                            return [
                                              if ((searchField ?? '')
                                                  .toString()
                                                  .trim()
                                                  .isNotEmpty)
                                                1,
                                              if ((selectedDate ?? '')
                                                  .toString()
                                                  .trim()
                                                  .isNotEmpty)
                                                1,
                                              if ((venueStatus ?? '')
                                                  .toString()
                                                  .trim()
                                                  .isNotEmpty)
                                                1,
                                              if (((filteredVenues ?? [])
                                                      as List)
                                                  .isNotEmpty)
                                                1,
                                            ].length;
                                          }(
                                                  _model.textController.text,
                                                  FFAppState()
                                                      .selectedCalendarDate,
                                                  FFAppState()
                                                      .filteredVenueStatus,
                                                  FFAppState()
                                                      .FilteredVenueIds
                                                      .toList()))
                                              .toString(),
                                          '0',
                                        ) !=
                                        '0')
                                      Wrap(
                                        spacing: 4.0,
                                        runSpacing: 8.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          if (_model.textController.text !=
                                                  null &&
                                              _model.textController.text != '')
                                            FFButtonWidget(
                                              onPressed: () async {
                                                safeSetState(() {
                                                  _model.textController
                                                      ?.clear();
                                                });
                                              },
                                              text: 'Search  ×',
                                              options: FFButtonOptions(
                                                height: 28.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.5, 0.0, 20.5, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts
                                                          .interTight(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                            ),
                                          if (FFAppState()
                                                      .selectedCalendarDate !=
                                                  null &&
                                              FFAppState()
                                                      .selectedCalendarDate !=
                                                  '')
                                            FFButtonWidget(
                                              onPressed: () async {
                                                FFAppState()
                                                    .selectedCalendarDate = '';
                                                safeSetState(() {});
                                              },
                                              text: 'Date  ×',
                                              options: FFButtonOptions(
                                                height: 28.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.5, 0.0, 20.5, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts
                                                          .interTight(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                            ),
                                        ],
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 11.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 350.0,
                                        child: custom_widgets.ShowCalender(
                                          width: double.infinity,
                                          height: 350.0,
                                          userId: widget!.venueOwnerId!,
                                          type: 'venue',
                                          selectedDate:
                                              FFAppState().selectedCalendarDate,
                                          searchText:
                                              _model.textController.text,
                                          slotStatus:
                                              FFAppState().filteredVenueStatus,
                                          venueIds:
                                              FFAppState().FilteredVenueIds,
                                          ontap: () async {},
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                      color: Color(0x33FFFFFF),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        final venuePlannerSlotDetails =
                                            viewVenuePlannerGetVenuePlannerSlotsResponse
                                                .jsonBody
                                                .toList();
                                        if (venuePlannerSlotDetails.isEmpty) {
                                          return EmptyListImageWidget(
                                            msg: 'No Gigs Available',
                                          );
                                        }

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              venuePlannerSlotDetails.length,
                                          itemBuilder: (context,
                                              venuePlannerSlotDetailsIndex) {
                                            final venuePlannerSlotDetailsItem =
                                                venuePlannerSlotDetails[
                                                    venuePlannerSlotDetailsIndex];
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Text(
                                                    getJsonField(
                                                      venuePlannerSlotDetailsItem,
                                                      r'''$.formatted_date''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      color: Color(0xFF01CDD0),
                                                      size: 24.0,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        getJsonField(
                                                          venuePlannerSlotDetailsItem,
                                                          r'''$.venues..venue_name''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF01CDD0),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    final slotsList =
                                                        getJsonField(
                                                      venuePlannerSlotDetailsItem,
                                                      r'''$.venues..slots''',
                                                    ).toList();

                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          slotsList.length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          SizedBox(height: 8.0),
                                                      itemBuilder: (context,
                                                          slotsListIndex) {
                                                        final slotsListItem =
                                                            slotsList[
                                                                slotsListIndex];
                                                        return CHRDVenuePlannerWidget(
                                                          key: Key(
                                                              'Keyncy_${slotsListIndex}_of_${slotsList.length}'),
                                                          venueName: getJsonField(
                                                                    slotsListItem,
                                                                    r'''$.musician_name''',
                                                                  ) ==
                                                                  null
                                                              ? 'Open Slots'
                                                              : getJsonField(
                                                                  slotsListItem,
                                                                  r'''$.musician_name''',
                                                                ).toString(),
                                                          time: getJsonField(
                                                            slotsListItem,
                                                            r'''$.start_time''',
                                                          ).toString(),
                                                          stageName:
                                                              getJsonField(
                                                            slotsListItem,
                                                            r'''$.stage_name''',
                                                          ).toString(),
                                                          venueImage:
                                                              '${getJsonField(
                                                                    slotsListItem,
                                                                    r'''$.musician_profile_photo''',
                                                                  ) == null ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/c7i9br13v5fk/error.png' : getJsonField(
                                                                  slotsListItem,
                                                                  r'''$.musician_profile_photo''',
                                                                ).toString()}',
                                                          isBooked: 'Booked' ==
                                                                  getJsonField(
                                                                    slotsListItem,
                                                                    r'''$.booking_status''',
                                                                  ).toString()
                                                              ? true
                                                              : false,
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                                Divider(
                                                  thickness: 1.0,
                                                  color: Color(0x33FFFFFF),
                                                ),
                                              ]
                                                  .divide(
                                                      SizedBox(height: 16.0))
                                                  .addToStart(
                                                      SizedBox(height: 16.0)),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ].addToStart(SizedBox(height: 30.0)),
                                ),
                              ),
                            ].addToEnd(SizedBox(height: 30.0)),
                          ),
                        ],
                      ),
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
