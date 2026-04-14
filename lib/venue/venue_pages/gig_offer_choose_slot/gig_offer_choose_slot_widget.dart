import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/collapsable_slotlist_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'gig_offer_choose_slot_model.dart';
export 'gig_offer_choose_slot_model.dart';

class GigOfferChooseSlotWidget extends StatefulWidget {
  const GigOfferChooseSlotWidget({
    super.key,
    required this.musicianImage,
    required this.musicinaName,
    required this.musicianId,
  });

  final String? musicianImage;
  final String? musicinaName;
  final int? musicianId;

  static String routeName = 'gig_offer_choose_slot';
  static String routePath = '/gigOfferChooseSlot';

  @override
  State<GigOfferChooseSlotWidget> createState() =>
      _GigOfferChooseSlotWidgetState();
}

class _GigOfferChooseSlotWidgetState extends State<GigOfferChooseSlotWidget> {
  late GigOfferChooseSlotModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GigOfferChooseSlotModel());

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
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
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
                    Expanded(
                      child: Text(
                        'Gig Offer: ${FFAppState().vanueName}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          thickness: 0.3,
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 21.0, 0.0, 22.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 45.0,
                                height: 45.0,
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
                                      borderRadius:
                                          BorderRadius.circular(500.0),
                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            Duration(milliseconds: 500),
                                        fadeOutDuration:
                                            Duration(milliseconds: 500),
                                        imageUrl: '${widget!.musicianImage}',
                                        width: 43.0,
                                        height: 43.0,
                                        fit: BoxFit.cover,
                                        errorWidget:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'assets/images/error_image.jpg',
                                          width: 43.0,
                                          height: 43.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        widget!.musicinaName,
                                        'Musician',
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
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          VenueMusicianProfile1Widget.routeName,
                                          queryParameters: {
                                            'musicianId': serializeParam(
                                              widget!.musicianId,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Text(
                                        'View profile',
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
                                                      .neutralDark500,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                              decoration:
                                                  TextDecoration.underline,
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 6.0)),
                                ),
                              ),
                            ].divide(SizedBox(width: 13.0)),
                          ),
                        ),
                        Text(
                          'Select or Add Show Time',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Text(
                            'All your open slots for Wednesdays at LIV Nightclub',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .neutralDark500,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        FutureBuilder<ApiCallResponse>(
                          future: VenueGroup.fetchStageWithSlotsCall.call(
                            pVenueId: FFAppState().gigOffer.venueId,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final listViewFetchStageWithSlotsResponse =
                                snapshot.data!;

                            return Builder(
                              builder: (context) {
                                final stageList =
                                    listViewFetchStageWithSlotsResponse.jsonBody
                                        .toList();

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: stageList.length,
                                  itemBuilder: (context, stageListIndex) {
                                    final stageListItem =
                                        stageList[stageListIndex];
                                    return CollapsableSlotlistWidget(
                                      key: Key(
                                          'Keyczm_${stageListIndex}_of_${stageList.length}'),
                                      stageJson: stageListItem,
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ]
                          .addToStart(SizedBox(height: 19.0))
                          .addToEnd(SizedBox(height: 20.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(GigOfferVenueNotesWidget.routeName);
                  },
                  child: wrapWithModel(
                    model: _model.cHRDLabelBtnModel,
                    updateCallback: () => safeSetState(() {}),
                    child: CHRDLabelBtnWidget(
                      heading: 'Send offer',
                      txtColor: FlutterFlowTheme.of(context).primaryText,
                      btnColor: FlutterFlowTheme.of(context).primaryViolet,
                      borderColor: FlutterFlowTheme.of(context).primaryViolet,
                      hight: 45.0,
                      headingFontSize: 14,
                      isDisiable: FFAppState().gigOffer.slotId == null,
                      onTab: () async {
                        var _shouldSetState = false;
                        _model.upsertGigOfferOutput =
                            await VenueGroup.upsertGigsCall.call(
                          venueId: FFAppState().gigOffer.venueId,
                          musicianId: widget!.musicianId,
                          slotid: FFAppState().gigOffer.slotId,
                          venueOwnerId: FFAppState().userId,
                        );

                        _shouldSetState = true;
                        if ((_model.upsertGigOfferOutput?.succeeded ?? true)) {
                          if ('true' ==
                              getJsonField(
                                (_model.upsertGigOfferOutput?.jsonBody ?? ''),
                                r'''$..slot_thread_is_created_now''',
                              ).toString()) {
                            _model.notificationOutput = await NotificationGroup
                                .sendNotificationCall
                                .call(
                              title:
                                  '${FFAppState().gigOffer.venueName} invited you',
                              description:
                                  '${FFAppState().gigOffer.venueName} invited you to perform. Check details.',
                              sendToList: (int var1) {
                                return List<String>.from([var1.toString()]);
                              }(widget!.musicianId!),
                              type: 'PerformerInvited',
                              usertype: FFAppState().userType?.name,
                              dataJson: <String, dynamic>{
                                'is_venue': 'false',
                                'thread_id': getJsonField(
                                  (_model.upsertGigOfferOutput?.jsonBody ?? ''),
                                  r'''$..slot_thread_id''',
                                ),
                              },
                            );

                            _shouldSetState = true;
                            await NotificationTable().insert({
                              'user_id': widget!.musicianId,
                              'title':
                                  '${FFAppState().gigOffer.venueName} invited you',
                              'description':
                                  '${FFAppState().gigOffer.venueName} invited you to perform. Check details.',
                              'type': 'PerformerInvited',
                              'data': <String, dynamic>{
                                'is_venue': 'false',
                                'thread_id': getJsonField(
                                  (_model.upsertGigOfferOutput?.jsonBody ?? ''),
                                  r'''$..slot_thread_id''',
                                ),
                              },
                              'usertype': FFAppState().userType?.name,
                              'is_read': false,
                              'created_at': supaSerialize<DateTime>(functions
                                  .toUtcTimestamp(getCurrentTimestamp)),
                              'updated_at': supaSerialize<DateTime>(functions
                                  .toUtcTimestamp(getCurrentTimestamp)),
                            });
                          }
                          Navigator.pop(context);

                          context.pushNamed(
                            CustomChatVenueWidget.routeName,
                            queryParameters: {
                              'threadId': serializeParam(
                                getJsonField(
                                  (_model.upsertGigOfferOutput?.jsonBody ?? ''),
                                  r'''$..slot_thread_id''',
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
              ),
            ]
                .addToStart(SizedBox(height: 14.5))
                .addToEnd(SizedBox(height: 30.0)),
          ),
        ),
      ),
    );
  }
}
