import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/fan/fan_creation/fan_creation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/musician/components/musician_creation/musician_creation_widget.dart';
import '/musician/components/venue_creation/venue_creation_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'account_creation6_model.dart';
export 'account_creation6_model.dart';

class AccountCreation6Widget extends StatefulWidget {
  const AccountCreation6Widget({super.key});

  static String routeName = 'account_Creation6';
  static String routePath = '/accountCreation6';

  @override
  State<AccountCreation6Widget> createState() => _AccountCreation6WidgetState();
}

class _AccountCreation6WidgetState extends State<AccountCreation6Widget> {
  late AccountCreation6Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountCreation6Model());

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
                    'assets/images/account_Type.png',
                  ).image,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().venueId = 0;
                        FFAppState().userId = 0;
                        FFAppState().step = 0;
                        FFAppState().userType = Type.Venue;
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
                      child: wrapWithModel(
                        model: _model.cHRDLabelColumnTextModel,
                        updateCallback: () => safeSetState(() {}),
                        child: CHRDLabelColumnTextWidget(
                          heading: 'Choose Account Type',
                          subHeading: 'Select your role and start your journey',
                        ),
                      ),
                    ),
                  ),
                ]
                    .divide(SizedBox(height: 12.0))
                    .addToStart(SizedBox(height: 70.0))
                    .addToEnd(SizedBox(height: 30.0)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().userType = Type.Fan;
                        safeSetState(() {});
                      },
                      child: wrapWithModel(
                        model: _model.fanCreationModel,
                        updateCallback: () => safeSetState(() {}),
                        child: FanCreationWidget(
                          isSelected:
                              FFAppState().userType == Type.Fan ? true : false,
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().userType = Type.Musician;
                        safeSetState(() {});
                      },
                      child: wrapWithModel(
                        model: _model.musicianCreationModel,
                        updateCallback: () => safeSetState(() {}),
                        child: MusicianCreationWidget(
                          isSelected: FFAppState().userType == Type.Musician
                              ? true
                              : false,
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().userType = Type.Venue;
                        safeSetState(() {});
                      },
                      child: wrapWithModel(
                        model: _model.venueCreationModel,
                        updateCallback: () => safeSetState(() {}),
                        child: VenueCreationWidget(
                          isSelected: FFAppState().userType == Type.Venue
                              ? true
                              : false,
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 12.0)),
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
                  btnColor: FFAppState().userType != null
                      ? FlutterFlowTheme.of(context).primaryViolet
                      : FlutterFlowTheme.of(context).neutralDark800,
                  borderColor: FFAppState().userType != null
                      ? FlutterFlowTheme.of(context).primaryViolet
                      : FlutterFlowTheme.of(context).neutralDark800,
                  hight: 45.0,
                  headingFontSize: 14,
                  isDisiable: FFAppState().userType == null,
                  onTab: () async {
                    if (FFAppState().userType == Type.Musician) {
                      context.pushNamed(VenueProfilePic4Widget.routeName);

                      return;
                    } else if (FFAppState().userType == Type.Fan) {
                      context.pushNamed(FanInfoWidget.routeName);

                      return;
                    } else {
                      context.pushNamed(AdminInfo1Widget.routeName);

                      return;
                    }
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
