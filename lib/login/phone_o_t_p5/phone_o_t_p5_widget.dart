import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'phone_o_t_p5_model.dart';
export 'phone_o_t_p5_model.dart';

class PhoneOTP5Widget extends StatefulWidget {
  const PhoneOTP5Widget({
    super.key,
    required this.number,
  });

  final String? number;

  static String routeName = 'phone_OTP5';
  static String routePath = '/phoneOTP5';

  @override
  State<PhoneOTP5Widget> createState() => _PhoneOTP5WidgetState();
}

class _PhoneOTP5WidgetState extends State<PhoneOTP5Widget> {
  late PhoneOTP5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhoneOTP5Model());

    _model.pinCodeFocusNode ??= FocusNode();

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
                  fit: BoxFit.fill,
                  image: Image.asset(
                    'assets/images/otp.png',
                  ).image,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.88, -1.0),
                    child: wrapWithModel(
                      model: _model.cHRDBackBtnModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CHRDBackBtnWidget(
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        btnAction: () async {
                          context.safePop();
                        },
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Enter the code you received.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 27.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'A 6-digit code was sent to ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFE2E4E8),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            TextSpan(
                              text: widget!.number!,
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryCyan,
                                fontSize: 14.0,
                              ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFE2E4E8),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ].divide(SizedBox(height: 6.0)),
                  ),
                ]
                    .divide(SizedBox(height: 35.0))
                    .addToStart(SizedBox(height: 57.0))
                    .addToEnd(SizedBox(height: 20.0)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: PinCodeTextField(
                        autoDisposeControllers: false,
                        appContext: context,
                        length: 6,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyLarge
                            .override(
                              font: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 26.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        enableActiveFill: false,
                        autoFocus: true,
                        focusNode: _model.pinCodeFocusNode,
                        enablePinAutofill: true,
                        errorTextSpace: 16.0,
                        showCursor: true,
                        cursorColor: FlutterFlowTheme.of(context).primaryCyan,
                        obscureText: false,
                        hintCharacter: '*',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        pinTheme: PinTheme(
                          fieldHeight: 44.0,
                          fieldWidth: 44.0,
                          borderWidth: 2.0,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                          shape: PinCodeFieldShape.underline,
                          activeColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          inactiveColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          selectedColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        controller: _model.pinCodeController,
                        onChanged: (_) async {
                          safeSetState(() {});
                        },
                        autovalidateMode: AutovalidateMode.disabled,
                        validator: _model.pinCodeControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 12.0))
                      .addToStart(SizedBox(height: 36.0)),
                ),
              ),
            ),
            FFButtonWidget(
              onPressed: (_model.pinCodeController!.text == null ||
                      _model.pinCodeController!.text == '')
                  ? null
                  : () async {
                      var _shouldSetState = false;
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        return;
                      }
                      _model.isOtpVerified = await actions.verifyOtp(
                        _model.pinCodeController!.text,
                        '1${functions.extractMobileNo('+1${widget!.number}')?.firstOrNull}',
                      );
                      _shouldSetState = true;
                      if (_model.isOtpVerified == true) {
                        _model.isPhoneExist = await UsersTable().queryRows(
                          queryFn: (q) => q.eqOrNull(
                            'phone_number',
                            functions
                                .extractMobileNo(widget!.number!)
                                ?.firstOrNull,
                          ),
                        );
                        _shouldSetState = true;
                        if (_model.isPhoneExist?.length == 0) {
                          _model.userOutput = await UsersTable().insert({
                            'phone_number': functions
                                .extractMobileNo(widget!.number!)
                                ?.firstOrNull,
                            'country_code': functions
                                .extractMobileNo(widget!.number!)
                                ?.lastOrNull,
                            'step': 1,
                            'auth_id': currentUserUid,
                            'is_active': true,
                          });
                          _shouldSetState = true;
                          FFAppState().userId = _model.userOutput!.id;
                          FFAppState().step = _model.userOutput!.step!;
                          FFAppState().loginType = LoginType.Phone.name;
                          await actions.oneSignalLogin(
                            FFAppState().userId.toString(),
                          );

                          context.goNamed(AccountCreation6Widget.routeName);
                        } else {
                          if (_model.isPhoneExist!.firstOrNull!.isActive!) {
                            FFAppState().userId =
                                _model.isPhoneExist!.firstOrNull!.id;
                            FFAppState().step =
                                _model.isPhoneExist!.firstOrNull!.step!;
                            FFAppState().userType = () {
                              if (_model.isPhoneExist?.firstOrNull?.userType ==
                                  'Musician') {
                                return Type.Musician;
                              } else if (_model
                                      .isPhoneExist?.firstOrNull?.userType ==
                                  Type.Venue.name) {
                                return Type.Venue;
                              } else if (_model
                                      .isPhoneExist?.firstOrNull?.userType ==
                                  Type.Fan.name) {
                                return Type.Fan;
                              } else {
                                return null;
                              }
                            }();
                            FFAppState().loginType = LoginType.Phone.name;
                            safeSetState(() {});
                            await actions.oneSignalLogin(
                              FFAppState().userId.toString(),
                            );
                            if (FFAppState().step == 1) {
                              context.goNamed(AccountCreation6Widget.routeName);
                            } else {
                              context.goNamed(NavPageWidget.routeName);
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Your account has been deleted. Please contact support for assistance.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Otp didn\'t verify! Try again.',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: FlutterFlowTheme.of(context).error,
                          ),
                        );
                      }

                      if (_shouldSetState) safeSetState(() {});
                    },
              text: 'Verify',
              options: FFButtonOptions(
                height: 45.0,
                padding: EdgeInsetsDirectional.fromSTEB(77.5, 0.0, 77.5, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primaryViolet,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.montserrat(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(37.0),
                disabledColor: FlutterFlowTheme.of(context).neutralDark800,
                disabledTextColor: FlutterFlowTheme.of(context).neutralLight300,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(23.0, 54.0, 20.0, 0.0),
              child: RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Didn’t get a code? ',
                      style: TextStyle(),
                    ),
                    TextSpan(
                      text: 'Resend Code',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    )
                  ],
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.montserrat(
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: Color(0xFFE2E4E8),
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ].addToEnd(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
