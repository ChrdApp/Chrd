import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/custobar_widget.dart';
import '/components/notification_icon_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_with_border/c_h_r_d_label_text_field_with_border_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_phone_number/c_h_r_d_phone_number_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_fan_copy_model.dart';
export 'home_fan_copy_model.dart';

class HomeFanCopyWidget extends StatefulWidget {
  const HomeFanCopyWidget({super.key});

  static String routeName = 'homeFanCopy';
  static String routePath = '/homeFanCopy';

  @override
  State<HomeFanCopyWidget> createState() => _HomeFanCopyWidgetState();
}

class _HomeFanCopyWidgetState extends State<HomeFanCopyWidget> {
  late HomeFanCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeFanCopyModel());

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
        final homeFanCopyShowPlannerResponse = snapshot.data!;

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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 50.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 91.0, 0.0),
                                  child: Text(
                                    'My Profile',
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
                        ),
                      ].addToStart(SizedBox(height: 20.0)),
                    ),
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
                            Text(
                              'Primary Details',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            wrapWithModel(
                              model: _model.adminNameModel,
                              updateCallback: () => safeSetState(() {}),
                              child: CHRDLabelTextFieldWithBorderWidget(
                                labelText: 'Name',
                                hintText: 'John Doe',
                                freezeEmailInput: false,
                                onChange: () async {
                                  safeSetState(() {});
                                },
                              ),
                            ),
                            wrapWithModel(
                              model: _model.cHRDPhoneNumberInitialModel,
                              updateCallback: () => safeSetState(() {}),
                              child: CHRDPhoneNumberWidget(
                                freezeMobileInput: false,
                                initialValue: '',
                                onChange: () async {},
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'Phone number is not valid',
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
                                      color: FlutterFlowTheme.of(context).error,
                                      fontSize: 11.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            wrapWithModel(
                              model: _model.emailAddressModel,
                              updateCallback: () => safeSetState(() {}),
                              child: CHRDLabelTextFieldWithBorderWidget(
                                labelText: 'Admin Email Address',
                                hintText: 'john.doe@livnightclub.com',
                                onChange: () async {
                                  safeSetState(() {});
                                },
                              ),
                            ),
                          ].divide(SizedBox(height: 14.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: wrapWithModel(
                      model: _model.cHRDLabelBtnModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: CHRDLabelBtnWidget(
                        heading: 'Save',
                        txtColor: FlutterFlowTheme.of(context).primaryText,
                        btnColor: FlutterFlowTheme.of(context).primaryViolet,
                        borderColor: FlutterFlowTheme.of(context).primaryViolet,
                        hight: 45.0,
                        headingFontSize: 14,
                        onTab: () async {},
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: wrapWithModel(
                      model: _model.cHRDLabelBtnModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: CHRDLabelBtnWidget(
                        heading: 'Logout',
                        txtColor: FlutterFlowTheme.of(context).primaryText,
                        btnColor: FlutterFlowTheme.of(context).primaryViolet,
                        borderColor: FlutterFlowTheme.of(context).primaryViolet,
                        hight: 45.0,
                        headingFontSize: 14,
                        onTab: () async {},
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
