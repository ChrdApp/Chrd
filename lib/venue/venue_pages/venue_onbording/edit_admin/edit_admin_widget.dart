import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_with_border/c_h_r_d_label_text_field_with_border_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_phone_number/c_h_r_d_phone_number_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_admin_model.dart';
export 'edit_admin_model.dart';

class EditAdminWidget extends StatefulWidget {
  const EditAdminWidget({super.key});

  static String routeName = 'edit_admin';
  static String routePath = '/editAdmin';

  @override
  State<EditAdminWidget> createState() => _EditAdminWidgetState();
}

class _EditAdminWidgetState extends State<EditAdminWidget> {
  late EditAdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditAdminModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userData = await UsersTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id',
          FFAppState().userId,
        ),
      );
      safeSetState(() {
        _model.cHRDPhoneNumberModel.phoneNumberTextController?.text = functions
            .formatUSNumber(_model.userData?.firstOrNull?.phoneNumber)!;
        _model.cHRDPhoneNumberModel.phoneNumberMask.updateMask(
          newValue: TextEditingValue(
            text: _model.cHRDPhoneNumberModel.phoneNumberTextController!.text,
          ),
        );
      });
      safeSetState(() {
        _model.adminNameModel.textController?.text =
            _model.userData!.firstOrNull!.name!;
      });
      safeSetState(() {
        _model.emailAddressModel.textController?.text =
            _model.userData!.firstOrNull!.email!;
      });
      _model.hideMobileField =
          _model.userData?.firstOrNull?.phoneNumber != null &&
              _model.userData?.firstOrNull?.phoneNumber != '';
      _model.hideEmailField = _model.userData?.firstOrNull?.email != null &&
          _model.userData?.firstOrNull?.email != '';
      _model.mobileNoValue =
          _model.userData?.firstOrNull?.phoneNumber != null &&
                  _model.userData?.firstOrNull?.phoneNumber != ''
              ? _model.userData!.firstOrNull!.phoneNumber!
              : '';
      safeSetState(() {});
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
        backgroundColor: Colors.black,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/admin_acount_info.png',
                  ).image,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.9, 0.0),
                    child: wrapWithModel(
                      model: _model.cHRDBackBtnModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CHRDBackBtnWidget(
                        icon: Icon(
                          Icons.arrow_back_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        btnAction: () async {
                          context.safePop();
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        GoRouter.of(context).prepareAuthEvent();
                        await authManager.signOut();
                        GoRouter.of(context).clearRedirectLocation();

                        FFAppState().step = 0;
                        FFAppState().userType = null;
                        safeSetState(() {});

                        context.goNamedAuth(
                            SplashScreenWidget.routeName, context.mounted);
                      },
                      child: wrapWithModel(
                        model: _model.cHRDLabelColumnTextModel,
                        updateCallback: () => safeSetState(() {}),
                        child: CHRDLabelColumnTextWidget(
                          heading: 'Profile Details',
                          subHeading: 'Click Fields to edit',
                        ),
                      ),
                    ),
                  ),
                ]
                    .addToStart(SizedBox(height: 56.0))
                    .addToEnd(SizedBox(height: 20.0)),
              ),
            ),
            Expanded(
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.adminNameModel,
                          updateCallback: () => safeSetState(() {}),
                          child: CHRDLabelTextFieldWithBorderWidget(
                            labelText: 'Admin Name',
                            hintText: 'John Doe',
                            freezeEmailInput: true,
                            onChange: () async {
                              safeSetState(() {});
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.cHRDPhoneNumberModel,
                          updateCallback: () => safeSetState(() {}),
                          child: CHRDPhoneNumberWidget(
                            freezeMobileInput: !_model.hideMobileField,
                            initialValue: '',
                            onChange: () async {
                              _model.hideMobileField = false;
                              safeSetState(() {});
                            },
                          ),
                        ),
                        if (_model.showMobileError)
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
                            freezeEmailInput: true,
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
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
              child: wrapWithModel(
                model: _model.cHRDLabelBtnModel1,
                updateCallback: () => safeSetState(() {}),
                child: CHRDLabelBtnWidget(
                  heading: 'Log out',
                  txtColor: FlutterFlowTheme.of(context).primaryText,
                  btnColor: Color(0x00030303),
                  borderColor: FlutterFlowTheme.of(context).primaryViolet,
                  hight: 45.0,
                  headingFontSize: 14,
                  isDisiable: (_model.adminNameModel.textController.text !=
                                  null &&
                              _model.adminNameModel.textController.text !=
                                  '') &&
                          (_model.emailAddressModel.textController.text !=
                                  null &&
                              _model.emailAddressModel.textController.text !=
                                  '')
                      ? false
                      : true,
                  onTab: () async {
                    FFAppState().venueId = 0;
                    FFAppState().userId = 0;
                    FFAppState().step = 0;
                    FFAppState().userType = null;
                    FFAppState().vanueName = '';
                    FFAppState().AdminName = '';
                    FFAppState().venueProfilePic = '';
                    FFAppState().venueContentVenueList = [];
                    FFAppState().venueAccountCreate =
                        VenueAccountCreateStruct();
                    FFAppState().performanceStagesContentList = [];
                    FFAppState().startTime = null;
                    FFAppState().endTime = null;
                    FFAppState().slotRepeatType = 'None';
                    FFAppState().slotEndDate = null;
                    FFAppState().accountType = '';
                    FFAppState().musicianAddImages = [];
                    FFAppState().ProfileHighlight = [];
                    FFAppState().gigOffer = GigOfferStruct();
                    FFAppState().json = jsonDecode(
                        '[{\"sender\":\"venue\",\"text\":\"Hey! We\'ve been following your shows and would love to have you DJ for us! How much money would you want for each show?\",\"timestamp\":\"9:41am\",\"date\":\"Oct 23rd, 2025\",\"isProposal\":true},{\"sender\":\"musician\",\"text\":\"Hi there! I would love to perform. I am not available Wednesday, Nov 26th. I am still interested in doing the other 3 shows for \$400 each.\",\"timestamp\":\"10:54am\"}]');
                    FFAppState().selectedVenueSwitch =
                        VenueSwitchDetailStruct();
                    safeSetState(() {});
                    await actions.oneSignalLogout();
                    GoRouter.of(context).prepareAuthEvent();
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();

                    context.goNamedAuth(
                        SplashScreenWidget.routeName, context.mounted);
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: wrapWithModel(
                model: _model.cHRDLabelBtnModel2,
                updateCallback: () => safeSetState(() {}),
                child: CHRDLabelBtnWidget(
                  heading: 'Update',
                  txtColor: FlutterFlowTheme.of(context).primaryText,
                  btnColor: FlutterFlowTheme.of(context).primaryViolet,
                  borderColor: FlutterFlowTheme.of(context).primaryViolet,
                  hight: 45.0,
                  headingFontSize: 14,
                  isDisiable: (_model.adminNameModel.textController.text !=
                                  null &&
                              _model.adminNameModel.textController.text !=
                                  '') &&
                          (_model.emailAddressModel.textController.text !=
                                  null &&
                              _model.emailAddressModel.textController.text !=
                                  '')
                      ? false
                      : true,
                  onTab: () async {
                    if (_model.formKey.currentState == null ||
                        !_model.formKey.currentState!.validate()) {
                      return;
                    }
                    if (_model.hideMobileField != true) {
                      _model.showMobileError = (String var1) {
                        return var1.length < 17 ? false : true;
                      }(_model
                          .cHRDPhoneNumberModel.phoneNumberTextController.text);
                      safeSetState(() {});
                      return;
                    }
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
                    FFAppState().AdminName =
                        _model.adminNameModel.textController.text;
                    safeSetState(() {});
                    context.safePop();
                  },
                ),
              ),
            ),
          ].addToEnd(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
