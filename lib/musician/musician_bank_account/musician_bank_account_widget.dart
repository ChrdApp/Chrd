import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_with_border/c_h_r_d_label_text_field_with_border_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_app_bar2/c_h_r_d_app_bar2_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'musician_bank_account_model.dart';
export 'musician_bank_account_model.dart';

class MusicianBankAccountWidget extends StatefulWidget {
  const MusicianBankAccountWidget({super.key});

  static String routeName = 'musician_bank_account';
  static String routePath = '/musicianBankAccount';

  @override
  State<MusicianBankAccountWidget> createState() =>
      _MusicianBankAccountWidgetState();
}

class _MusicianBankAccountWidgetState extends State<MusicianBankAccountWidget> {
  late MusicianBankAccountModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MusicianBankAccountModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 251.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/profileSet8.png',
                            ).image,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  21.0, 0.0, 19.0, 0.0),
                              child: wrapWithModel(
                                model: _model.cHRDAppBar2Model,
                                updateCallback: () => safeSetState(() {}),
                                child: CHRDAppBar2Widget(
                                  step: 8,
                                  skip: 'Skip',
                                  progressValue: 1.0,
                                  hideSkipButton: false,
                                  count: 8,
                                  onNavBack: () async {
                                    context.pop();
                                  },
                                  onSkip: () async {
                                    context.pushNamed(
                                      VenueSocialMedia6Widget.routeName,
                                      queryParameters: {
                                        'type': serializeParam(
                                          'Venue',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: wrapWithModel(
                                model: _model.cHRDLabelColumnTextModel,
                                updateCallback: () => safeSetState(() {}),
                                child: CHRDLabelColumnTextWidget(
                                  heading: 'Add your bank account ',
                                  subHeading:
                                      'Add your bank account details to facilitate seamless transactions when receiving payment from venues.',
                                ),
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 32.0))
                              .addToStart(SizedBox(height: 58.0)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.accountHolderNameModel,
                              updateCallback: () => safeSetState(() {}),
                              child: CHRDLabelTextFieldWithBorderWidget(
                                labelText: 'Account Holder Name',
                                hintText: 'Phoebe Bridgers',
                                onChange: () async {},
                              ),
                            ),
                            wrapWithModel(
                              model: _model.accountNumberModel,
                              updateCallback: () => safeSetState(() {}),
                              child: CHRDLabelTextFieldWithBorderWidget(
                                labelText: 'Account Number',
                                hintText: '987654321',
                                onChange: () async {},
                              ),
                            ),
                            wrapWithModel(
                              model: _model.reEnterAccountModel,
                              updateCallback: () => safeSetState(() {}),
                              child: CHRDLabelTextFieldWithBorderWidget(
                                labelText: 'Re-enter Account Number',
                                hintText: '987654321',
                                onChange: () async {},
                              ),
                            ),
                            wrapWithModel(
                              model: _model.bankNameModel,
                              updateCallback: () => safeSetState(() {}),
                              child: CHRDLabelTextFieldWithBorderWidget(
                                labelText: 'Bank Name',
                                hintText: 'XYZ National Bank',
                                onChange: () async {},
                              ),
                            ),
                            wrapWithModel(
                              model: _model.routingCodeModel,
                              updateCallback: () => safeSetState(() {}),
                              child: CHRDLabelTextFieldWithBorderWidget(
                                labelText: 'Routing Code',
                                hintText: 'XYZB1234ABC',
                                onChange: () async {},
                              ),
                            ),
                          ].divide(SizedBox(height: 14.0)),
                        ),
                      ),
                    ],
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
                  isDisiable: false,
                  onTab: () async {
                    if (_model.formKey.currentState == null ||
                        !_model.formKey.currentState!.validate()) {
                      return;
                    }

                    context.goNamed(HomeMWidget.routeName);
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
