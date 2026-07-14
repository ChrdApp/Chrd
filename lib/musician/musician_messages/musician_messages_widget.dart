import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_list_image_widget.dart';
import '/components/notification_icon_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/musician_components/musician_nav_bar/musician_nav_bar_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'musician_messages_model.dart';
export 'musician_messages_model.dart';

class MusicianMessagesWidget extends StatefulWidget {
  const MusicianMessagesWidget({super.key});

  static String routeName = 'musician_messages';
  static String routePath = '/musicianMessages';

  @override
  State<MusicianMessagesWidget> createState() => _MusicianMessagesWidgetState();
}

class _MusicianMessagesWidgetState extends State<MusicianMessagesWidget> {
  late MusicianMessagesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MusicianMessagesModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Gig Threads',
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
                                                    FlutterFlowTheme.of(context)
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
                                                alignment: AlignmentDirectional(
                                                    0.5, -0.5),
                                                child: Icon(
                                                  Icons.circle_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                    if (FFAppState().userType ==
                                        Type.Musician) {
                                      context.pushNamed(
                                          EditMusicianProfileWidget.routeName);
                                    } else {
                                      context
                                          .pushNamed(EditAdminWidget.routeName);
                                    }
                                  },
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                            if (false)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Liv Nightclub',
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
                                                .primaryCyan,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Icon(
                                      FFIcons.krightArrow,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryCyan,
                                      size: 14.0,
                                    ),
                                  ].divide(SizedBox(width: 7.0)),
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (_model.textController.text != null &&
                          _model.textController.text != '')
                        Expanded(
                          child: FutureBuilder<ApiCallResponse>(
                            future: MusicianGroup.getGigMusicianCall.call(
                              pSearch: _model.textController.text,
                              pUserId: FFAppState().userId,
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
                              final listViewGetGigMusicianResponse =
                                  snapshot.data!;

                              return Builder(
                                builder: (context) {
                                  final allGigs = listViewGetGigMusicianResponse
                                      .jsonBody
                                      .toList();
                                  if (allGigs.isEmpty) {
                                    return EmptyListImageWidget(
                                      msg: 'No gig threads started yet',
                                    );
                                  }

                                  return ListView.separated(
                                    padding: EdgeInsets.fromLTRB(
                                      0,
                                      21.0,
                                      0,
                                      0,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: allGigs.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 40.0),
                                    itemBuilder: (context, allGigsIndex) {
                                      final allGigsItem = allGigs[allGigsIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          safeSetState(() {
                                            _model.textController?.clear();
                                          });

                                          context.pushNamed(
                                            VenueGigThreadOverlayWidget
                                                .routeName,
                                            queryParameters: {
                                              'gigID': serializeParam(
                                                getJsonField(
                                                  allGigsItem,
                                                  r'''$.gig_id''',
                                                ),
                                                ParamType.int,
                                              ),
                                              'gigName': serializeParam(
                                                getJsonField(
                                                  allGigsItem,
                                                  r'''$.venue_name''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'isVenue': serializeParam(
                                                false,
                                                ParamType.bool,
                                              ),
                                              'venueName': serializeParam(
                                                getJsonField(
                                                  allGigsItem,
                                                  r'''$.venue_name''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'image': serializeParam(
                                                getJsonField(
                                                  allGigsItem,
                                                  r'''$.venue_photo''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
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
                                                  end: AlignmentDirectional(
                                                      1.0, 0),
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
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
                                                      imageUrl: getJsonField(
                                                        allGigsItem,
                                                        r'''$.venue_photo''',
                                                      ).toString(),
                                                      width: 43.0,
                                                      height: 43.0,
                                                      fit: BoxFit.cover,
                                                      errorWidget: (context,
                                                              error,
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    getJsonField(
                                                      allGigsItem,
                                                      r'''$.venue_name''',
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
                                                              allGigsItem,
                                                              r'''$.last_message_content''',
                                                            ) !=
                                                            null
                                                        ? getJsonField(
                                                            allGigsItem,
                                                            r'''$.last_message_content''',
                                                          ).toString()
                                                        : 'Say Hi!',
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
                                                ].divide(SizedBox(height: 6.0)),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  functions.formatMessageTime(
                                                      functions
                                                          .parseDateTimeSafe(
                                                              getJsonField(
                                                    allGigsItem,
                                                    r'''$.updated_at''',
                                                  ).toString())!),
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryCyan,
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
                                                if (('true' ==
                                                            getJsonField(
                                                              allGigsItem,
                                                              r'''$.has_any_thread_message_unread_musician''',
                                                            ).toString()) &&
                                                        (getJsonField(
                                                              allGigsItem,
                                                              r'''$.has_any_thread_message_unread_musician''',
                                                            ) !=
                                                            null)
                                                    ? true
                                                    : false)
                                                  Container(
                                                    width: 12.0,
                                                    height: 12.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryCyan,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                  ),
                                              ].divide(SizedBox(height: 6.0)),
                                            ),
                                          ].divide(SizedBox(width: 13.0)),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      if (_model.textController.text == null ||
                          _model.textController.text == '')
                        Expanded(
                          child: StreamBuilder<List<GigsRow>>(
                            stream: _model.realtimeListViewSupabaseStream ??=
                                SupaFlow.client
                                    .from("gigs")
                                    .stream(primaryKey: ['id'])
                                    .eqOrNull(
                                      'musician_id',
                                      FFAppState().userId,
                                    )
                                    .order('updated_at')
                                    .map((list) => list
                                        .map((item) => GigsRow(item))
                                        .toList()),
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
                              List<GigsRow> realtimeListViewGigsRowList =
                                  snapshot.data!;

                              if (realtimeListViewGigsRowList.isEmpty) {
                                return EmptyListImageWidget(
                                  msg: 'No gig threads started yet',
                                );
                              }

                              return ListView.separated(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  21.0,
                                  0,
                                  0,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: realtimeListViewGigsRowList.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 40.0),
                                itemBuilder: (context, realtimeListViewIndex) {
                                  final realtimeListViewGigsRow =
                                      realtimeListViewGigsRowList[
                                          realtimeListViewIndex];
                                  return FutureBuilder<List<VenuesRow>>(
                                    future: VenuesTable().querySingleRow(
                                      queryFn: (q) => q.eqOrNull(
                                        'id',
                                        realtimeListViewGigsRow.venueId,
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
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<VenuesRow> containerVenuesRowList =
                                          snapshot.data!;

                                      final containerVenuesRow =
                                          containerVenuesRowList.isNotEmpty
                                              ? containerVenuesRowList.first
                                              : null;

                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          safeSetState(() {
                                            _model.textController?.clear();
                                          });

                                          context.pushNamed(
                                            VenueGigThreadOverlayWidget
                                                .routeName,
                                            queryParameters: {
                                              'gigID': serializeParam(
                                                realtimeListViewGigsRow.id,
                                                ParamType.int,
                                              ),
                                              'gigName': serializeParam(
                                                containerVenuesRow?.name,
                                                ParamType.String,
                                              ),
                                              'isVenue': serializeParam(
                                                false,
                                                ParamType.bool,
                                              ),
                                              'venueName': serializeParam(
                                                containerVenuesRow?.name,
                                                ParamType.String,
                                              ),
                                              'image': serializeParam(
                                                containerVenuesRow?.venuePhoto,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(),
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
                                                    end: AlignmentDirectional(
                                                        1.0, 0),
                                                  ),
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              500.0),
                                                      child: CachedNetworkImage(
                                                        fadeInDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        fadeOutDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        imageUrl:
                                                            containerVenuesRow!
                                                                .venuePhoto!,
                                                        width: 43.0,
                                                        height: 43.0,
                                                        fit: BoxFit.cover,
                                                        errorWidget: (context,
                                                                error,
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        containerVenuesRow
                                                            ?.name,
                                                        'Name',
                                                      ),
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
                                                      valueOrDefault<String>(
                                                        realtimeListViewGigsRow
                                                            .lastMessageContent,
                                                        'HI',
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
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 6.0)),
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    functions.formatMessageTime(
                                                        realtimeListViewGigsRow
                                                            .updatedAt!),
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
                                                              .primaryCyan,
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
                                                  if (realtimeListViewGigsRow
                                                          .hasAnyThreadMessageUnreadMusician ??
                                                      true)
                                                    Container(
                                                      width: 12.0,
                                                      height: 12.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryCyan,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                    ),
                                                ].divide(SizedBox(height: 6.0)),
                                              ),
                                            ].divide(SizedBox(width: 13.0)),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController',
                            Duration(milliseconds: 0),
                            () async {
                              safeSetState(() {});
                            },
                          ),
                          autofocus: false,
                          enabled: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                            hintText: 'Search by name',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
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
                                color:
                                    FlutterFlowTheme.of(context).neutralDark900,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).neutralDark900,
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
                              size: 22.0,
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ]
                        .addToStart(SizedBox(height: 12.0))
                        .addToEnd(SizedBox(height: 20.0)),
                  ),
                ),
              ),
              if (false)
                wrapWithModel(
                  model: _model.musicianNavBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: MusicianNavBarWidget(
                    whichScreenActive: WhichScreenMusicianNavBar.gigThreads,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
