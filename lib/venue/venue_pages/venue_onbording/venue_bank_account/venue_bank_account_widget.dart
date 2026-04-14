import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_with_border/c_h_r_d_label_text_field_with_border_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_app_bar2/c_h_r_d_app_bar2_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'venue_bank_account_model.dart';
export 'venue_bank_account_model.dart';

class VenueBankAccountWidget extends StatefulWidget {
  const VenueBankAccountWidget({super.key});

  static String routeName = 'venue_bank_account';
  static String routePath = '/venueBankAccount';

  @override
  State<VenueBankAccountWidget> createState() => _VenueBankAccountWidgetState();
}

class _VenueBankAccountWidgetState extends State<VenueBankAccountWidget> {
  late VenueBankAccountModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VenueBankAccountModel());

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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 259.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/bank_Account.png',
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
                                step: 9,
                                skip: 'Skip',
                                progressValue: 0.9,
                                hideSkipButton: false,
                                count: 9,
                                onNavBack: () async {
                                  context.safePop();
                                },
                                onSkip: () async {
                                  await UsersTable().update(
                                    data: {
                                      'step': 6,
                                    },
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'id',
                                      FFAppState().userId,
                                    ),
                                  );
                                  FFAppState().step = 6;

                                  context.goNamed(HomeVWidget.routeName);
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Add your bank account for ${valueOrDefault<String>(
                                    FFAppState().vanueName,
                                    'Venue',
                                  )}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  'Add your bank account details to facilitate seamless transactions when booking talent for your venue.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .neutralLight300,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ]
                                  .divide(SizedBox(height: 12.0))
                                  .addToStart(SizedBox(height: 28.0)),
                            ),
                          ),
                        ].addToStart(SizedBox(height: 58.0)),
                      ),
                    ),
                    Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              wrapWithModel(
                                model: _model.accountHolderNameModel,
                                updateCallback: () => safeSetState(() {}),
                                child: CHRDLabelTextFieldWithBorderWidget(
                                  labelText: 'Account Holder Name',
                                  hintText: 'Account Holder Name',
                                  onChange: () async {},
                                ),
                              ),
                              wrapWithModel(
                                model: _model.accountNumberModel,
                                updateCallback: () => safeSetState(() {}),
                                child: CHRDLabelTextFieldWithBorderWidget(
                                  labelText: 'Account Number',
                                  hintText: 'Account Number',
                                  onChange: () async {},
                                ),
                              ),
                              wrapWithModel(
                                model: _model.accountNumber2Model,
                                updateCallback: () => safeSetState(() {}),
                                child: CHRDLabelTextFieldWithBorderWidget(
                                  labelText: 'Re-enter Account Number',
                                  hintText: 'Re-enter Account Number',
                                  onChange: () async {},
                                ),
                              ),
                              wrapWithModel(
                                model: _model.bankNameModel,
                                updateCallback: () => safeSetState(() {}),
                                child: CHRDLabelTextFieldWithBorderWidget(
                                  labelText: 'Bank Name',
                                  hintText: 'Bank Name',
                                  onChange: () async {},
                                ),
                              ),
                              wrapWithModel(
                                model: _model.routingCodeModel,
                                updateCallback: () => safeSetState(() {}),
                                child: CHRDLabelTextFieldWithBorderWidget(
                                  labelText: 'Routing Code',
                                  hintText: 'Routing Code',
                                  onChange: () async {},
                                ),
                              ),
                            ]
                                .divide(SizedBox(height: 14.0))
                                .addToStart(SizedBox(height: 20.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                    await UsersTable().update(
                      data: {
                        'step': 6,
                      },
                      matchingRows: (rows) => rows.eqOrNull(
                        'id',
                        FFAppState().userId,
                      ),
                    );
                    FFAppState().step = 6;

                    context.goNamed(HomeVWidget.routeName);
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
