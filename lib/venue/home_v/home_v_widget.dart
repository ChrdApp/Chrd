import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_list_image_widget.dart';
import '/components/no_venue_created_component_widget.dart';
import '/components/notification_icon_widget.dart';
import '/components/venue_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/venue/venue_pages/venue_components/c_h_r_d_venue_details/c_h_r_d_venue_details_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_v_model.dart';
export 'home_v_model.dart';

class HomeVWidget extends StatefulWidget {
  const HomeVWidget({super.key});

  static String routeName = 'homeV';
  static String routePath = '/homeV';

  @override
  State<HomeVWidget> createState() => _HomeVWidgetState();
}

class _HomeVWidgetState extends State<HomeVWidget> {
  late HomeVModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeVModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userResponse = await UsersTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id',
          FFAppState().userId,
        ),
      );
      if ((_model.userResponse?.firstOrNull?.name == null ||
              _model.userResponse?.firstOrNull?.name == '') &&
          (_model.userResponse?.firstOrNull?.email == null ||
              _model.userResponse?.firstOrNull?.email == '')) {
        context.goNamed(AccountCreation6Widget.routeName);
      }
      await actions.handleNotificationClick(
        context,
      );
      await actions.oneSignalLogin(
        FFAppState().userId.toString(),
      );
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
      future: VenueGroup.getTodaysVenueRundownCall.call(
        venueOwnerId: FFAppState().userId,
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
        final homeVGetTodaysVenueRundownResponse = snapshot.data!;

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
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    19.0, 0.0, 19.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Welcome, ${valueOrDefault<String>(
                                              _model.userResponse?.firstOrNull
                                                  ?.name,
                                              'user',
                                            )}',
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
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        FutureBuilder<List<NotificationRow>>(
                                          future: NotificationTable().queryRows(
                                            queryFn: (q) => q
                                                .eqOrNull(
                                                  'user_id',
                                                  FFAppState().userId,
                                                )
                                                .eqOrNull(
                                                  'is_read',
                                                  false,
                                                ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return NotificationIconWidget();
                                            }
                                            List<NotificationRow>
                                                containerNotificationRowList =
                                                snapshot.data!;

                                            return Container(
                                              decoration: BoxDecoration(),
                                              child: Container(
                                                width: 40.0,
                                                height: 40.0,
                                                child: Stack(
                                                  children: [
                                                    FlutterFlowIconButton(
                                                      borderRadius: 8.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        FFIcons.knotification,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                            NotificationsWidget
                                                                .routeName);
                                                      },
                                                    ),
                                                    if (containerNotificationRowList
                                                            .length !=
                                                        0)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.5, -0.5),
                                                        child: Icon(
                                                          Icons.circle_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryCyan,
                                                          size: 10.0,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            FFIcons.kmore1,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            context.pushNamed(
                                                EditAdminWidget.routeName);
                                          },
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                    FutureBuilder<List<VenueOpenSlotsRow>>(
                                      future: VenueOpenSlotsTable().queryRows(
                                        queryFn: (q) => q
                                            .eqOrNull(
                                              'created_by',
                                              FFAppState().userId,
                                            )
                                            .gtOrNull(
                                              'start_date',
                                              supaSerialize<DateTime>(
                                                  getCurrentTimestamp),
                                            )
                                            .eqOrNull(
                                              'musician_id',
                                              null,
                                            )
                                            .eqOrNull(
                                              'is_booked',
                                              false,
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
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<VenueOpenSlotsRow>
                                            textVenueOpenSlotsRowList =
                                            snapshot.data!;

                                        return Text(
                                          'You have ${textVenueOpenSlotsRowList.length.toString()} open slots to fill.',
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
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 11.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                              OpenSlotDashboardWidget
                                                  .routeName);
                                        },
                                        text: 'Manage Slots',
                                        options: FFButtonOptions(
                                          height: 28.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  33.5, 0.0, 33.5, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryViolet,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.interTight(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          7.0, 30.0, 0.0, 0.0),
                                      child: Text(
                                        'Today’s Rundown,',
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
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          7.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          VenueGroup.getTodaysVenueRundownCall
                                              .date(
                                            homeVGetTodaysVenueRundownResponse
                                                .jsonBody,
                                          ),
                                          'Date',
                                        ),
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
                                    ),
                                    if (getJsonField(
                                          homeVGetTodaysVenueRundownResponse
                                              .jsonBody,
                                          r'''$..venues''',
                                        ) ==
                                        null)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 24.0, 0.0, 16.0),
                                          child: wrapWithModel(
                                            model: _model.emptyListImageModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: EmptyListImageWidget(
                                              msg:
                                                  'No rundown available for today',
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (getJsonField(
                                          homeVGetTodaysVenueRundownResponse
                                              .jsonBody,
                                          r'''$..venues''',
                                        ) !=
                                        null)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final venues = getJsonField(
                                              homeVGetTodaysVenueRundownResponse
                                                  .jsonBody,
                                              r'''$..venues''',
                                            ).toList();
                                            if (venues.isEmpty) {
                                              return EmptyListImageWidget(
                                                msg:
                                                    'No rundown available for today',
                                              );
                                            }

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: venues.length,
                                              itemBuilder:
                                                  (context, venuesIndex) {
                                                final venuesItem =
                                                    venues[venuesIndex];
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .location_on_outlined,
                                                          color:
                                                              Color(0xFF01CDD0),
                                                          size: 24.0,
                                                        ),
                                                        Text(
                                                          getJsonField(
                                                            venuesItem,
                                                            r'''$.venue_name''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                      ].divide(
                                                          SizedBox(width: 4.0)),
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        final slotsList =
                                                            getJsonField(
                                                          venuesItem,
                                                          r'''$.slots''',
                                                        ).toList();

                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              slotsList.length,
                                                              (slotsListIndex) {
                                                            final slotsListItem =
                                                                slotsList[
                                                                    slotsListIndex];
                                                            return InkWell(
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
                                                                context
                                                                    .pushNamed(
                                                                  VenueGigViewOverlayWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'slotId':
                                                                        serializeParam(
                                                                      200,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                    'threadId':
                                                                        serializeParam(
                                                                      200,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child:
                                                                  CHRDVenueDetailsWidget(
                                                                key: Key(
                                                                    'Key26e_${slotsListIndex}_of_${slotsList.length}'),
                                                                venueName:
                                                                    getJsonField(
                                                                  slotsListItem,
                                                                  r'''$.musician_name''',
                                                                ).toString(),
                                                                stageName:
                                                                    getJsonField(
                                                                  slotsListItem,
                                                                  r'''$.stage_name''',
                                                                ).toString(),
                                                                venueImage:
                                                                    getJsonField(
                                                                  slotsListItem,
                                                                  r'''$.musician_profile_photo''',
                                                                ).toString(),
                                                                time:
                                                                    getJsonField(
                                                                  slotsListItem,
                                                                  r'''$.start_time''',
                                                                ).toString(),
                                                              ),
                                                            );
                                                          }).divide(SizedBox(
                                                              height: 16.0)),
                                                        );
                                                      },
                                                    ),
                                                    Divider(
                                                      thickness: 1.0,
                                                      color: Color(0x33FFFFFF),
                                                    ),
                                                  ]
                                                      .divide(SizedBox(
                                                          height: 16.0))
                                                      .addToStart(SizedBox(
                                                          height: 16.0)),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
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
                                        text: 'Go to full planner',
                                        options: FFButtonOptions(
                                          height: 28.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  33.5, 0.0, 33.5, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryViolet,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.interTight(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 26.0, 0.0, 17.0),
                                      child: Text(
                                        'Your Venues',
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
                                    ),
                                  ].addToStart(SizedBox(height: 64.0)),
                                ),
                              ),
                            ),
                            Container(
                              height: 200.0,
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  final venueList =
                                      VenueGroup.getTodaysVenueRundownCall
                                              .venueList(
                                                homeVGetTodaysVenueRundownResponse
                                                    .jsonBody,
                                              )
                                              ?.toList() ??
                                          [];
                                  if (venueList.isEmpty) {
                                    return Center(
                                      child: NoVenueCreatedComponentWidget(),
                                    );
                                  }

                                  return ListView.separated(
                                    padding: EdgeInsets.fromLTRB(
                                      13.0,
                                      0,
                                      13.0,
                                      0,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: venueList.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(width: 11.0),
                                    itemBuilder: (context, venueListIndex) {
                                      final venueListItem =
                                          venueList[venueListIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            VenuesProfileViewWidget.routeName,
                                            queryParameters: {
                                              'venueId': serializeParam(
                                                getJsonField(
                                                  venueListItem,
                                                  r'''$.venue_id''',
                                                ),
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: 110.0,
                                          height: 200.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                child: Image.network(
                                                  getJsonField(
                                                    venueListItem,
                                                    r'''$.venue_photo''',
                                                  ).toString(),
                                                  width: 120.0,
                                                  height: 120.0,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    'assets/images/error_image.jpg',
                                                    width: 120.0,
                                                    height: 120.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  venueListItem,
                                                  r'''$.venue_name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                              Text(
                                                getJsonField(
                                                  venueListItem,
                                                  r'''$.venue_address''',
                                                ).toString(),
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
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            if (false)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    23.0, 11.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: 'Manage Venues',
                                  options: FFButtonOptions(
                                    height: 28.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        33.5, 0.0, 33.5, 0.0),
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                          ].addToEnd(SizedBox(height: 30.0)),
                        ),
                      ],
                    ),
                  ),
                  if (false)
                    wrapWithModel(
                      model: _model.venueNavBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: VenueNavBarWidget(
                        whichScreenActive: WhichScreenMusicianNavBar.home,
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
