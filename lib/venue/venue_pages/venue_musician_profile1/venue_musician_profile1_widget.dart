import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/venue/venue_pages/venue_components/c_h_r_d_profile_post/c_h_r_d_profile_post_widget.dart';
import '/venue/venue_pages/venue_components/c_h_r_d_send_offer_pop_up/c_h_r_d_send_offer_pop_up_widget.dart';
import '/venue/venue_pages/venue_onbording/c_h_r_d_image_component/c_h_r_d_image_component_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_video_player_component/c_h_r_d_video_player_component_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'venue_musician_profile1_model.dart';
export 'venue_musician_profile1_model.dart';

class VenueMusicianProfile1Widget extends StatefulWidget {
  const VenueMusicianProfile1Widget({
    super.key,
    required this.musicianId,
    this.venueId,
    this.slotId,
    bool? isBooked,
    this.venueName,
    bool? isDiscoverFlow,
    this.venueImage,
  })  : this.isBooked = isBooked ?? false,
        this.isDiscoverFlow = isDiscoverFlow ?? false;

  final int? musicianId;
  final int? venueId;
  final int? slotId;
  final bool isBooked;
  final String? venueName;
  final bool isDiscoverFlow;
  final String? venueImage;

  static String routeName = 'venue_musician_profile1';
  static String routePath = '/venue_musician_profile1';

  @override
  State<VenueMusicianProfile1Widget> createState() =>
      _VenueMusicianProfile1WidgetState();
}

class _VenueMusicianProfile1WidgetState
    extends State<VenueMusicianProfile1Widget> {
  late VenueMusicianProfile1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VenueMusicianProfile1Model());

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
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(MusicianGroup.getPerformerDetailsCall.call(
              performerId: widget!.musicianId,
              venueOwnerId: FFAppState().userId,
            )))
          .future,
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
        final venueMusicianProfile1GetPerformerDetailsResponse = snapshot.data!;

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
                Expanded(
                  child: SingleChildScrollView(
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
                                      'assets/images/Musician_Profile_Wallpaper_Background.png',
                                    ).image,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              context.safePop();
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
                                  width: 106.0,
                                  height: 106.0,
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
                                        0.15,
                                        0.3,
                                        0.45,
                                        0.6,
                                        0.75,
                                        1.0
                                      ],
                                      begin: AlignmentDirectional(0.0, -1.0),
                                      end: AlignmentDirectional(0, 1.0),
                                    ),
                                    shape: BoxShape.circle,
                                    border: Border.all(
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
                                          venueMusicianProfile1GetPerformerDetailsResponse
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
                              if (false)
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
                                        stops: [
                                          0.0,
                                          0.3,
                                          0.4,
                                          0.5,
                                          0.6,
                                          0.7,
                                          1.0
                                        ],
                                        begin: AlignmentDirectional(0.0, -1.0),
                                        end: AlignmentDirectional(0, 1.0),
                                      ),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryCyan,
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  getJsonField(
                                    venueMusicianProfile1GetPerformerDetailsResponse
                                        .jsonBody,
                                    r'''$.user.name''',
                                  ).toString(),
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
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              if (false)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 2.0, 0.0, 0.0),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
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
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
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
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        )
                                      ],
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
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      ContractBoardVenueViewWidget.routeName,
                                      queryParameters: {
                                        'musicianId': serializeParam(
                                          widget!.musicianId,
                                          ParamType.int,
                                        ),
                                        'musicianName': serializeParam(
                                          getJsonField(
                                            venueMusicianProfile1GetPerformerDetailsResponse
                                                .jsonBody,
                                            r'''$.user.name''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                        'venueId': serializeParam(
                                          widget!.venueId,
                                          ParamType.int,
                                        ),
                                        'slotId': serializeParam(
                                          widget!.slotId,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: 62.0,
                                    height: 62.0,
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
                                          0.15,
                                          0.3,
                                          0.45,
                                          0.6,
                                          0.75,
                                          1.0
                                        ],
                                        begin: AlignmentDirectional(0.0, -1.0),
                                        end: AlignmentDirectional(0, 1.0),
                                      ),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xFF8D28E3),
                                        width: 1.0,
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      FFIcons.kcalendarMonth,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 32.0,
                                    ),
                                  ),
                                ),
                              ),
                              if (false)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.5, 0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .neutralDark900,
                                      borderRadius: BorderRadius.circular(22.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          RatingBar.builder(
                                            onRatingUpdate: (newValue) =>
                                                safeSetState(() => _model
                                                    .ratingBarValue = newValue),
                                            itemBuilder: (context, index) =>
                                                Icon(
                                              Icons.star_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .openColor,
                                            ),
                                            direction: Axis.horizontal,
                                            initialRating:
                                                _model.ratingBarValue ??= 3.0,
                                            unratedColor: Color(0x29FFB140),
                                            itemCount: 5,
                                            itemSize: 17.0,
                                            glowColor:
                                                FlutterFlowTheme.of(context)
                                                    .openColor,
                                          ),
                                          Text(
                                            '(10)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: wrapWithModel(
                                            model: _model.cHRDProfilePostModel1,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: CHRDProfilePostWidget(
                                              heading: '0',
                                              subHeading: 'Gigs played',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: wrapWithModel(
                                            model: _model.cHRDProfilePostModel2,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: CHRDProfilePostWidget(
                                              heading: valueOrDefault<String>(
                                                getJsonField(
                                                  venueMusicianProfile1GetPerformerDetailsResponse
                                                      .jsonBody,
                                                  r'''$.at_your_venue_count''',
                                                )?.toString(),
                                                '0',
                                              ),
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
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: CHRDProfilePostWidget(
                                              heading: valueOrDefault<String>(
                                                getJsonField(
                                                  venueMusicianProfile1GetPerformerDetailsResponse
                                                      .jsonBody,
                                                  r'''$.musician_content_count''',
                                                )?.toString(),
                                                '0',
                                              ),
                                              subHeading: 'Posts',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 16.0)),
                                  ),
                                  if (FFAppState().userType != Type.Fan)
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if ('true' ==
                                                  valueOrDefault<String>(
                                                    getJsonField(
                                                      venueMusicianProfile1GetPerformerDetailsResponse
                                                          .jsonBody,
                                                      r'''$.is_favorite''',
                                                    )?.toString(),
                                                    '0',
                                                  )) {
                                                await VenueFavoritesTable()
                                                    .delete(
                                                  matchingRows: (rows) => rows
                                                      .eqOrNull(
                                                        'created_by',
                                                        FFAppState().userId,
                                                      )
                                                      .eqOrNull(
                                                        'musician_id',
                                                        widget!.musicianId,
                                                      ),
                                                );
                                              } else {
                                                await VenueFavoritesTable()
                                                    .insert({
                                                  'created_at':
                                                      supaSerialize<DateTime>(
                                                          getCurrentTimestamp),
                                                  'created_by':
                                                      FFAppState().userId,
                                                  'musician_id':
                                                      widget!.musicianId,
                                                });
                                              }

                                              safeSetState(() => _model
                                                  .apiRequestCompleter = null);
                                              await _model
                                                  .waitForApiRequestCompleted();
                                            },
                                            text: 'true' ==
                                                    valueOrDefault<String>(
                                                      getJsonField(
                                                        venueMusicianProfile1GetPerformerDetailsResponse
                                                            .jsonBody,
                                                        r'''$.is_favorite''',
                                                      )?.toString(),
                                                      '0',
                                                    )
                                                ? 'Remove from Favorite'
                                                : 'Add to Favorite',
                                            options: FFButtonOptions(
                                              height: 44.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: 'true' ==
                                                      valueOrDefault<String>(
                                                        getJsonField(
                                                          venueMusicianProfile1GetPerformerDetailsResponse
                                                              .jsonBody,
                                                          r'''$.is_favorite''',
                                                        )?.toString(),
                                                        '0',
                                                      )
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryViolet
                                                  : Color(0x27FFFFFF),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font:
                                                        GoogleFonts.interTight(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(37.0),
                                            ),
                                          ),
                                        ),
                                        if (false)
                                          Expanded(
                                            child: FFButtonWidget(
                                              onPressed: () {
                                                print('Button pressed ...');
                                              },
                                              text: 'Share',
                                              options: FFButtonOptions(
                                                height: 44.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .interTight(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                elevation: 0.0,
                                                borderSide: BorderSide(
                                                  color: Color(0x60E8EBEE),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(37.0),
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
                                                venueMusicianProfile1GetPerformerDetailsResponse
                                                    .jsonBody,
                                                r'''$.highlights''',
                                              ) !=
                                              null)
                                            Builder(
                                              builder: (context) {
                                                final stories = getJsonField(
                                                  venueMusicianProfile1GetPerformerDetailsResponse
                                                      .jsonBody,
                                                  r'''$.highlights''',
                                                ).toList();

                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      stories.length,
                                                      (storiesIndex) {
                                                    final storiesItem =
                                                        stories[storiesIndex];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          MusicianProfileHighlightsWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'id':
                                                                serializeParam(
                                                              getJsonField(
                                                                storiesItem,
                                                                r'''$.id''',
                                                              ),
                                                              ParamType.int,
                                                            ),
                                                            'isVideo':
                                                                serializeParam(
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
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: 82.0,
                                                            height: 82.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                              ),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 72.0,
                                                              height: 72.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                getJsonField(
                                                                  storiesItem,
                                                                  r'''$.highlight_image''',
                                                                ).toString(),
                                                                fit: BoxFit
                                                                    .cover,
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
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 9.0)),
                                                      ),
                                                    );
                                                  }).divide(
                                                      SizedBox(width: 20.0)),
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
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Wrap(
                                    spacing: 0.0,
                                    runSpacing: 0.0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Text(
                                        _model.isTextExpanded
                                            ? getJsonField(
                                                venueMusicianProfile1GetPerformerDetailsResponse
                                                    .jsonBody,
                                                r'''$.user.musician_statement''',
                                              ).toString()
                                            : ((String text) {
                                                return text.length <= 200
                                                    ? text
                                                    : '${text.substring(0, 200)}...';
                                              }(getJsonField(
                                                venueMusicianProfile1GetPerformerDetailsResponse
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
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      if ((getJsonField(
                                                venueMusicianProfile1GetPerformerDetailsResponse
                                                    .jsonBody,
                                                r'''$.user.musician_statement''',
                                              ).toString().length >
                                              200) &&
                                          !_model.isTextExpanded)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
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
                                            child: Text(
                                              ' Read More',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryCyan,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 24.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            if ('' !=
                                                getJsonField(
                                                  venueMusicianProfile1GetPerformerDetailsResponse
                                                      .jsonBody,
                                                  r'''$.social_media.instagram''',
                                                ).toString())
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await launchURL(getJsonField(
                                                    venueMusicianProfile1GetPerformerDetailsResponse
                                                        .jsonBody,
                                                    r'''$.social_media.instagram''',
                                                  ).toString());
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/instagram.png',
                                                      width: 14.0,
                                                      height: 14.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    Text(
                                                      'Instagram',
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
                                                      SizedBox(width: 4.0)),
                                                ),
                                              ),
                                            if ('' !=
                                                getJsonField(
                                                  venueMusicianProfile1GetPerformerDetailsResponse
                                                      .jsonBody,
                                                  r'''$.social_media.x''',
                                                ).toString())
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await launchURL(getJsonField(
                                                    venueMusicianProfile1GetPerformerDetailsResponse
                                                        .jsonBody,
                                                    r'''$.social_media.x''',
                                                  ).toString());
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/twitter-x-icon-logo-116902890413xbfexhf8l.png',
                                                      width: 14.0,
                                                      height: 14.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    Text(
                                                      'X',
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
                                                      SizedBox(width: 4.0)),
                                                ),
                                              ),
                                            if ('' !=
                                                getJsonField(
                                                  venueMusicianProfile1GetPerformerDetailsResponse
                                                      .jsonBody,
                                                  r'''$.social_media.facebook''',
                                                ).toString())
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await launchURL(getJsonField(
                                                    venueMusicianProfile1GetPerformerDetailsResponse
                                                        .jsonBody,
                                                    r'''$.social_media.facebook''',
                                                  ).toString());
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/facebook.png',
                                                      width: 14.0,
                                                      height: 14.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    Text(
                                                      'fb',
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
                                                      SizedBox(width: 4.0)),
                                                ),
                                              ),
                                            if ('' !=
                                                getJsonField(
                                                  venueMusicianProfile1GetPerformerDetailsResponse
                                                      .jsonBody,
                                                  r'''$.social_media.youtube''',
                                                ).toString())
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await launchURL(getJsonField(
                                                    venueMusicianProfile1GetPerformerDetailsResponse
                                                        .jsonBody,
                                                    r'''$.social_media.youtube''',
                                                  ).toString());
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/youtube-logo-featured.png',
                                                      height: 14.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    Text(
                                                      'youtube',
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
                                                      SizedBox(width: 4.0)),
                                                ),
                                              ),
                                          ].divide(SizedBox(width: 18.0)),
                                        ),
                                      ),
                                    ),
                                  ],
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
                                        venueMusicianProfile1GetPerformerDetailsResponse
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
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final musicianPost = functions
                                                .removeFirstIndexJson(
                                                    getJsonField(
                                                  venueMusicianProfile1GetPerformerDetailsResponse
                                                      .jsonBody,
                                                  r'''$.musician_content''',
                                                ))
                                                ?.toList() ??
                                            [];

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
                                          itemCount: musicianPost.length,
                                          itemBuilder:
                                              (context, musicianPostIndex) {
                                            final musicianPostItem =
                                                musicianPost[musicianPostIndex];
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if ('true' ==
                                                    getJsonField(
                                                      musicianPostItem,
                                                      r'''$.is_video''',
                                                    ).toString())
                                                  Expanded(
                                                    child: Builder(
                                                      builder: (context) =>
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
                                                          await showDialog(
                                                            barrierColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
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
                                                                      CHRDVideoPlayerComponentWidget(
                                                                    videoUrl:
                                                                        '${getJsonField(
                                                                      musicianPostItem,
                                                                      r'''$.content''',
                                                                    ).toString()}',
                                                                    videoThumbnail:
                                                                        '${getJsonField(
                                                                      musicianPostItem,
                                                                      r'''$.video_thumbnail''',
                                                                    ).toString()}',
                                                                    contentId:
                                                                        getJsonField(
                                                                      musicianPostItem,
                                                                      r'''$.id''',
                                                                    ),
                                                                    isHighlight:
                                                                        false,
                                                                    isViewOnly:
                                                                        true,
                                                                    callBackAction:
                                                                        () async {},
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Container(
                                                          width: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x693B006D),
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  Image.network(
                                                                getJsonField(
                                                                  musicianPostItem,
                                                                  r'''$.video_thumbnail''',
                                                                ).toString(),
                                                              ).image,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .play_arrow,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if ('false' ==
                                                    getJsonField(
                                                      musicianPostItem,
                                                      r'''$.is_video''',
                                                    ).toString())
                                                  Expanded(
                                                    child: Builder(
                                                      builder: (context) =>
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
                                                          await showDialog(
                                                            barrierColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
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
                                                                      CHRDImageComponentWidget(
                                                                    imageUrl:
                                                                        getJsonField(
                                                                      musicianPostItem,
                                                                      r'''$.video_thumbnail''',
                                                                    ).toString(),
                                                                    contentID:
                                                                        getJsonField(
                                                                      musicianPostItem,
                                                                      r'''$.id''',
                                                                    ),
                                                                    isViewOnly:
                                                                        true,
                                                                    callbackAction:
                                                                        () async {},
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          child: Image.network(
                                                            '${getJsonField(
                                                              musicianPostItem,
                                                              r'''$.video_thumbnail''',
                                                            ).toString()}',
                                                            width: 100.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  if ((getJsonField(
                                            venueMusicianProfile1GetPerformerDetailsResponse
                                                .jsonBody,
                                            r'''$.musician_content''',
                                          ) !=
                                          null) &&
                                      functions.isJsonLengthGreaterThan8(
                                          getJsonField(
                                        venueMusicianProfile1GetPerformerDetailsResponse
                                            .jsonBody,
                                        r'''$.musician_content_count''',
                                      )))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                              VenueMusicianProfilePostsWidget
                                                  .routeName);
                                        },
                                        text: 'View More',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 31.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0x1EFFFFFF),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                fontSize: 12.0,
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
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                ]
                                    .addToStart(SizedBox(height: 28.0))
                                    .addToEnd(SizedBox(height: 12.0)),
                              ),
                            ].addToEnd(SizedBox(height: 30.0)),
                          ),
                        ),
                      ].addToEnd(SizedBox(height: 25.0)),
                    ),
                  ),
                ),
                if (FFAppState().userType != Type.Fan)
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (((widget!.venueId != null) &&
                              (widget!.slotId != null)) ||
                          widget!.isDiscoverFlow)
                        Builder(
                          builder: (context) => Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: wrapWithModel(
                              model: _model.cHRDLabelBtnModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: CHRDLabelBtnWidget(
                                heading:
                                    widget!.isBooked ? 'Close' : 'Send Offer',
                                txtColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                btnColor:
                                    FlutterFlowTheme.of(context).primaryViolet,
                                borderColor:
                                    FlutterFlowTheme.of(context).primaryViolet,
                                hight: 45.0,
                                headingFontSize: 14,
                                isDisiable: false,
                                onTab: () async {
                                  var _shouldSetState = false;
                                  if (widget!.isDiscoverFlow) {
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
                                            child: CHRDSendOfferPopUpWidget(
                                              image: valueOrDefault<String>(
                                                getJsonField(
                                                  venueMusicianProfile1GetPerformerDetailsResponse
                                                      .jsonBody,
                                                  r'''$.user.profile_photo''',
                                                )?.toString(),
                                                'https://kasnaqcqfuqnfydsjvpy.supabase.co/storage/v1/object/public/venueC/error.png',
                                              ),
                                              musicianName: getJsonField(
                                                venueMusicianProfile1GetPerformerDetailsResponse
                                                    .jsonBody,
                                                r'''$.user.name''',
                                              ).toString(),
                                              offerBtnAction: () async {
                                                Navigator.pop(context);

                                                context.pushNamed(
                                                  GigOfferChooseVenueWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'musicianImage':
                                                        serializeParam(
                                                      valueOrDefault<String>(
                                                        getJsonField(
                                                          venueMusicianProfile1GetPerformerDetailsResponse
                                                              .jsonBody,
                                                          r'''$.user.profile_photo''',
                                                        )?.toString(),
                                                        'https://kasnaqcqfuqnfydsjvpy.supabase.co/storage/v1/object/public/venueC/error.png',
                                                      ),
                                                      ParamType.String,
                                                    ),
                                                    'musicianName':
                                                        serializeParam(
                                                      getJsonField(
                                                        venueMusicianProfile1GetPerformerDetailsResponse
                                                            .jsonBody,
                                                        r'''$.user.name''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'musicianId':
                                                        serializeParam(
                                                      widget!.musicianId,
                                                      ParamType.int,
                                                    ),
                                                    'venueName': serializeParam(
                                                      widget!.venueName,
                                                      ParamType.String,
                                                    ),
                                                    'venueImage':
                                                        serializeParam(
                                                      widget!.venueImage,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    );

                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else {
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
                                            child: CHRDSendOfferPopUpWidget(
                                              image: valueOrDefault<String>(
                                                getJsonField(
                                                  venueMusicianProfile1GetPerformerDetailsResponse
                                                      .jsonBody,
                                                  r'''$.user.profile_photo''',
                                                )?.toString(),
                                                'https://kasnaqcqfuqnfydsjvpy.supabase.co/storage/v1/object/public/venueC/error.png',
                                              ),
                                              musicianName: getJsonField(
                                                venueMusicianProfile1GetPerformerDetailsResponse
                                                    .jsonBody,
                                                r'''$.user.name''',
                                              ).toString(),
                                              offerBtnAction: () async {
                                                var _shouldSetState = false;
                                                if (widget!.isBooked) {
                                                  context.safePop();
                                                  return;
                                                } else {
                                                  _model.upsertOutput =
                                                      await VenueGroup
                                                          .upsertGigsCall
                                                          .call(
                                                    venueId: widget!.venueId,
                                                    musicianId:
                                                        widget!.musicianId,
                                                    slotid: widget!.slotId,
                                                    venueOwnerId:
                                                        FFAppState().userId,
                                                  );

                                                  _shouldSetState = true;
                                                  if ((_model.upsertOutput
                                                          ?.succeeded ??
                                                      true)) {
                                                    if ('true' ==
                                                        getJsonField(
                                                          (_model.upsertOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$..slot_thread_is_created_now''',
                                                        ).toString()) {
                                                      _model.notificationoutput =
                                                          await NotificationGroup
                                                              .sendNotificationCall
                                                              .call(
                                                        title:
                                                            '${widget!.venueName} invited you',
                                                        description:
                                                            '${widget!.venueName} invited you to perform. Check details.',
                                                        sendToList: (int var1) {
                                                          return List<
                                                              String>.from([
                                                            var1.toString()
                                                          ]);
                                                        }(widget!.musicianId!),
                                                        type:
                                                            'PerformerInvited',
                                                        usertype: FFAppState()
                                                            .userType
                                                            ?.name,
                                                        dataJson: <String,
                                                            dynamic>{
                                                          'musician_id': widget!
                                                              .musicianId,
                                                          'thread_id':
                                                              getJsonField(
                                                            (_model.upsertOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$..slot_thread_id''',
                                                          ),
                                                          'is_venue': 'false',
                                                          'image': widget!
                                                              .venueImage,
                                                        },
                                                      );

                                                      _shouldSetState = true;
                                                      await NotificationTable()
                                                          .insert({
                                                        'user_id':
                                                            widget!.musicianId,
                                                        'title':
                                                            '${widget!.venueName} invited you',
                                                        'description':
                                                            '${widget!.venueName} invited you to perform. Check details.',
                                                        'type':
                                                            'PerformerInvited',
                                                        'data':
                                                            <String, dynamic>{
                                                          'musician_id': widget!
                                                              .musicianId,
                                                          'thread_id':
                                                              getJsonField(
                                                            (_model.upsertOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$..slot_thread_id''',
                                                          ),
                                                          'is_venue': 'false',
                                                          'image': widget!
                                                              .venueImage,
                                                        },
                                                        'usertype': FFAppState()
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
                                                    }
                                                    Navigator.pop(context);

                                                    context.pushNamed(
                                                      CustomChatVenueWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'threadId':
                                                            serializeParam(
                                                          getJsonField(
                                                            (_model.upsertOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$..slot_thread_id''',
                                                          ),
                                                          ParamType.int,
                                                        ),
                                                        'isVenue':
                                                            serializeParam(
                                                          true,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                    );

                                                    return;
                                                  } else {
                                                    return;
                                                  }
                                                }
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    );

                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) safeSetState(() {});
                                },
                              ),
                            ),
                          ),
                        ),
                      if ((widget!.venueId != null) && (widget!.slotId != null))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 16.0, 20.0, 0.0),
                          child: wrapWithModel(
                            model: _model.cHRDLabelBtnModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: CHRDLabelBtnWidget(
                              heading: 'Message',
                              txtColor:
                                  FlutterFlowTheme.of(context).primaryText,
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
                                          (_model.upsertOutputGenral
                                                  ?.jsonBody ??
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
              ].addToEnd(SizedBox(height: 24.0)),
            ),
          ),
        );
      },
    );
  }
}
