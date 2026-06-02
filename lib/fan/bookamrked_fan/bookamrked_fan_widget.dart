import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_list_image_widget.dart';
import '/components/notification_icon_widget.dart';
import '/fan/fan_gigs/fan_gigs_widget.dart';
import '/fan/gig_detail_fan/gig_detail_fan_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bookamrked_fan_model.dart';
export 'bookamrked_fan_model.dart';

class BookamrkedFanWidget extends StatefulWidget {
  const BookamrkedFanWidget({super.key});

  static String routeName = 'BookamrkedFan';
  static String routePath = '/bookamrkedFan';

  @override
  State<BookamrkedFanWidget> createState() => _BookamrkedFanWidgetState();
}

class _BookamrkedFanWidgetState extends State<BookamrkedFanWidget> {
  late BookamrkedFanModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookamrkedFanModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});

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
      future: ShowPlannerCall.call(
        pDate: '2025-12-16',
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
        final bookamrkedFanShowPlannerResponse = snapshot.data!;

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 91.0, 0.0),
                                  child: Text(
                                    'Your Saved Shows',
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
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
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
                                                  color: FlutterFlowTheme.of(
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
                                                  .isNotEmpty)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
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
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: (_model.apiRequestCompleter ??=
                                        Completer<ApiCallResponse>()
                                          ..complete(
                                              FanGroup.getGigsForFanCall.call(
                                            pCurrentTime: functions
                                                .toUtcTimestamp(
                                                    getCurrentTimestamp)
                                                ?.toString(),
                                            pSearch: '',
                                            pSelectDate: '',
                                            pEntertainmentType: '',
                                            currentUserId: FFAppState().userId,
                                            pShowBookmarked: true,
                                          )))
                                    .future,
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
                                  final listViewGetGigsForFanResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final gigsList =
                                          listViewGetGigsForFanResponse.jsonBody
                                              .toList();
                                      if (gigsList.isEmpty) {
                                        return EmptyListImageWidget(
                                          msg:
                                              'You haven’t bookmarked any gigs yet.',
                                        );
                                      }

                                      return ListView.separated(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          34.0,
                                          0,
                                          47.5,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: gigsList.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 20.0),
                                        itemBuilder: (context, gigsListIndex) {
                                          final gigsListItem =
                                              gigsList[gigsListIndex];
                                          return Builder(
                                            builder: (context) => FanGigsWidget(
                                              key: Key(
                                                  'Key0o4_${gigsListIndex}_of_${gigsList.length}'),
                                              gigImage: getJsonField(
                                                gigsListItem,
                                                r'''$.venue_photo''',
                                              ).toString(),
                                              gifVenue: getJsonField(
                                                gigsListItem,
                                                r'''$.venue_name''',
                                              ).toString(),
                                              gigDate: getJsonField(
                                                gigsListItem,
                                                r'''$.start_date''',
                                              ).toString(),
                                              gigTime: getJsonField(
                                                gigsListItem,
                                                r'''$.start_time''',
                                              ).toString(),
                                              gigPerformer: getJsonField(
                                                gigsListItem,
                                                r'''$.musician_name''',
                                              ).toString(),
                                              gigType: getJsonField(
                                                gigsListItem,
                                                r'''$.entertainment_display''',
                                              ).toString(),
                                              isBookmarked: 'true' ==
                                                      getJsonField(
                                                        gigsListItem,
                                                        r'''$.is_bookmarked''',
                                                      ).toString()
                                                  ? true
                                                  : false,
                                              lastseen: '2 min',
                                              bookmarkedAction: () async {
                                                if ('true' ==
                                                    getJsonField(
                                                      gigsListItem,
                                                      r'''$.is_bookmarked''',
                                                    ).toString()) {
                                                  await FanBookmarksTable()
                                                      .delete(
                                                    matchingRows: (rows) =>
                                                        rows.eqOrNull(
                                                      'group_uuid',
                                                      getJsonField(
                                                        gigsListItem,
                                                        r'''$.group_uuid''',
                                                      ).toString(),
                                                    ),
                                                  );
                                                }
                                                safeSetState(() =>
                                                    _model.apiRequestCompleter =
                                                        null);
                                                await _model
                                                    .waitForApiRequestCompleted();
                                              },
                                              infoAction: () async {
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
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.8,
                                                          child:
                                                              GigDetailFanWidget(
                                                            groupId:
                                                                getJsonField(
                                                              gigsListItem,
                                                              r'''$.group_uuid''',
                                                            ).toString(),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ].addToStart(SizedBox(height: 20.0)),
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
