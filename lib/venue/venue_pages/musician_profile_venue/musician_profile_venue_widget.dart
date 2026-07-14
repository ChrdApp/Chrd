import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/venue/venue_pages/venue_components/c_h_r_d_profile_post/c_h_r_d_profile_post_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'musician_profile_venue_model.dart';
export 'musician_profile_venue_model.dart';

class MusicianProfileVenueWidget extends StatefulWidget {
  const MusicianProfileVenueWidget({
    super.key,
    required this.musicianId,
  });

  final int? musicianId;

  static String routeName = 'musician_profile_venue';
  static String routePath = '/musicianProfileVenue';

  @override
  State<MusicianProfileVenueWidget> createState() =>
      _MusicianProfileVenueWidgetState();
}

class _MusicianProfileVenueWidgetState
    extends State<MusicianProfileVenueWidget> {
  late MusicianProfileVenueModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MusicianProfileVenueModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: MusicianGroup.getPerformerDetailsCall.call(
        performerId: widget!.musicianId,
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
        final musicianProfileVenueGetPerformerDetailsResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 270.0,
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 191.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/images/musician_Profile.png',
                              ).image,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderRadius: 100.0,
                                      buttonSize: 42.0,
                                      fillColor: Color(0x2BFFFFFF),
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        context.safePop();
                                      },
                                    ),
                                    FlutterFlowIconButton(
                                      borderRadius: 100.0,
                                      buttonSize: 42.0,
                                      fillColor: Color(0x2BFFFFFF),
                                      icon: Icon(
                                        FFIcons.k3dot,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ],
                                ),
                              ].addToStart(SizedBox(height: 56.0)),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.8),
                          child: Container(
                            width: 103.0,
                            height: 103.0,
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
                                begin: AlignmentDirectional(0.0, -1.0),
                                end: AlignmentDirectional(0, 1.0),
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primaryCyan,
                                width: 3.0,
                              ),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 103.0,
                              height: 103.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                valueOrDefault<String>(
                                  getJsonField(
                                    musicianProfileVenueGetPerformerDetailsResponse
                                        .jsonBody,
                                    r'''$.user.profile_photo''',
                                  )?.toString(),
                                  'https://kasnaqcqfuqnfydsjvpy.supabase.co/storage/v1/object/public/venueC/error.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.4, 0.95),
                          child: Container(
                            width: 55.0,
                            height: 55.0,
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
                                begin: AlignmentDirectional(0.0, -1.0),
                                end: AlignmentDirectional(0, 1.0),
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primaryCyan,
                                width: 2.0,
                              ),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 55.0,
                              height: 55.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/User_profile_Logo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            getJsonField(
                              musicianProfileVenueGetPerformerDetailsResponse
                                  .jsonBody,
                              r'''$.user.name''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 0.0, 0.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'DJ for ',
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
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                TextSpan(
                                  text: 'Highoff Group',
                                  style: GoogleFonts.montserrat(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryViolet,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                    decoration: TextDecoration.underline,
                                  ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Container(
                            width: 62.0,
                            height: 62.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context).primaryCyan,
                                  Color(0xFF20A7D4),
                                  FlutterFlowTheme.of(context).primaryViolet
                                ],
                                stops: [0.0, 0.5, 1.0],
                                begin: AlignmentDirectional(0.0, -1.0),
                                end: AlignmentDirectional(0, 1.0),
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).primaryViolet,
                                width: 1.0,
                              ),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              FFIcons.kcalendarMonth,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 32.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.5, 0.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).neutralDark900,
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RatingBar.builder(
                                    onRatingUpdate: (newValue) => safeSetState(
                                        () => _model.ratingBarValue = newValue),
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .openColor,
                                    ),
                                    direction: Axis.horizontal,
                                    initialRating: _model.ratingBarValue ??=
                                        3.0,
                                    unratedColor: Color(0x29FFB140),
                                    itemCount: 5,
                                    itemSize: 17.0,
                                    glowColor:
                                        FlutterFlowTheme.of(context).openColor,
                                  ),
                                  Text(
                                    '(10)',
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
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ]
                                    .divide(SizedBox(width: 6.0))
                                    .addToStart(SizedBox(width: 10.0))
                                    .addToEnd(SizedBox(width: 15.0)),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: wrapWithModel(
                                      model: _model.cHRDProfilePostModel1,
                                      updateCallback: () => safeSetState(() {}),
                                      child: CHRDProfilePostWidget(
                                        heading: '132',
                                        subHeading: 'Gigs played ',
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: wrapWithModel(
                                      model: _model.cHRDProfilePostModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: CHRDProfilePostWidget(
                                        heading: '4',
                                        subHeading: 'At your venue',
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: wrapWithModel(
                                      model: _model.cHRDProfilePostModel3,
                                      updateCallback: () => safeSetState(() {}),
                                      child: CHRDProfilePostWidget(
                                        heading: '15',
                                        subHeading: 'Posts',
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 6.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: 'Favorite',
                                    options: FFButtonOptions(
                                      height: 44.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0x27FFFFFF),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(37.0),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: 'Share',
                                    options: FFButtonOptions(
                                      height: 44.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Color(0x60E8EBEE),
                                      ),
                                      borderRadius: BorderRadius.circular(37.0),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (getJsonField(
                                          musicianProfileVenueGetPerformerDetailsResponse
                                              .jsonBody,
                                          r'''$.highlights''',
                                        ) !=
                                        null)
                                      Builder(
                                        builder: (context) {
                                          final stories = getJsonField(
                                            musicianProfileVenueGetPerformerDetailsResponse
                                                .jsonBody,
                                            r'''$.highlights''',
                                          ).toList();

                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                stories.length, (storiesIndex) {
                                              final storiesItem =
                                                  stories[storiesIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    MusicianProfileHighlightsWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'id': serializeParam(
                                                        getJsonField(
                                                          storiesItem,
                                                          r'''$.id''',
                                                        ),
                                                        ParamType.int,
                                                      ),
                                                      'isVideo': serializeParam(
                                                        getJsonField(
                                                          storiesItem,
                                                          r'''$.is_video''',
                                                        ),
                                                        ParamType.bool,
                                                      ),
                                                      'imageVideo':
                                                          serializeParam(
                                                        'false' ==
                                                                getJsonField(
                                                                  storiesItem,
                                                                  r'''$.is_video''',
                                                                ).toString()
                                                            ? getJsonField(
                                                                storiesItem,
                                                                r'''$.highlight_image''',
                                                              ).toString()
                                                            : getJsonField(
                                                                storiesItem,
                                                                r'''$.highlight_video''',
                                                              ).toString(),
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 82.0,
                                                      height: 82.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                        ),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width: 72.0,
                                                        height: 72.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          getJsonField(
                                                            storiesItem,
                                                            r'''$.thumbnail_image''',
                                                          ).toString(),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      getJsonField(
                                                        storiesItem,
                                                        r'''$.highlight_name''',
                                                      ).toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .montserrat(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            fontSize: 12.0,
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
                                                  ].divide(
                                                      SizedBox(height: 9.0)),
                                                ),
                                              );
                                            }).divide(SizedBox(width: 20.0)),
                                          );
                                        },
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 20.0))
                              .addToStart(SizedBox(height: 23.5))
                              .addToEnd(SizedBox(height: 20.0)),
                        ),
                        Divider(
                          thickness: 1.0,
                          color: Color(0x33FFFFFF),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: Text(
                              'Musician Statement',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (_model.isTextExpanded) {
                                  _model.isTextExpanded = false;
                                  safeSetState(() {});
                                } else {
                                  _model.isTextExpanded = true;
                                  safeSetState(() {});
                                }
                              },
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: _model.isTextExpanded
                                          ? getJsonField(
                                              musicianProfileVenueGetPerformerDetailsResponse
                                                  .jsonBody,
                                              r'''$.user.musician_statement''',
                                            ).toString()
                                          : ((String text) {
                                              return text.length <= 50
                                                  ? text
                                                  : '${text.substring(0, 50)}...';
                                            }(getJsonField(
                                              musicianProfileVenueGetPerformerDetailsResponse
                                                  .jsonBody,
                                              r'''$.user.musician_statement''',
                                            ).toString())),
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
                                    TextSpan(
                                      text: _model.isTextExpanded
                                          ? ''
                                          : 'Read More',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryCyan,
                                      ),
                                    )
                                  ],
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
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 24.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (getJsonField(
                                    musicianProfileVenueGetPerformerDetailsResponse
                                        .jsonBody,
                                    r'''$.social_media.instagram''',
                                  ) !=
                                  null)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await launchURL(getJsonField(
                                      musicianProfileVenueGetPerformerDetailsResponse
                                          .jsonBody,
                                      r'''$.social_media.instagram''',
                                    ).toString());
                                  },
                                  child: Image.asset(
                                    'assets/images/instagram.png',
                                    width: 30.0,
                                    height: 30.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              if (getJsonField(
                                    musicianProfileVenueGetPerformerDetailsResponse
                                        .jsonBody,
                                    r'''$.social_media.facebook''',
                                  ) !=
                                  null)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await launchURL(getJsonField(
                                      musicianProfileVenueGetPerformerDetailsResponse
                                          .jsonBody,
                                      r'''$.social_media.facebook''',
                                    ).toString());
                                  },
                                  child: Image.asset(
                                    'assets/images/facebook.png',
                                    width: 30.0,
                                    height: 30.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              if (getJsonField(
                                    musicianProfileVenueGetPerformerDetailsResponse
                                        .jsonBody,
                                    r'''$.social_media.x''',
                                  ) !=
                                  null)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await launchURL(getJsonField(
                                      musicianProfileVenueGetPerformerDetailsResponse
                                          .jsonBody,
                                      r'''$.social_media.x''',
                                    ).toString());
                                  },
                                  child: Image.asset(
                                    'assets/images/twitter-x-icon-logo-116902890413xbfexhf8l.png',
                                    width: 30.0,
                                    height: 30.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              if (getJsonField(
                                    musicianProfileVenueGetPerformerDetailsResponse
                                        .jsonBody,
                                    r'''$.social_media.youtube''',
                                  ) !=
                                  null)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await launchURL(getJsonField(
                                      musicianProfileVenueGetPerformerDetailsResponse
                                          .jsonBody,
                                      r'''$.social_media.youtube''',
                                    ).toString());
                                  },
                                  child: Image.asset(
                                    'assets/images/youtube-logo-featured.png',
                                    width: 30.0,
                                    height: 30.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                            ].divide(SizedBox(width: 18.0)),
                          ),
                        ),
                        Divider(
                          thickness: 1.0,
                          color: Color(0x33FFFFFF),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 19.0, 0.0, 0.0),
                            child: Text(
                              'Posts(${valueOrDefault<String>(
                                getJsonField(
                                  musicianProfileVenueGetPerformerDetailsResponse
                                      .jsonBody,
                                  r'''$.musician_content_count''',
                                )?.toString(),
                                '0',
                              )})',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                        if (getJsonField(
                              musicianProfileVenueGetPerformerDetailsResponse
                                  .jsonBody,
                              r'''$.musician_content[0].content''',
                            ) !=
                            null)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final musicianContent = getJsonField(
                                      musicianProfileVenueGetPerformerDetailsResponse
                                          .jsonBody,
                                      r'''$.musician_content[0].content''',
                                    ).toList().take(9).toList();

                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 1.0,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: musicianContent.length,
                                      itemBuilder:
                                          (context, musicianContentIndex) {
                                        final musicianContentItem =
                                            musicianContent[
                                                musicianContentIndex];
                                        return Visibility(
                                          visible: musicianContentIndex > 0,
                                          child: Container(
                                            width: 110.0,
                                            height: 120.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  '${musicianContentItem.toString()}',
                                                ).image,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ]
                                .addToStart(SizedBox(height: 28.0))
                                .addToEnd(SizedBox(height: 12.0)),
                          ),
                        if (getJsonField(
                              musicianProfileVenueGetPerformerDetailsResponse
                                  .jsonBody,
                              r'''$.musician_content[0].content''',
                            ) !=
                            null)
                          FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                  VenueMusicianProfilePostsWidget.routeName);
                            },
                            text: 'View More',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 31.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0x1EFFFFFF),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                      ].addToEnd(SizedBox(height: 30.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: wrapWithModel(
                      model: _model.cHRDLabelBtnModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CHRDLabelBtnWidget(
                        heading: 'Send Offer',
                        txtColor: FlutterFlowTheme.of(context).primaryText,
                        btnColor: FlutterFlowTheme.of(context).primaryViolet,
                        borderColor: FlutterFlowTheme.of(context).primaryViolet,
                        hight: 45.0,
                        headingFontSize: 14,
                        isDisiable: false,
                        onTab: () async {},
                      ),
                    ),
                  ),
                ].addToEnd(SizedBox(height: 25.0)),
              ),
            ),
          ),
        );
      },
    );
  }
}
