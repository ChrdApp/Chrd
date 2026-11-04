import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_with_border/c_h_r_d_label_text_field_with_border_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_phone_number/c_h_r_d_phone_number_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_info1_model.dart';
export 'admin_info1_model.dart';

class AdminInfo1Widget extends StatefulWidget {
  const AdminInfo1Widget({super.key});

  static String routeName = 'admin_info1';
  static String routePath = '/adminInfo1';

  @override
  State<AdminInfo1Widget> createState() => _AdminInfo1WidgetState();
}

class _AdminInfo1WidgetState extends State<AdminInfo1Widget> {
  late AdminInfo1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminInfo1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userData = await UsersTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id',
          FFAppState().userId,
        ),
      );
      if (_model.userData?.firstOrNull?.phoneNumber != null &&
          _model.userData?.firstOrNull?.phoneNumber != '') {
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
        safeSetState(() {
          _model.emailAddressModel.textController?.text = currentUserEmail;
        });
        if (FFAppState().firstName != null && FFAppState().firstName != '') {
          safeSetState(() {
            _model.adminNameModel.textController?.text =
                '${FFAppState().firstName} ${FFAppState().lastName}';
          });
        }
        safeSetState(() {});
        return;
      } else {
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
        safeSetState(() {
          _model.emailAddressModel.textController?.text = currentUserEmail;
        });
        if (FFAppState().firstName != null && FFAppState().firstName != '') {
          safeSetState(() {
            _model.adminNameModel.textController?.text =
                '${FFAppState().firstName} ${FFAppState().lastName}';
          });
          return;
        } else {
          return;
        }
      }
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
                    child: wrapWithModel(
                      model: _model.cHRDLabelColumnTextModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CHRDLabelColumnTextWidget(
                        heading: 'Admin Account info',
                        subHeading: 'Let us know how to properly address you',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 0.0),
                    child: Text(
                      'Primary Admin Details',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                            onChange: () async {
                              safeSetState(() {});
                            },
                          ),
                        ),
                        if (!_model.hideMobileField)
                          wrapWithModel(
                            model: _model.cHRDPhoneNumberInitialModel,
                            updateCallback: () => safeSetState(() {}),
                            child: CHRDPhoneNumberWidget(
                              freezeMobileInput: !_model.hideMobileField,
                              initialValue: _model.mobileNoValue,
                              onChange: () async {
                                _model.hideMobileField = false;
                                _model.showMobileError = false;
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
                            freezeEmailInput: !_model.hideEmailField,
                            onChange: () async {
                              safeSetState(() {});
                            },
                          ),
                        ),
                        if (false)
                          FlutterFlowDropDown<String>(
                            controller: _model.roleDropDownValueController ??=
                                FormFieldController<String>(
                              _model.roleDropDownValue ??= 'Venue Manager',
                            ),
                            options: ['Venue Manager', 'Employee'],
                            onChanged: (val) => safeSetState(
                                () => _model.roleDropDownValue = val),
                            width: double.infinity,
                            height: 58.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            hintText: 'Role/Position',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor:
                                FlutterFlowTheme.of(context).neutralDark900,
                            elevation: 2.0,
                            borderColor: Colors.transparent,
                            borderWidth: 0.0,
                            borderRadius: 12.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            hidesUnderline: true,
                            disabled: true,
                            isOverButton: false,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                      ].divide(SizedBox(height: 14.0)),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: wrapWithModel(
                model: _model.cHRDLabelBtnModel,
                updateCallback: () => safeSetState(() {}),
                child: CHRDLabelBtnWidget(
                  heading: 'Next',
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
                    var _shouldSetState = false;
                    if (_model.formKey.currentState == null ||
                        !_model.formKey.currentState!.validate()) {
                      return;
                    }
                    if (_model.hideMobileField != true) {
                      _model.showMobileError = (String var1) {
                        return var1.length == 17 ? false : true;
                      }(_model.cHRDPhoneNumberInitialModel
                          .phoneNumberTextController.text);
                      safeSetState(() {});
                    }
                    if (!_model.showMobileError) {
                      FFAppState().AdminName =
                          _model.adminNameModel.textController.text;
                      safeSetState(() {});
                      _model.emailOutput = await UsersTable().queryRows(
                        queryFn: (q) => q.eqOrNull(
                          'email',
                          _model.emailAddressModel.textController.text,
                        ),
                      );
                      _shouldSetState = true;
                      if (FFAppState().loginType == LoginType.Phone.name) {
                        if (_model.emailOutput?.length == 0) {
                          _model.userOutput = await UsersTable().update(
                            data: {
                              'name': _model.adminNameModel.textController.text,
                              'email':
                                  _model.emailAddressModel.textController.text,
                              'role': 'Venue Manager',
                              'permission': 'admin',
                              'user_type': Type.Venue.name,
                              'step': 2,
                              'phone_number': _model.mobileNoValue,
                            },
                            matchingRows: (rows) => rows.eqOrNull(
                              'id',
                              FFAppState().userId,
                            ),
                            returnRows: true,
                          );
                          _shouldSetState = true;
                          FFAppState().step =
                              _model.userOutput!.firstOrNull!.step!;
                          FFAppState().userType = Type.Venue;
                          safeSetState(() {});
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Email already exists. Try with different one.',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).error,
                            ),
                          );
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }
                      } else {
                        _model.userOutputSocialLogin =
                            await UsersTable().update(
                          data: {
                            'name': _model.adminNameModel.textController.text,
                            'email':
                                _model.emailAddressModel.textController.text,
                            'role': _model.roleDropDownValue,
                            'permission': 'admin',
                            'user_type': Type.Venue.name,
                            'step': 2,
                            'phone_number': _model.cHRDPhoneNumberInitialModel
                                .phoneNumberTextController.text,
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'email',
                            currentUserEmail,
                          ),
                          returnRows: true,
                        );
                        _shouldSetState = true;
                        FFAppState().step =
                            _model.userOutputSocialLogin!.firstOrNull!.step!;
                        FFAppState().userType = Type.Venue;
                        safeSetState(() {});
                      }

                      context.goNamed(AddVenues2Widget.routeName);

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
          ].addToEnd(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
