import '/backend/api_requests/api_calls.dart';
import '/components/empty_list_image_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_open_booked/c_h_r_d_open_booked_widget.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'contract_board_venue_view_model.dart';
export 'contract_board_venue_view_model.dart';

class ContractBoardVenueViewWidget extends StatefulWidget {
  const ContractBoardVenueViewWidget({
    super.key,
    required this.musicianId,
    required this.musicianName,
    required this.venueId,
    required this.slotId,
  });

  final int? musicianId;
  final String? musicianName;
  final int? venueId;
  final int? slotId;

  static String routeName = 'contract_boardVenueView';
  static String routePath = '/contractBoardVenueView';

  @override
  State<ContractBoardVenueViewWidget> createState() =>
      _ContractBoardVenueViewWidgetState();
}

class _ContractBoardVenueViewWidgetState
    extends State<ContractBoardVenueViewWidget> {
  late ContractBoardVenueViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContractBoardVenueViewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().selectedCalendarDate = '';
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

    return FutureBuilder<ApiCallResponse>(
      future: MusicianGroup.getMusicianPlannerSlotsCall.call(
        musicianId: widget!.musicianId,
        selectedDate: FFAppState().selectedCalendarDate,
        searchText: '',
      ),
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
        final contractBoardVenueViewGetMusicianPlannerSlotsResponse =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.black,
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.arrow_back,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.safePop();
                          },
                        ),
                        Text(
                          'Dashboard',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          0,
                          0,
                          24.0,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${widget!.musicianName}\'s Calendar',
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 11.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Divider(
                                      thickness: 1.0,
                                      color: Color(0x34FFFFFF),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 400.0,
                                      child: custom_widgets.ShowCalender(
                                        width: double.infinity,
                                        height: 400.0,
                                        userId: widget!.musicianId!,
                                        type: 'musician',
                                        selectedDate:
                                            FFAppState().selectedCalendarDate,
                                        searchText: '',
                                        slotStatus: 'open',
                                        venueIds: FFAppState().FilteredVenueIds,
                                        ontap: () async {},
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 11.0))
                                      .addToStart(SizedBox(height: 12.0)),
                                ),
                                Builder(
                                  builder: (context) {
                                    final slotsDetailedList =
                                        contractBoardVenueViewGetMusicianPlannerSlotsResponse
                                            .jsonBody
                                            .toList();
                                    if (slotsDetailedList.isEmpty) {
                                      return EmptyListImageWidget(
                                        msg: 'No Gigs Available',
                                      );
                                    }

                                    return ListView.separated(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        16.0,
                                        0,
                                        16.0,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: slotsDetailedList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 16.0),
                                      itemBuilder:
                                          (context, slotsDetailedListIndex) {
                                        final slotsDetailedListItem =
                                            slotsDetailedList[
                                                slotsDetailedListIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              getJsonField(
                                                slotsDetailedListItem,
                                                r'''$.formatted_date''',
                                              ).toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final contractSlots =
                                                    getJsonField(
                                                  slotsDetailedListItem,
                                                  r'''$.slots''',
                                                ).toList();

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      contractSlots.length,
                                                      (contractSlotsIndex) {
                                                    final contractSlotsItem =
                                                        contractSlots[
                                                            contractSlotsIndex];
                                                    return Container(
                                                      width: double.infinity,
                                                      height: 74.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x24FFFFFF),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    9.0,
                                                                    7.0,
                                                                    11.0,
                                                                    8.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x47000000),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 44.0,
                                                                height: 44.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFF01CDD0),
                                                                      Color(
                                                                          0xFF04C8D0),
                                                                      Color(
                                                                          0xFF0EBCD1),
                                                                      Color(
                                                                          0xFF20A7D4),
                                                                      Color(
                                                                          0xFF3A89D8),
                                                                      Color(
                                                                          0xFF6951DC),
                                                                      Color(
                                                                          0xFF8D28E3)
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
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    end:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            0),
                                                                  ),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              500.0),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fadeInDuration:
                                                                            Duration(milliseconds: 500),
                                                                        fadeOutDuration:
                                                                            Duration(milliseconds: 500),
                                                                        imageUrl:
                                                                            getJsonField(
                                                                          contractSlotsItem,
                                                                          r'''$.venue_image''',
                                                                        ).toString(),
                                                                        width:
                                                                            42.0,
                                                                        height:
                                                                            42.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        errorWidget: (context,
                                                                                error,
                                                                                stackTrace) =>
                                                                            Image.asset(
                                                                          'assets/images/error_image.jpg',
                                                                          width:
                                                                              42.0,
                                                                          height:
                                                                              42.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          21.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        getJsonField(
                                                                          contractSlotsItem,
                                                                          r'''$.venue_name''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.montserrat(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: getJsonField(
                                                                                contractSlotsItem,
                                                                                r'''$.start_time''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.montserrat(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 11.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: ' | ',
                                                                              style: TextStyle(),
                                                                            ),
                                                                            TextSpan(
                                                                              text: getJsonField(
                                                                                contractSlotsItem,
                                                                                r'''$.stage_name''',
                                                                              ).toString(),
                                                                              style: TextStyle(),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.montserrat(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            6.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                              wrapWithModel(
                                                                model: _model
                                                                    .cHRDOpenBookedModels
                                                                    .getModel(
                                                                  getCurrentTimestamp
                                                                      .toString(),
                                                                  contractSlotsIndex,
                                                                ),
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    CHRDOpenBookedWidget(
                                                                  key: Key(
                                                                    'Keywx2_${getCurrentTimestamp.toString()}',
                                                                  ),
                                                                  heading:
                                                                      getJsonField(
                                                                    contractSlotsItem,
                                                                    r'''$.booking_status''',
                                                                  ).toString(),
                                                                  backcolor: 'Open' ==
                                                                          getJsonField(
                                                                            contractSlotsItem,
                                                                            r'''$.booking_status''',
                                                                          ).toString()
                                                                      ? Color(0x44FFB140)
                                                                      : Color(0x498B2BE3),
                                                                  iconColor: 'Open' ==
                                                                          getJsonField(
                                                                            contractSlotsItem,
                                                                            r'''$.booking_status''',
                                                                          ).toString()
                                                                      ? FlutterFlowTheme.of(context).openColor
                                                                      : FlutterFlowTheme.of(context).primaryViolet,
                                                                ),
                                                              ),
                                                              if (false)
                                                                FlutterFlowIconButton(
                                                                  borderRadius:
                                                                      8.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .arrow_forward_ios_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'IconButton pressed ...');
                                                                  },
                                                                ),
                                                            ]
                                                                .addToStart(
                                                                    SizedBox(
                                                                        width:
                                                                            6.0))
                                                                .addToEnd(
                                                                    SizedBox(
                                                                        width:
                                                                            6.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }).divide(
                                                      SizedBox(height: 8.0)),
                                                );
                                              },
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                              color: Color(0x32FFFFFF),
                                            ),
                                          ].divide(SizedBox(height: 14.0)),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ]
                                  .addToStart(SizedBox(height: 27.0))
                                  .addToEnd(SizedBox(height: 70.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (false)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 16.0, 20.0, 0.0),
                        child: wrapWithModel(
                          model: _model.cHRDLabelBtnModel,
                          updateCallback: () => safeSetState(() {}),
                          child: CHRDLabelBtnWidget(
                            heading: 'Message ${widget!.musicianName}',
                            txtColor: FlutterFlowTheme.of(context).primaryText,
                            btnColor:
                                FlutterFlowTheme.of(context).primaryViolet,
                            borderColor:
                                FlutterFlowTheme.of(context).primaryViolet,
                            hight: 45.0,
                            headingFontSize: 14,
                            isDisiable: false,
                            onTab: () async {
                              var _shouldSetState = false;
                              _model.upsertOutputGenral =
                                  await VenueGroup.upsertGigsCall.call(
                                venueId: widget!.venueId,
                                musicianId: widget!.musicianId,
                                slotid: widget!.slotId,
                                venueOwnerId: FFAppState().userId,
                              );

                              _shouldSetState = true;
                              if ((_model.upsertOutputGenral?.succeeded ??
                                  true)) {
                                Navigator.pop(context);

                                context.pushNamed(
                                  CustomChatVenueWidget.routeName,
                                  queryParameters: {
                                    'threadId': serializeParam(
                                      getJsonField(
                                        (_model.upsertOutputGenral?.jsonBody ??
                                            ''),
                                        r'''$..general_thread_id''',
                                      ),
                                      ParamType.int,
                                    ),
                                    'isVenue': serializeParam(
                                      true,
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
