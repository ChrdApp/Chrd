import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_app_bar2/c_h_r_d_app_bar2_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'venue_social_media6_model.dart';
export 'venue_social_media6_model.dart';

class VenueSocialMedia6Widget extends StatefulWidget {
  const VenueSocialMedia6Widget({
    super.key,
    this.type,
    this.venueId,
    this.musicianId,
  });

  final String? type;
  final int? venueId;
  final int? musicianId;

  static String routeName = 'venue_social_media6';
  static String routePath = '/venueSocialMedia6';

  @override
  State<VenueSocialMedia6Widget> createState() =>
      _VenueSocialMedia6WidgetState();
}

class _VenueSocialMedia6WidgetState extends State<VenueSocialMedia6Widget> {
  late VenueSocialMedia6Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VenueSocialMedia6Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.venueId != null) {
        _model.venueResult = await VenuesTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'id',
            widget!.venueId,
          ),
        );
        safeSetState(() {
          _model.instagramAccountTextController?.text =
              _model.venueResult!.firstOrNull!.instagramId!;
        });
        safeSetState(() {
          _model.facebookAccountTextController?.text =
              _model.venueResult!.firstOrNull!.facebookId!;
        });
        safeSetState(() {
          _model.xAccountTextController?.text =
              _model.venueResult!.firstOrNull!.xId!;
        });
        safeSetState(() {
          _model.youtubeAccountTextController?.text =
              _model.venueResult!.firstOrNull!.youtubeId!;
        });
        return;
      } else if (widget!.musicianId != null) {
        _model.musicianResult = await SocialMediaTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'created_by',
            widget!.musicianId,
          ),
        );
        safeSetState(() {
          _model.instagramAccountTextController?.text =
              _model.musicianResult!.firstOrNull!.instagramId!;
        });
        safeSetState(() {
          _model.facebookAccountTextController?.text =
              _model.musicianResult!.firstOrNull!.facebookId!;
        });
        safeSetState(() {
          _model.xAccountTextController?.text =
              _model.musicianResult!.firstOrNull!.xId!;
        });
        safeSetState(() {
          _model.youtubeAccountTextController?.text =
              _model.musicianResult!.firstOrNull!.youtubeId!;
        });
        return;
      } else {
        return;
      }
    });

    _model.instagramAccountTextController ??= TextEditingController();
    _model.instagramAccountFocusNode ??= FocusNode();

    _model.xAccountTextController ??= TextEditingController();
    _model.xAccountFocusNode ??= FocusNode();

    _model.facebookAccountTextController ??= TextEditingController();
    _model.facebookAccountFocusNode ??= FocusNode();

    _model.youtubeAccountTextController ??= TextEditingController();
    _model.youtubeAccountFocusNode ??= FocusNode();

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
                      height: 251.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/social_media.png',
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
                                step: FFAppState().userType == Type.Musician
                                    ? 6
                                    : 4,
                                skip: 'Skip',
                                progressValue:
                                    FFAppState().userType == Type.Musician
                                        ? 1.0
                                        : 0.4,
                                hideSkipButton: () {
                                  if (widget!.venueId != null) {
                                    return true;
                                  } else if (widget!.musicianId != null) {
                                    return true;
                                  } else {
                                    return false;
                                  }
                                }(),
                                count: FFAppState().userType == Type.Musician
                                    ? 6
                                    : 8,
                                isEdit: () {
                                  if (widget!.venueId != null) {
                                    return true;
                                  } else if (widget!.musicianId != null) {
                                    return true;
                                  } else {
                                    return false;
                                  }
                                }(),
                                onNavBack: () async {
                                  context.pop();
                                },
                                onSkip: () async {
                                  if (FFAppState().userType == Type.Musician) {
                                    context.goNamed(NavPageWidget.routeName);
                                  } else {
                                    context.pushNamed(
                                        VenueEntertainment7Widget.routeName);
                                  }
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
                                  'Your social media ',
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
                                  'Expand your reach with social media. Connect with your audience easily.',
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
                                  .addToStart(SizedBox(height: 32.0)),
                            ),
                          ),
                        ].addToStart(SizedBox(height: 58.0)),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                0.0,
                                0.0,
                                valueOrDefault<double>(
                                  _model.isInstagramError ? 0.0 : 16.0,
                                  0.0,
                                )),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF01CDD0),
                                    Color(0xFF04C8D0),
                                    Color(0xFF0EBCD1),
                                    Color(0xFF20A7D4),
                                    Color(0xFF3A89D8),
                                    Color(0xFF6951DC),
                                    Color(0xFF8D28E3)
                                  ],
                                  stops: [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 1.0],
                                  begin: AlignmentDirectional(-1.0, 0.0),
                                  end: AlignmentDirectional(1.0, 0),
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryCyan,
                                  width: 1.0,
                                ),
                              ),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller:
                                      _model.instagramAccountTextController,
                                  focusNode: _model.instagramAccountFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.instagramAccountTextController',
                                    Duration(milliseconds: 0),
                                    () async {
                                      if (_model.instagramAccountTextController
                                                  .text !=
                                              null &&
                                          _model.instagramAccountTextController
                                                  .text !=
                                              '') {
                                        _model.insertAtIndexInIsFill(
                                            0,
                                            _model
                                                .instagramAccountTextController
                                                .text);
                                        safeSetState(() {});
                                      } else {
                                        _model.removeAtIndexFromIsFill(0);
                                        safeSetState(() {});
                                      }

                                      _model.isInstagramError = false;
                                      safeSetState(() {});
                                    },
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xF0FFFFFF),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    hintText: 'Add Instagram Account',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xF0FFFFFF),
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    prefixIcon: Icon(
                                      FFIcons.kinsta,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 16.0,
                                    ),
                                    suffixIcon: _model
                                            .instagramAccountTextController!
                                            .text
                                            .isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model
                                                  .instagramAccountTextController
                                                  ?.clear();
                                              if (_model.instagramAccountTextController
                                                          .text !=
                                                      null &&
                                                  _model.instagramAccountTextController
                                                          .text !=
                                                      '') {
                                                _model.insertAtIndexInIsFill(
                                                    0,
                                                    _model
                                                        .instagramAccountTextController
                                                        .text);
                                                safeSetState(() {});
                                              } else {
                                                _model
                                                    .removeAtIndexFromIsFill(0);
                                                safeSetState(() {});
                                              }

                                              _model.isInstagramError = false;
                                              safeSetState(() {});
                                              safeSetState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  enableInteractiveSelection: true,
                                  validator: _model
                                      .instagramAccountTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          if (_model.isInstagramError)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 16.0),
                              child: Text(
                                'Please enter a valid username.',
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
                                      fontSize: 12.0,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                0.0,
                                0.0,
                                valueOrDefault<double>(
                                  _model.isXError ? 0.0 : 16.0,
                                  0.0,
                                )),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    FlutterFlowTheme.of(context).primaryCyan,
                                    Color(0xFF04C8D0),
                                    Color(0xFF0EBCD1),
                                    Color(0xFF20A7D4),
                                    Color(0xFF3A89D8),
                                    Color(0xFF6951DC),
                                    Color(0xFF8D28E3)
                                  ],
                                  stops: [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 1.0],
                                  begin: AlignmentDirectional(-1.0, 0.0),
                                  end: AlignmentDirectional(1.0, 0),
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryCyan,
                                  width: 1.0,
                                ),
                              ),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.xAccountTextController,
                                  focusNode: _model.xAccountFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.xAccountTextController',
                                    Duration(milliseconds: 0),
                                    () async {
                                      if (_model.xAccountTextController.text !=
                                              null &&
                                          _model.xAccountTextController.text !=
                                              '') {
                                        _model.insertAtIndexInIsFill(1,
                                            _model.xAccountTextController.text);
                                        safeSetState(() {});
                                      } else {
                                        _model.removeAtIndexFromIsFill(1);
                                        safeSetState(() {});
                                      }

                                      _model.isXError = false;
                                      safeSetState(() {});
                                    },
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xF0FFFFFF),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    hintText: 'Add X Account',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xF0FFFFFF),
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    prefixIcon: Icon(
                                      FFIcons.kx,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 16.0,
                                    ),
                                    suffixIcon: _model.xAccountTextController!
                                            .text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.xAccountTextController
                                                  ?.clear();
                                              if (_model.xAccountTextController
                                                          .text !=
                                                      null &&
                                                  _model.xAccountTextController
                                                          .text !=
                                                      '') {
                                                _model.insertAtIndexInIsFill(
                                                    1,
                                                    _model
                                                        .xAccountTextController
                                                        .text);
                                                safeSetState(() {});
                                              } else {
                                                _model
                                                    .removeAtIndexFromIsFill(1);
                                                safeSetState(() {});
                                              }

                                              _model.isXError = false;
                                              safeSetState(() {});
                                              safeSetState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  enableInteractiveSelection: true,
                                  validator: _model
                                      .xAccountTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          if (_model.isXError)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 16.0),
                              child: Text(
                                'Please enter a valid username.',
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
                                      fontSize: 12.0,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                0.0,
                                0.0,
                                valueOrDefault<double>(
                                  _model.isFbError ? 0.0 : 16.0,
                                  0.0,
                                )),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    FlutterFlowTheme.of(context).primaryCyan,
                                    Color(0xFF04C8D0),
                                    Color(0xFF0EBCD1),
                                    Color(0xFF20A7D4),
                                    Color(0xFF3A89D8),
                                    Color(0xFF6951DC),
                                    Color(0xFF8D28E3)
                                  ],
                                  stops: [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 1.0],
                                  begin: AlignmentDirectional(-1.0, 0.0),
                                  end: AlignmentDirectional(1.0, 0),
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryCyan,
                                  width: 1.0,
                                ),
                              ),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller:
                                      _model.facebookAccountTextController,
                                  focusNode: _model.facebookAccountFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.facebookAccountTextController',
                                    Duration(milliseconds: 0),
                                    () async {
                                      if (_model.facebookAccountTextController
                                                  .text !=
                                              null &&
                                          _model.facebookAccountTextController
                                                  .text !=
                                              '') {
                                        _model.insertAtIndexInIsFill(
                                            2,
                                            _model.facebookAccountTextController
                                                .text);
                                        safeSetState(() {});
                                      } else {
                                        _model.removeAtIndexFromIsFill(2);
                                        safeSetState(() {});
                                      }

                                      _model.isFbError = false;
                                      safeSetState(() {});
                                    },
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xF0FFFFFF),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    hintText: 'Add Facebook Account',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xF0FFFFFF),
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    prefixIcon: Icon(
                                      FFIcons.kfacebook,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 16.0,
                                    ),
                                    suffixIcon: _model
                                            .facebookAccountTextController!
                                            .text
                                            .isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model
                                                  .facebookAccountTextController
                                                  ?.clear();
                                              if (_model.facebookAccountTextController
                                                          .text !=
                                                      null &&
                                                  _model.facebookAccountTextController
                                                          .text !=
                                                      '') {
                                                _model.insertAtIndexInIsFill(
                                                    2,
                                                    _model
                                                        .facebookAccountTextController
                                                        .text);
                                                safeSetState(() {});
                                              } else {
                                                _model
                                                    .removeAtIndexFromIsFill(2);
                                                safeSetState(() {});
                                              }

                                              _model.isFbError = false;
                                              safeSetState(() {});
                                              safeSetState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  enableInteractiveSelection: true,
                                  validator: _model
                                      .facebookAccountTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          if (_model.isFbError)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 16.0),
                              child: Text(
                                'Please enter a valid username.',
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
                                      fontSize: 12.0,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                0.0,
                                0.0,
                                valueOrDefault<double>(
                                  _model.isYoutubeError ? 0.0 : 16.0,
                                  0.0,
                                )),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    FlutterFlowTheme.of(context).primaryCyan,
                                    Color(0xFF04C8D0),
                                    Color(0xFF0EBCD1),
                                    Color(0xFF20A7D4),
                                    Color(0xFF3A89D8),
                                    Color(0xFF6951DC),
                                    Color(0xFF8D28E3)
                                  ],
                                  stops: [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 1.0],
                                  begin: AlignmentDirectional(-1.0, 0.0),
                                  end: AlignmentDirectional(1.0, 0),
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryCyan,
                                  width: 1.0,
                                ),
                              ),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller:
                                      _model.youtubeAccountTextController,
                                  focusNode: _model.youtubeAccountFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.youtubeAccountTextController',
                                    Duration(milliseconds: 0),
                                    () async {
                                      if (_model.youtubeAccountTextController
                                                  .text !=
                                              null &&
                                          _model.youtubeAccountTextController
                                                  .text !=
                                              '') {
                                        _model.insertAtIndexInIsFill(
                                            3,
                                            _model.youtubeAccountTextController
                                                .text);
                                        safeSetState(() {});
                                      } else {
                                        _model.removeAtIndexFromIsFill(3);
                                        safeSetState(() {});
                                      }

                                      _model.isYoutubeError = false;
                                      safeSetState(() {});
                                    },
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xF0FFFFFF),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    hintText: 'Add Youtube Account',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xF0FFFFFF),
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    prefixIcon: Icon(
                                      FFIcons.kyoutube,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 16.0,
                                    ),
                                    suffixIcon: _model
                                            .youtubeAccountTextController!
                                            .text
                                            .isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model
                                                  .youtubeAccountTextController
                                                  ?.clear();
                                              if (_model.youtubeAccountTextController
                                                          .text !=
                                                      null &&
                                                  _model.youtubeAccountTextController
                                                          .text !=
                                                      '') {
                                                _model.insertAtIndexInIsFill(
                                                    3,
                                                    _model
                                                        .youtubeAccountTextController
                                                        .text);
                                                safeSetState(() {});
                                              } else {
                                                _model
                                                    .removeAtIndexFromIsFill(3);
                                                safeSetState(() {});
                                              }

                                              _model.isYoutubeError = false;
                                              safeSetState(() {});
                                              safeSetState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  enableInteractiveSelection: true,
                                  validator: _model
                                      .youtubeAccountTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          if (_model.isYoutubeError)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 16.0),
                              child: Text(
                                'Please enter a valid username.',
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
                                      fontSize: 12.0,
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
                        ],
                      ),
                    ),
                  ].addToEnd(SizedBox(height: 108.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: wrapWithModel(
                model: _model.cHRDLabelBtnModel,
                updateCallback: () => safeSetState(() {}),
                child: CHRDLabelBtnWidget(
                  heading: () {
                    if (widget!.venueId != null) {
                      return 'Update';
                    } else if (widget!.musicianId != null) {
                      return 'Update';
                    } else {
                      return 'Next';
                    }
                  }(),
                  txtColor: FlutterFlowTheme.of(context).primaryText,
                  btnColor: FlutterFlowTheme.of(context).primaryViolet,
                  borderColor: FlutterFlowTheme.of(context).primaryViolet,
                  hight: 45.0,
                  headingFontSize: 14,
                  isDisiable: (_model.instagramAccountTextController.text !=
                                  null &&
                              _model.instagramAccountTextController.text !=
                                  '') ||
                          (_model.xAccountTextController.text != null &&
                              _model.xAccountTextController.text != '') ||
                          (_model.facebookAccountTextController.text != null &&
                              _model.facebookAccountTextController.text !=
                                  '') ||
                          (_model.youtubeAccountTextController.text != null &&
                              _model.youtubeAccountTextController.text != '')
                      ? false
                      : true,
                  onTab: () async {
                    var _shouldSetState = false;
                    await Future.wait([
                      Future(() async {
                        _model.isInstagramError = functions.isInvalidUsername(
                            _model.instagramAccountTextController.text);
                        safeSetState(() {});
                      }),
                      Future(() async {
                        _model.isXError = functions.isInvalidUsername(
                            _model.xAccountTextController.text);
                        safeSetState(() {});
                      }),
                      Future(() async {
                        _model.isFbError = functions.isInvalidUsername(
                            _model.facebookAccountTextController.text);
                        safeSetState(() {});
                      }),
                      Future(() async {
                        _model.isYoutubeError = functions.isInvalidUsername(
                            _model.youtubeAccountTextController.text);
                        safeSetState(() {});
                      }),
                    ]);
                    if (!_model.isInstagramError &&
                        !_model.isXError &&
                        !_model.isFbError &&
                        !_model.isYoutubeError) {
                      if (FFAppState().userType == Type.Venue) {
                        if (widget!.venueId != null) {
                          FFAppState().updateVenueAccountCreateStruct(
                            (e) => e
                              ..instagramId =
                                  _model.instagramAccountTextController.text
                              ..facebookId =
                                  _model.facebookAccountTextController.text
                              ..xId = _model.xAccountTextController.text
                              ..youtubeId =
                                  _model.youtubeAccountTextController.text,
                          );
                          safeSetState(() {});
                          await VenuesTable().update(
                            data: {
                              'instagram_id':
                                  _model.instagramAccountTextController.text,
                              'facebook_id':
                                  _model.facebookAccountTextController.text,
                              'youtube_id':
                                  _model.youtubeAccountTextController.text,
                              'x_id': _model.xAccountTextController.text,
                            },
                            matchingRows: (rows) => rows.eqOrNull(
                              'id',
                              widget!.venueId,
                            ),
                          );
                          context.safePop();
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        } else {
                          FFAppState().updateVenueAccountCreateStruct(
                            (e) => e
                              ..instagramId =
                                  _model.instagramAccountTextController.text
                              ..facebookId =
                                  _model.facebookAccountTextController.text
                              ..xId = _model.xAccountTextController.text
                              ..youtubeId =
                                  _model.youtubeAccountTextController.text,
                          );
                          safeSetState(() {});

                          context
                              .pushNamed(VenueEntertainment7Widget.routeName);

                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }
                      } else {
                        if (widget!.musicianId != null) {
                          _model.socialMediaOutput =
                              await SocialMediaTable().queryRows(
                            queryFn: (q) => q.eqOrNull(
                              'created_by',
                              widget!.musicianId,
                            ),
                          );
                          _shouldSetState = true;
                          if (_model.socialMediaOutput != null &&
                              (_model.socialMediaOutput)!.isNotEmpty) {
                            await SocialMediaTable().update(
                              data: {
                                'facebook_id':
                                    _model.facebookAccountTextController.text,
                                'x_id': _model.xAccountTextController.text,
                                'instagram_id':
                                    _model.instagramAccountTextController.text,
                                'youtube_id':
                                    _model.youtubeAccountTextController.text,
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'created_by',
                                widget!.musicianId,
                              ),
                            );
                          } else {
                            await SocialMediaTable().insert({
                              'instagram_id':
                                  _model.instagramAccountTextController.text,
                              'youtube_id':
                                  _model.youtubeAccountTextController.text,
                              'facebook_id':
                                  _model.facebookAccountTextController.text,
                              'x_id': _model.xAccountTextController.text,
                              'created_by': FFAppState().userId,
                            });
                          }

                          context.safePop();
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        } else {
                          await SocialMediaTable().insert({
                            'instagram_id':
                                _model.instagramAccountTextController.text,
                            'youtube_id':
                                _model.youtubeAccountTextController.text,
                            'facebook_id':
                                _model.facebookAccountTextController.text,
                            'x_id': _model.xAccountTextController.text,
                            'created_by': FFAppState().userId,
                          });
                          context.safePop();
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }
                      }
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
