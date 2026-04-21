import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/custobar_widget.dart';
import '/components/notification_icon_widget.dart';
import '/fan/fan_gigs/fan_gigs_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
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
                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                .isNotEmpty)
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed(
                                        EditMusicianProfileWidget.routeName);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ].addToStart(SizedBox(height: 20.0)),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: ListView(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          32.0,
                          0,
                          47.5,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          wrapWithModel(
                            model: _model.fanGigsModel,
                            updateCallback: () => safeSetState(() {}),
                            child: FanGigsWidget(
                              gigImage:
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/liodyj2s4rx9/image_(8).png',
                              gifVenue: 'Diaries',
                              gigDate: '15 march 2025',
                              gigTime: '9 PM',
                              gigPerformer: 'Taiwan',
                              gigType: 'Live music',
                              isBookmarked: true,
                              lastseen: '2 min',
                              bookmarkedAction: () async {},
                              infoAction: () async {},
                            ),
                          ),
                        ].divide(SizedBox(height: 20.0)),
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.custobarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: CustobarWidget(),
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
