import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/confirmation_dialog_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_backout_gig/c_h_r_d_backout_gig_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_price_amount/c_h_r_d_price_amount_widget.dart';
import '/musician/components/c_h_r_d_remove_musician/c_h_r_d_remove_musician_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_performance_stages/c_h_r_d_performance_stages_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_row_with_icon/c_h_r_d_row_with_icon_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_video_player_component/c_h_r_d_video_player_component_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'venue_gig_contract_overlay_model.dart';
export 'venue_gig_contract_overlay_model.dart';

class VenueGigContractOverlayWidget extends StatefulWidget {
  const VenueGigContractOverlayWidget({
    super.key,
    required this.slotId,
    required this.threadId,
    this.musicianName,
    bool? isViewOnly,
  }) : this.isViewOnly = isViewOnly ?? false;

  final int? slotId;
  final int? threadId;
  final String? musicianName;
  final bool isViewOnly;

  static String routeName = 'venue_gig_contract_overlay';
  static String routePath = '/venueGigContractOverlay';

  @override
  State<VenueGigContractOverlayWidget> createState() =>
      _VenueGigContractOverlayWidgetState();
}

class _VenueGigContractOverlayWidgetState
    extends State<VenueGigContractOverlayWidget> {
  late VenueGigContractOverlayModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VenueGigContractOverlayModel());

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
        final venueGigContractOverlayGetSingleSlotDetailsResponse =
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
                                          venueGigContractOverlayGetSingleSlotDetailsResponse
                                              .jsonBody,
                                          r'''$.data.is_booked''',
                                        ).toString()
                                    ? getJsonField(
                                        venueGigContractOverlayGetSingleSlotDetailsResponse
                                            .jsonBody,
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
                                    venueGigContractOverlayGetSingleSlotDetailsResponse
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
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if ('true' ==
                                            getJsonField(
                                              venueGigContractOverlayGetSingleSlotDetailsResponse
                                                  .jsonBody,
                                              r'''$.data.is_booked''',
                                            ).toString()) {
                                          return;
                                        }

                                        context.pushNamed(
                                          SelectTalentWidget.routeName,
                                          queryParameters: {
                                            'venueId': serializeParam(
                                              getJsonField(
                                                venueGigContractOverlayGetSingleSlotDetailsResponse
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
                                                venueGigContractOverlayGetSingleSlotDetailsResponse
                                                    .jsonBody,
                                                r'''$.data.venue_name''',
                                              ).toString(),
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );

                                        return;
                                      },
                                      child: Text(
                                        'true' ==
                                                getJsonField(
                                                  venueGigContractOverlayGetSingleSlotDetailsResponse
                                                      .jsonBody,
                                                  r'''$.data.is_booked''',
                                                ).toString()
                                            ? getJsonField(
                                                venueGigContractOverlayGetSingleSlotDetailsResponse
                                                    .jsonBody,
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
                              if (('true' ==
                                      getJsonField(
                                        venueGigContractOverlayGetSingleSlotDetailsResponse
                                            .jsonBody,
                                        r'''$.data.is_booked''',
                                      ).toString()) &&
                                  (FFAppState().userType == Type.Venue))
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Builder(
                                    builder: (context) => Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 2.0, 0.0, 2.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
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
                                                  child:
                                                      CHRDRemoveMusicianWidget(
                                                    musicianName: getJsonField(
                                                      venueGigContractOverlayGetSingleSlotDetailsResponse
                                                          .jsonBody,
                                                      r'''$.data.musician_name''',
                                                    ).toString(),
                                                    removeBtnAction: () async {
                                                      var _shouldSetState =
                                                          false;
                                                      _model.removeMusicianOutput =
                                                          await VenueGroup
                                                              .removeMusicianFromGigCall
                                                              .call(
                                                        pSenderId:
                                                            FFAppState().userId,
                                                        pThreadId:
                                                            widget!.threadId,
                                                      );

                                                      _shouldSetState = true;
                                                      if ((_model
                                                              .removeMusicianOutput
                                                              ?.succeeded ??
                                                          true)) {
                                                        await NotificationGroup
                                                            .sendNotificationCall
                                                            .call(
                                                          title:
                                                              '${getJsonField(
                                                            venueGigContractOverlayGetSingleSlotDetailsResponse
                                                                .jsonBody,
                                                            r'''$.data.venue_name''',
                                                          ).toString()} removed you from gig',
                                                          type:
                                                              'PerformerRemoved',
                                                          description:
                                                              'You have been removed from gig by ${getJsonField(
                                                            venueGigContractOverlayGetSingleSlotDetailsResponse
                                                                .jsonBody,
                                                            r'''$.data.venue_name''',
                                                          ).toString()}. Please check your gigs section for updated bookings and availability.',
                                                          sendToList:
                                                              (int var1) {
                                                            return List<
                                                                String>.from([
                                                              var1.toString()
                                                            ]);
                                                          }(getJsonField(
                                                            venueGigContractOverlayGetSingleSlotDetailsResponse
                                                                .jsonBody,
                                                            r'''$.data.musician_id''',
                                                          )),
                                                          usertype: FFAppState()
                                                              .userType
                                                              ?.name,
                                                          dataJson: <String,
                                                              dynamic>{
                                                            'thread_id': widget!
                                                                .threadId,
                                                            'is_venue': 'true',
                                                          },
                                                        );

                                                        await NotificationTable()
                                                            .insert({
                                                          'user_id':
                                                              getJsonField(
                                                            venueGigContractOverlayGetSingleSlotDetailsResponse
                                                                .jsonBody,
                                                            r'''$.data.musician_id''',
                                                          ),
                                                          'title':
                                                              '${getJsonField(
                                                            venueGigContractOverlayGetSingleSlotDetailsResponse
                                                                .jsonBody,
                                                            r'''$.data.venue_name''',
                                                          ).toString()} removed you from gig',
                                                          'description':
                                                              '${getJsonField(
                                                            venueGigContractOverlayGetSingleSlotDetailsResponse
                                                                .jsonBody,
                                                            r'''$.data.venue_name''',
                                                          ).toString()} removed you from gig',
                                                          'type':
                                                              'PerformerRemoved',
                                                          'data':
                                                              <String, dynamic>{
                                                            'thread_id': widget!
                                                                .threadId,
                                                            'is_venue': 'true',
                                                          },
                                                          'usertype':
                                                              FFAppState()
                                                                  .userType
                                                                  ?.name,
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

                                                        context.goNamed(
                                                          NavPageWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'index':
                                                                serializeParam(
                                                              2,
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                        );

                                                        return;
                                                      } else {
                                                        return;
                                                      }
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          );

                                          safeSetState(() {});
                                        },
                                        text: 'Remove',
                                        options: FFButtonOptions(
                                          height: 24.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
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
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if ('${FFAppState().userId.toString()}' !=
                                  getJsonField(
                                    venueGigContractOverlayGetSingleSlotDetailsResponse
                                        .jsonBody,
                                    r'''$.data.venue_owner_id''',
                                  ).toString())
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        ViewVenuePlannerWidget.routeName,
                                        queryParameters: {
                                          'venueId': serializeParam(
                                            getJsonField(
                                              venueGigContractOverlayGetSingleSlotDetailsResponse
                                                  .jsonBody,
                                              r'''$.data.venue_id''',
                                            ),
                                            ParamType.int,
                                          ),
                                          'venueOwnerId': serializeParam(
                                            getJsonField(
                                              venueGigContractOverlayGetSingleSlotDetailsResponse
                                                  .jsonBody,
                                              r'''$.data.venue_owner_id''',
                                            ),
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
                                venueGigContractOverlayGetSingleSlotDetailsResponse
                                    .jsonBody,
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
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.8,
                                        child: CHRDPriceAmountWidget(
                                          confirmAction: (priceValue) async {
                                            _model.addedPrice = (String value) {
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
                        ),
                      if (widget!.isViewOnly &&
                          ('${FFAppState().userId.toString()}' ==
                              getJsonField(
                                venueGigContractOverlayGetSingleSlotDetailsResponse
                                    .jsonBody,
                                r'''$..created_by''',
                              ).toString()))
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
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.8,
                                        child: CHRDPriceAmountWidget(
                                          confirmAction: (priceValue) async {
                                            _model.addedPrice = (String value) {
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
                            text: getJsonField(
                              venueGigContractOverlayGetSingleSlotDetailsResponse
                                  .jsonBody,
                              r'''$..contract_price''',
                            ).toString(),
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
                                  venueGigContractOverlayGetSingleSlotDetailsResponse
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
                                        venueGigContractOverlayGetSingleSlotDetailsResponse
                                            .jsonBody,
                                        r'''$.data.repeat_type''',
                                      ).toString()} from ${getJsonField(
                                        venueGigContractOverlayGetSingleSlotDetailsResponse
                                            .jsonBody,
                                        r'''$.data.start_date''',
                                      ).toString()} until ${getJsonField(
                                        venueGigContractOverlayGetSingleSlotDetailsResponse
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
                                            getJsonField(
                                              venueGigContractOverlayGetSingleSlotDetailsResponse
                                                  .jsonBody,
                                              r'''$.data.start_date''',
                                            ).toString(),
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
                                          if (false)
                                            Text(
                                              'in ${_model.days}',
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
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  venueGigContractOverlayGetSingleSlotDetailsResponse
                                                      .jsonBody,
                                                  r'''$.data.start_time''',
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
                                              Text(
                                                '-',
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
                                              Text(
                                                getJsonField(
                                                  venueGigContractOverlayGetSingleSlotDetailsResponse
                                                      .jsonBody,
                                                  r'''$.data.end_time''',
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                subHead: getJsonField(
                                  venueGigContractOverlayGetSingleSlotDetailsResponse
                                      .jsonBody,
                                  r'''$.data.load_time''',
                                ).toString(),
                                showArrow: FFAppState().userType == Type.Venue,
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
                                  venueGigContractOverlayGetSingleSlotDetailsResponse
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
                                  subHead: VenueGroup.getSingleSlotDetailsCall
                                      .stageName(
                                    venueGigContractOverlayGetSingleSlotDetailsResponse
                                        .jsonBody,
                                  )!,
                                  showArrow:
                                      FFAppState().userType == Type.Venue,
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
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Container(
                                              height: 300.0,
                                              child:
                                                  CHRDPerformanceStagesWidget(
                                                venueId: 0,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(
                                        () => _model.performanceStage = value));

                                    safeSetState(() {});
                                  },
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                final stageImages = getJsonField(
                                  venueGigContractOverlayGetSingleSlotDetailsResponse
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
                            if (('${''}' !=
                                    getJsonField(
                                      venueGigContractOverlayGetSingleSlotDetailsResponse
                                          .jsonBody,
                                      r'''$.data.notes''',
                                    ).toString()) &&
                                ('null' !=
                                    getJsonField(
                                      venueGigContractOverlayGetSingleSlotDetailsResponse
                                          .jsonBody,
                                      r'''$.data.notes''',
                                    ).toString()))
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
                                      ),
                                    ].divide(SizedBox(width: 10.0)),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0x7B7B7B7B),
                                      borderRadius: BorderRadius.circular(8.0),
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
                                              venueGigContractOverlayGetSingleSlotDetailsResponse
                                                  .jsonBody,
                                              r'''$.data.notes''',
                                            ).toString(),
                                            textAlign: TextAlign.start,
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
                                    getJsonField(
                                      venueGigContractOverlayGetSingleSlotDetailsResponse
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
                            if ('false' ==
                                getJsonField(
                                  venueGigContractOverlayGetSingleSlotDetailsResponse
                                      .jsonBody,
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
                                          builder: (context) => wrapWithModel(
                                            model: _model.cHRDLabelBtnModel1,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: CHRDLabelBtnWidget(
                                              heading: 'Remove Event',
                                              txtColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              btnColor:
                                                  FlutterFlowTheme.of(context)
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
                                                          FocusManager.instance
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
                                                            var _shouldSetState =
                                                                false;
                                                            _model.fetchedMusicianList =
                                                                await VenueGroup
                                                                    .fetchMusiciansOfGigCall
                                                                    .call(
                                                              pSlotId: widget!
                                                                  .slotId,
                                                            );

                                                            _shouldSetState =
                                                                true;
                                                            if ((_model
                                                                    .fetchedMusicianList
                                                                    ?.succeeded ??
                                                                true)) {
                                                              if (true ==
                                                                  getJsonField(
                                                                    (_model.fetchedMusicianList
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.has_musician''',
                                                                  )) {
                                                                await NotificationGroup
                                                                    .sendNotificationCall
                                                                    .call(
                                                                  title:
                                                                      '${getJsonField(
                                                                    venueGigContractOverlayGetSingleSlotDetailsResponse
                                                                        .jsonBody,
                                                                    r'''$.data.venue_name''',
                                                                  ).toString()} Removed a Gig',
                                                                  description:
                                                                      'This gig has been removed  by the ${getJsonField(
                                                                    venueGigContractOverlayGetSingleSlotDetailsResponse
                                                                        .jsonBody,
                                                                    r'''$.data.venue_name''',
                                                                  ).toString()} and is no longer active.',
                                                                  sendToList: functions
                                                                      .parseStringList(
                                                                          getJsonField(
                                                                    (_model.fetchedMusicianList
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.musician_ids''',
                                                                  )),
                                                                  usertype:
                                                                      FFAppState()
                                                                          .userType
                                                                          ?.name,
                                                                  type:
                                                                      'venueCancelled',
                                                                );
                                                              }
                                                              _model.hardDeleteGig =
                                                                  await VenueGroup
                                                                      .hardDeleteVenueSlotCall
                                                                      .call(
                                                                pSlotId: widget!
                                                                    .slotId,
                                                              );

                                                              _shouldSetState =
                                                                  true;
                                                              if ((_model
                                                                      .hardDeleteGig
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                Navigator.pop(
                                                                    context);
                                                                context
                                                                    .safePop();
                                                                return;
                                                              } else {
                                                                return;
                                                              }
                                                            } else {
                                                              return;
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
                                              venueGigContractOverlayGetSingleSlotDetailsResponse
                                                  .jsonBody,
                                              r'''$.data.repeat_type''',
                                            ).toString()) &&
                                        (FFAppState().userType == Type.Venue))
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
                                                ViewSequenceWidget.routeName,
                                                queryParameters: {
                                                  'groupId': serializeParam(
                                                    getJsonField(
                                                      venueGigContractOverlayGetSingleSlotDetailsResponse
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
                  if (('true' !=
                          getJsonField(
                            venueGigContractOverlayGetSingleSlotDetailsResponse
                                .jsonBody,
                            r'''$.data.is_booked''',
                          ).toString()) &&
                      (FFAppState().userType == Type.Venue))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: wrapWithModel(
                        model: _model.cHRDLabelBtnModel3,
                        updateCallback: () => safeSetState(() {}),
                        child: CHRDLabelBtnWidget(
                          heading: 'true' ==
                                  getJsonField(
                                    venueGigContractOverlayGetSingleSlotDetailsResponse
                                        .jsonBody,
                                    r'''$.data.is_booked''',
                                  ).toString()
                              ? 'Close'
                              : 'Modify contract',
                          txtColor: FlutterFlowTheme.of(context).primaryText,
                          btnColor: FlutterFlowTheme.of(context).primaryViolet,
                          borderColor: FlutterFlowTheme.of(context).btnColor,
                          hight: 45.0,
                          headingFontSize: 14,
                          isDisiable: _model.addedPrice == null,
                          onTab: () async {
                            if ('true' ==
                                getJsonField(
                                  venueGigContractOverlayGetSingleSlotDetailsResponse
                                      .jsonBody,
                                  r'''$.data.is_booked''',
                                ).toString()) {
                              context.safePop();
                              return;
                            } else {
                              await ThreadMessagesTable().insert({
                                'message_type': 'toast',
                                'created_at': supaSerialize<DateTime>(functions
                                    .toUtcTimestamp(getCurrentTimestamp)),
                                'thread_id': widget!.threadId,
                                'sender_id': FFAppState().userId,
                                'message_content':
                                    'You made changes to the gig proposal',
                                'alternate_message':
                                    'Venue updated the gig proposal.',
                              });
                              if (_model.addedPrice != null) {
                                await GigContractsTable().update(
                                  data: {
                                    'price': _model.addedPrice,
                                    'updated_at': supaSerialize<DateTime>(
                                        functions.toUtcTimestamp(
                                            getCurrentTimestamp)),
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'gig_thread_id',
                                    widget!.threadId,
                                  ),
                                );
                                await ThreadMessagesTable().insert({
                                  'message_type': 'click',
                                  'created_at': supaSerialize<DateTime>(
                                      functions
                                          .toUtcTimestamp(getCurrentTimestamp)),
                                  'thread_id': widget!.threadId,
                                  'sender_id': FFAppState().userId,
                                  'message_content':
                                      'You made changes to the gig proposal',
                                  'alternate_message':
                                      'Review the gig proposal',
                                });
                              }
                              context.safePop();
                              return;
                            }
                          },
                        ),
                      ),
                    ),
                  if (('true' ==
                          getJsonField(
                            venueGigContractOverlayGetSingleSlotDetailsResponse
                                .jsonBody,
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
                            txtColor: FlutterFlowTheme.of(context).primaryText,
                            btnColor:
                                FlutterFlowTheme.of(context).primaryViolet,
                            borderColor: FlutterFlowTheme.of(context).btnColor,
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
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: CHRDBackoutGigWidget(
                                        dateTime: getJsonField(
                                          venueGigContractOverlayGetSingleSlotDetailsResponse
                                              .jsonBody,
                                          r'''$.data.start_date''',
                                        ).toString(),
                                        price: '${getJsonField(
                                          venueGigContractOverlayGetSingleSlotDetailsResponse
                                              .jsonBody,
                                          r'''$.data.start_time''',
                                        ).toString()} - ${getJsonField(
                                          venueGigContractOverlayGetSingleSlotDetailsResponse
                                              .jsonBody,
                                          r'''$.data.end_time''',
                                        ).toString()}',
                                        acceptActionBtn:
                                            (reasonFieldValue) async {
                                          _model.userOutput =
                                              await UsersTable().queryRows(
                                            queryFn: (q) => q.eqOrNull(
                                              'id',
                                              FFAppState().userId,
                                            ),
                                          );
                                          await GigContractsTable().update(
                                            data: {
                                              'contract_status':
                                                  GigStatus.Open.name,
                                              'updated_at':
                                                  supaSerialize<DateTime>(
                                                      functions.toUtcTimestamp(
                                                          getCurrentTimestamp)),
                                              'accepted_at':
                                                  supaSerialize<DateTime>(null),
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'gig_thread_id',
                                              widget!.threadId,
                                            ),
                                          );
                                          await ThreadMessagesTable().insert({
                                            'created_at':
                                                supaSerialize<DateTime>(
                                                    functions.toUtcTimestamp(
                                                        getCurrentTimestamp)),
                                            'thread_id': widget!.threadId,
                                            'sender_id': FFAppState().userId,
                                            'message_type': 'text',
                                            'message_content': reasonFieldValue,
                                          });
                                          await ThreadMessagesTable().insert({
                                            'created_at':
                                                supaSerialize<DateTime>(
                                                    functions.toUtcTimestamp(
                                                        getCurrentTimestamp)),
                                            'thread_id': widget!.threadId,
                                            'sender_id': FFAppState().userId,
                                            'message_type': 'toast',
                                            'message_content':
                                                'Performer has backed out from this gig.',
                                          });
                                          _model.backOutOutput =
                                              await MusicianGroup.backOutCall
                                                  .call(
                                            pThreadId: widget!.threadId,
                                          );

                                          await NotificationGroup
                                              .sendNotificationCall
                                              .call(
                                            title:
                                                '${_model.userOutput?.firstOrNull?.name} backed out',
                                            type: 'PerformerBackedout',
                                            description:
                                                '${_model.userOutput?.firstOrNull?.name} backed out of your booking.',
                                            sendToList: (int var1) {
                                              return List<String>.from(
                                                  [var1.toString()]);
                                            }(getJsonField(
                                              venueGigContractOverlayGetSingleSlotDetailsResponse
                                                  .jsonBody,
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
                                              venueGigContractOverlayGetSingleSlotDetailsResponse
                                                  .jsonBody,
                                              r'''$..created_by''',
                                            ),
                                            'title':
                                                '${_model.userOutput?.firstOrNull?.name} backed out',
                                            'description':
                                                '${_model.userOutput?.firstOrNull?.name} backed out of your booking.',
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
                                                    functions.toUtcTimestamp(
                                                        getCurrentTimestamp)),
                                            'updated_at':
                                                supaSerialize<DateTime>(
                                                    functions.toUtcTimestamp(
                                                        getCurrentTimestamp)),
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
                  if (widget!.isViewOnly)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: wrapWithModel(
                        model: _model.cHRDLabelBtnModel5,
                        updateCallback: () => safeSetState(() {}),
                        child: CHRDLabelBtnWidget(
                          heading: 'Close',
                          txtColor: FlutterFlowTheme.of(context).primaryText,
                          btnColor: FlutterFlowTheme.of(context).primaryViolet,
                          borderColor: FlutterFlowTheme.of(context).btnColor,
                          hight: 45.0,
                          headingFontSize: 14,
                          isDisiable: false,
                          onTab: () async {
                            context.safePop();
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
