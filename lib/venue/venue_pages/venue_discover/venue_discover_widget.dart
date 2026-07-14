import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_list_image_widget.dart';
import '/components/notification_icon_widget.dart';
import '/components/venue_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/venue/venue_pages/venue_components/c_h_r_d_pop_artists/c_h_r_d_pop_artists_widget.dart';
import '/venue/venue_pages/venue_components/c_h_r_d_trending/c_h_r_d_trending_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'venue_discover_model.dart';
export 'venue_discover_model.dart';

class VenueDiscoverWidget extends StatefulWidget {
  const VenueDiscoverWidget({super.key});

  static String routeName = 'venue_discover';
  static String routePath = '/venueDiscover';

  @override
  State<VenueDiscoverWidget> createState() => _VenueDiscoverWidgetState();
}

class _VenueDiscoverWidgetState extends State<VenueDiscoverWidget> {
  late VenueDiscoverModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VenueDiscoverModel());

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
      future: VenueGroup.getMusicianByCategoryCall.call(
        search: _model.textController.text,
        venueOwnerId: FFAppState().userId,
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
        final venueDiscoverGetMusicianByCategoryResponse = snapshot.data!;

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
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Talent',
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
                            List<NotificationRow> containerNotificationRowList =
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
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed(
                                            NotificationsWidget.routeName);
                                      },
                                    ),
                                    if (containerNotificationRowList.length !=
                                        0)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.5, -0.5),
                                        child: Icon(
                                          Icons.circle_sharp,
                                          color: FlutterFlowTheme.of(context)
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
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.pushNamed(EditAdminWidget.routeName);
                          },
                        ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                  ),
                  if (false)
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 4.0),
                        child: Text(
                          'Miami, Florida',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryCyan,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                      ),
                    ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if ((VenueGroup.getMusicianByCategoryCall.trending(
                                      venueDiscoverGetMusicianByCategoryResponse
                                          .jsonBody,
                                    ) !=
                                    null &&
                                (VenueGroup.getMusicianByCategoryCall.trending(
                                  venueDiscoverGetMusicianByCategoryResponse
                                      .jsonBody,
                                ))!
                                    .isNotEmpty) ||
                            (VenueGroup.getMusicianByCategoryCall.genre(
                                      venueDiscoverGetMusicianByCategoryResponse
                                          .jsonBody,
                                    ) !=
                                    null &&
                                (VenueGroup.getMusicianByCategoryCall.genre(
                                  venueDiscoverGetMusicianByCategoryResponse
                                      .jsonBody,
                                ))!
                                    .isNotEmpty)) {
                          return ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (VenueGroup.getMusicianByCategoryCall
                                          .trending(
                                            venueDiscoverGetMusicianByCategoryResponse
                                                .jsonBody,
                                          )
                                          ?.length !=
                                      0)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 26.0, 0.0, 0.0),
                                      child: Text(
                                        'Trending',
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
                                  if (VenueGroup.getMusicianByCategoryCall
                                          .trending(
                                            venueDiscoverGetMusicianByCategoryResponse
                                                .jsonBody,
                                          )
                                          ?.length !=
                                      0)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 300.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            final trendingList = VenueGroup
                                                    .getMusicianByCategoryCall
                                                    .trending(
                                                      venueDiscoverGetMusicianByCategoryResponse
                                                          .jsonBody,
                                                    )
                                                    ?.toList() ??
                                                [];
                                            if (trendingList.isEmpty) {
                                              return EmptyListImageWidget(
                                                msg: 'No result Found',
                                              );
                                            }

                                            return ListView.separated(
                                              padding: EdgeInsets.fromLTRB(
                                                21.0,
                                                0,
                                                21.0,
                                                0,
                                              ),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: trendingList.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(width: 16.0),
                                              itemBuilder:
                                                  (context, trendingListIndex) {
                                                final trendingListItem =
                                                    trendingList[
                                                        trendingListIndex];
                                                return Container(
                                                  width: 270.0,
                                                  height: 297.0,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.network(
                                                        '',
                                                      ).image,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                  ),
                                                  child: InkWell(
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
                                                        VenueMusicianProfile1Widget
                                                            .routeName,
                                                        queryParameters: {
                                                          'musicianId':
                                                              serializeParam(
                                                            getJsonField(
                                                              trendingListItem,
                                                              r'''$.musician_id''',
                                                            ),
                                                            ParamType.int,
                                                          ),
                                                          'isDiscoverFlow':
                                                              serializeParam(
                                                            true,
                                                            ParamType.bool,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: CHRDTrendingWidget(
                                                      key: Key(
                                                          'Keyfff_${trendingListIndex}_of_${trendingList.length}'),
                                                      musicianName:
                                                          getJsonField(
                                                        trendingListItem,
                                                        r'''$.musician_name''',
                                                      ).toString(),
                                                      gigsCount: getJsonField(
                                                        trendingListItem,
                                                        r'''$.gigs_count''',
                                                      ).toString(),
                                                      postsCount: getJsonField(
                                                        trendingListItem,
                                                        r'''$.posts_count''',
                                                      ),
                                                      musicianImage:
                                                          getJsonField(
                                                        trendingListItem,
                                                        r'''$.profile_photo''',
                                                      ).toString(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  Builder(
                                    builder: (context) {
                                      final musicianCategory =
                                          VenueGroup.getMusicianByCategoryCall
                                                  .genre(
                                                    venueDiscoverGetMusicianByCategoryResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toList() ??
                                              [];

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: musicianCategory.length,
                                        itemBuilder:
                                            (context, musicianCategoryIndex) {
                                          final musicianCategoryItem =
                                              musicianCategory[
                                                  musicianCategoryIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 26.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          25.0, 0.0, 0.0, 14.0),
                                                  child: Text(
                                                    getJsonField(
                                                      musicianCategoryItem,
                                                      r'''$.genre_type''',
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
                                                          fontSize: 18.0,
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 230.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final musiciansList =
                                                            getJsonField(
                                                          musicianCategoryItem,
                                                          r'''$.musicians''',
                                                        ).toList();

                                                        return ListView
                                                            .separated(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                            25.0,
                                                            0,
                                                            25.0,
                                                            0,
                                                          ),
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount:
                                                              musiciansList
                                                                  .length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              SizedBox(
                                                                  width: 16.0),
                                                          itemBuilder: (context,
                                                              musiciansListIndex) {
                                                            final musiciansListItem =
                                                                musiciansList[
                                                                    musiciansListIndex];
                                                            return Container(
                                                              width: 162.0,
                                                              height: 223.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            14.0),
                                                              ),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    VenueMusicianProfile1Widget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'musicianId':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          musiciansListItem,
                                                                          r'''$.musician_id''',
                                                                        ),
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                      'isDiscoverFlow':
                                                                          serializeParam(
                                                                        true,
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child:
                                                                    CHRDPopArtistsWidget(
                                                                  key: Key(
                                                                      'Key5he_${musiciansListIndex}_of_${musiciansList.length}'),
                                                                  image:
                                                                      getJsonField(
                                                                    musiciansListItem,
                                                                    r'''$.profile_photo''',
                                                                  ).toString(),
                                                                  events: '',
                                                                  eventName:
                                                                      getJsonField(
                                                                    musiciansListItem,
                                                                    r'''$.musician_name''',
                                                                  ).toString(),
                                                                  gigs:
                                                                      '${getJsonField(
                                                                    musiciansListItem,
                                                                    r'''$.gigs_count''',
                                                                  ).toString()} Gigs',
                                                                  posts:
                                                                      '${getJsonField(
                                                                    musiciansListItem,
                                                                    r'''$.posts_count''',
                                                                  ).toString()} Posts',
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(25.0, 20.0,
                                                          14.0, 20.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 1.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .neutralDark800,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          );
                        } else {
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: wrapWithModel(
                                  model: _model.emptyListImageModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: EmptyListImageWidget(
                                    msg: 'No Performer Found',
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(26.0, 8.0, 26.0, 20.0),
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          Duration(milliseconds: 0),
                          () => safeSetState(() {}),
                        ),
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).hintTxt,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                          hintText: 'Search by name',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).hintTxt,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).neutralDark900,
                          prefixIcon: Icon(
                            FFIcons.ksearch,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          suffixIcon: _model.textController!.text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.textController?.clear();
                                    safeSetState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.montserrat(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        enableInteractiveSelection: true,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                  if (false)
                    wrapWithModel(
                      model: _model.venueNavBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: VenueNavBarWidget(
                        whichScreenActive: WhichScreenMusicianNavBar.discover,
                      ),
                    ),
                ].addToStart(SizedBox(height: 16.0)),
              ),
            ),
          ),
        );
      },
    );
  }
}
