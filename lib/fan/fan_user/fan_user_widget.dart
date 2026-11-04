import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/notification_icon_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_with_border/c_h_r_d_label_text_field_with_border_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_phone_number/c_h_r_d_phone_number_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'fan_user_model.dart';
export 'fan_user_model.dart';

class FanUserWidget extends StatefulWidget {
  const FanUserWidget({super.key});

  static String routeName = 'FanUser';
  static String routePath = '/fanUser';

  @override
  State<FanUserWidget> createState() => _FanUserWidgetState();
}

class _FanUserWidgetState extends State<FanUserWidget> {
  late FanUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FanUserModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userOutput = await UsersTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id',
          FFAppState().userId,
        ),
      );
      safeSetState(() {
        _model.adminNameModel.textController?.text =
            _model.userOutput!.firstOrNull!.name!;
      });
      safeSetState(() {
        _model.cHRDPhoneNumberInitialModel.phoneNumberTextController?.text =
            _model.userOutput!.firstOrNull!.phoneNumber!;
        _model.cHRDPhoneNumberInitialModel.phoneNumberMask.updateMask(
          newValue: TextEditingValue(
            text: _model
                .cHRDPhoneNumberInitialModel.phoneNumberTextController!.text,
          ),
        );
      });
      safeSetState(() {
        _model.emailAddressModel.textController?.text =
            _model.userOutput!.firstOrNull!.email!;
      });
    });

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
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
                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                  ].addToStart(SizedBox(height: 20.0)),
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
                                color: FlutterFlowTheme.of(context).primaryText,
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
                            freezeEmailInput: true,
                            onChange: () async {
                              safeSetState(() {});
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.cHRDPhoneNumberInitialModel,
                          updateCallback: () => safeSetState(() {}),
                          child: CHRDPhoneNumberWidget(
                            freezeMobileInput: currentPhoneNumber != null &&
                                    currentPhoneNumber != ''
                                ? false
                                : true,
                            initialValue: '',
                            onChange: () async {},
                          ),
                        ),
                        wrapWithModel(
                          model: _model.emailAddressModel,
                          updateCallback: () => safeSetState(() {}),
                          child: CHRDLabelTextFieldWithBorderWidget(
                            labelText: 'Email Address',
                            hintText: 'john.doe@livnightclub.com',
                            freezeEmailInput: currentUserEmail != null &&
                                    currentUserEmail != ''
                                ? false
                                : true,
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
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                    onTab: () async {
                      await UsersTable().update(
                        data: {
                          'name': _model.adminNameModel.textController.text,
                          'email': _model.emailAddressModel.textController.text,
                        },
                        matchingRows: (rows) => rows.eqOrNull(
                          'id',
                          FFAppState().userId,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Profile details updated successfully!',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
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
                    onTab: () async {
                      FFAppState().AdminName = '';
                      FFAppState().FanFilter = FanFilterStruct();
                      FFAppState().email = '';
                      FFAppState().firstName = '';
                      FFAppState().lastName = '';
                      safeSetState(() {});
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();

                      context.goNamedAuth(
                          SplashScreenWidget.routeName, context.mounted);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
