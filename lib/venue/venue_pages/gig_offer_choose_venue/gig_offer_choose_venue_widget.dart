import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'gig_offer_choose_venue_model.dart';
export 'gig_offer_choose_venue_model.dart';

class GigOfferChooseVenueWidget extends StatefulWidget {
  const GigOfferChooseVenueWidget({
    super.key,
    required this.musicianImage,
    required this.musicianName,
    required this.musicianId,
    required this.venueName,
    required this.venueImage,
  });

  final String? musicianImage;
  final String? musicianName;
  final int? musicianId;
  final String? venueName;
  final String? venueImage;

  static String routeName = 'gig_offer_choose_venue';
  static String routePath = '/gigOfferChooseVenue';

  @override
  State<GigOfferChooseVenueWidget> createState() =>
      _GigOfferChooseVenueWidgetState();
}

class _GigOfferChooseVenueWidgetState extends State<GigOfferChooseVenueWidget> {
  late GigOfferChooseVenueModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GigOfferChooseVenueModel());

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
      future: VenueGroup.getUserVenuesCall.call(
        userId: FFAppState().userId,
        name: '',
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
                    FlutterFlowTheme.of(context).primaryViolet,
                  ),
                ),
              ),
            ),
          );
        }
        final gigOfferChooseVenueGetUserVenuesResponse = snapshot.data!;

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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
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
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                    child: Builder(
                      builder: (context) {
                        if ((gigOfferChooseVenueGetUserVenuesResponse.jsonBody
                                            .toList()
                                            .map<UserVenueModelStruct?>(
                                                UserVenueModelStruct.maybeFromMap)
                                            .toList()
                                        as Iterable<UserVenueModelStruct?>)
                                    .withoutNulls !=
                                null &&
                            ((gigOfferChooseVenueGetUserVenuesResponse.jsonBody
                                            .toList()
                                            .map<UserVenueModelStruct?>(
                                                UserVenueModelStruct.maybeFromMap)
                                            .toList()
                                        as Iterable<UserVenueModelStruct?>)
                                    .withoutNulls)!
                                .isNotEmpty) {
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(
                                    thickness: 0.3,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 21.0, 0.0, 19.0),
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
                                              stops: [
                                                0.0,
                                                0.3,
                                                0.4,
                                                0.5,
                                                0.6,
                                                0.7,
                                                1.0
                                              ],
                                              begin: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              end: AlignmentDirectional(1.0, 0),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        500.0),
                                                child: CachedNetworkImage(
                                                  fadeInDuration: Duration(
                                                      milliseconds: 500),
                                                  fadeOutDuration: Duration(
                                                      milliseconds: 500),
                                                  imageUrl:
                                                      '${widget!.musicianImage}',
                                                  width: 43.0,
                                                  height: 43.0,
                                                  fit: BoxFit.cover,
                                                  errorWidget: (context, error,
                                                          stackTrace) =>
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  widget!.musicianName,
                                                  'Musician',
                                                ),
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
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    VenueMusicianProfile1Widget
                                                        .routeName,
                                                    queryParameters: {
                                                      'musicianId':
                                                          serializeParam(
                                                        widget!.musicianId,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Text(
                                                  'View profile',
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .neutralDark500,
                                                        fontSize: 14.0,
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
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
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
                                    'Start by choosing your venue. Information will autofill from profile.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .neutralDark500,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 19.0, 0.0, 0.0),
                                    child: Text(
                                      'Which venue is this gig for?',
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      'Choose venue',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xA6D9D9D9),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 18.0, 0.0, 18.0),
                                    child: Builder(
                                      builder: (context) {
                                        final venueList =
                                            gigOfferChooseVenueGetUserVenuesResponse
                                                .jsonBody
                                                .toList();

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: venueList.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 21.0),
                                          itemBuilder:
                                              (context, venueListIndex) {
                                            final venueListItem =
                                                venueList[venueListIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState()
                                                    .updateGigOfferStruct(
                                                  (e) => e
                                                    ..venueId = getJsonField(
                                                      venueListItem,
                                                      r'''$.id''',
                                                    )
                                                    ..venueName = getJsonField(
                                                      venueListItem,
                                                      r'''$.name''',
                                                    ).toString(),
                                                );
                                                safeSetState(() {});
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if ('${FFAppState().gigOffer.venueId.toString()}' !=
                                                          getJsonField(
                                                            venueListItem,
                                                            r'''$.id''',
                                                          ).toString())
                                                        Icon(
                                                          Icons
                                                              .radio_button_off,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryViolet,
                                                          size: 24.0,
                                                        ),
                                                      if ('${FFAppState().gigOffer.venueId.toString()}' ==
                                                          getJsonField(
                                                            venueListItem,
                                                            r'''$.id''',
                                                          ).toString())
                                                        Icon(
                                                          Icons
                                                              .radio_button_checked_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryViolet,
                                                          size: 24.0,
                                                        ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        getJsonField(
                                                          venueListItem,
                                                          r'''$.name''',
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
                                                                  fontSize:
                                                                      16.0,
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
                                                    ],
                                                  ),
                                                ].divide(SizedBox(width: 16.0)),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ].addToStart(SizedBox(height: 19.0)),
                              ),
                            ),
                          );
                        } else {
                          return Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'You haven\'t created any venue yet.',
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
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  if ((gigOfferChooseVenueGetUserVenuesResponse.jsonBody
                                  .toList()
                                  .map<UserVenueModelStruct?>(
                                      UserVenueModelStruct.maybeFromMap)
                                  .toList() as Iterable<UserVenueModelStruct?>)
                              .withoutNulls !=
                          null &&
                      ((gigOfferChooseVenueGetUserVenuesResponse.jsonBody
                                  .toList()
                                  .map<UserVenueModelStruct?>(
                                      UserVenueModelStruct.maybeFromMap)
                                  .toList() as Iterable<UserVenueModelStruct?>)
                              .withoutNulls)!
                          .isNotEmpty)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: wrapWithModel(
                        model: _model.cHRDLabelBtnModel,
                        updateCallback: () => safeSetState(() {}),
                        child: CHRDLabelBtnWidget(
                          heading: 'Next',
                          txtColor: FlutterFlowTheme.of(context).primaryText,
                          btnColor: FlutterFlowTheme.of(context).primaryViolet,
                          borderColor:
                              FlutterFlowTheme.of(context).primaryViolet,
                          hight: 45.0,
                          headingFontSize: 14,
                          isDisiable: false,
                          onTab: () async {
                            context.pushNamed(
                              GigOfferChooseSlotWidget.routeName,
                              queryParameters: {
                                'musicianImage': serializeParam(
                                  widget!.musicianImage,
                                  ParamType.String,
                                ),
                                'musicinaName': serializeParam(
                                  widget!.musicianName,
                                  ParamType.String,
                                ),
                                'musicianId': serializeParam(
                                  widget!.musicianId,
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                            );
                          },
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
      },
    );
  }
}
