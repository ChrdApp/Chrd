import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_app_bar2/c_h_r_d_app_bar2_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'venue_entertainment7_model.dart';
export 'venue_entertainment7_model.dart';

class VenueEntertainment7Widget extends StatefulWidget {
  const VenueEntertainment7Widget({
    super.key,
    this.entertainmentId,
    this.venueId,
    this.musicianID,
  });

  final List<int>? entertainmentId;
  final int? venueId;
  final int? musicianID;

  static String routeName = 'venue_entertainment7';
  static String routePath = '/venueEntertainment7';

  @override
  State<VenueEntertainment7Widget> createState() =>
      _VenueEntertainment7WidgetState();
}

class _VenueEntertainment7WidgetState extends State<VenueEntertainment7Widget> {
  late VenueEntertainment7Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VenueEntertainment7Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.entertainmentId != null &&
          (widget!.entertainmentId)!.isNotEmpty) {
        _model.entertainmentSelected =
            widget!.entertainmentId!.toList().cast<int>();
        safeSetState(() {});
      } else {
        return;
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
                    'assets/images/entertainment.png',
                  ).image,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(21.0, 0.0, 19.0, 0.0),
                    child: wrapWithModel(
                      model: _model.cHRDAppBar2Model,
                      updateCallback: () => safeSetState(() {}),
                      child: CHRDAppBar2Widget(
                        step: widget!.musicianID != null ? 3 : 5,
                        skip: 'Skip',
                        progressValue: 0.5,
                        hideSkipButton: () {
                          if (widget!.venueId != null) {
                            return true;
                          } else if (widget!.musicianID != null) {
                            return true;
                          } else if (FFAppState().userType == Type.Fan) {
                            return true;
                          } else {
                            return false;
                          }
                        }(),
                        count: widget!.musicianID != null ? 6 : 8,
                        isEdit: () {
                          if (widget!.venueId != null) {
                            return true;
                          } else if (FFAppState().userType == Type.Fan) {
                            return true;
                          } else {
                            return false;
                          }
                        }(),
                        onNavBack: () async {
                          context.safePop();
                        },
                        onSkip: () async {
                          context.pushNamed(VenueGenres8Widget.routeName);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.cHRDLabelColumnTextModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CHRDLabelColumnTextWidget(
                        heading:
                            'Select performance type for${widget!.musicianID != null ? FFAppState().AdminName : FFAppState().vanueName}',
                        subHeading: ' ',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          Duration(milliseconds: 0),
                          () => safeSetState(() {}),
                        ),
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                font: GoogleFonts.montserrat(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).neutralDark500,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                          hintText: 'Search by name',
                          hintStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                font: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).neutralDark500,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  FlutterFlowTheme.of(context).neutralDark900,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  FlutterFlowTheme.of(context).neutralDark900,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).neutralDark900,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 13.0, 0.0, 0.0),
                          prefixIcon: Icon(
                            FontAwesomeIcons.search,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.montserrat(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color:
                                  FlutterFlowTheme.of(context).neutralDark500,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        enableInteractiveSelection: true,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                ]
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
                    Expanded(
                      child: FutureBuilder<ApiCallResponse>(
                        future: VenueGroup.getEntertainmetCall.call(
                          search: _model.textController.text,
                          projectURL: FFDevEnvironmentValues().projectURL,
                          anonKey: FFDevEnvironmentValues().anonKey,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          final gridViewGetEntertainmetResponse =
                              snapshot.data!;

                          return Builder(
                            builder: (context) {
                              final entertainmentList =
                                  gridViewGetEntertainmetResponse.jsonBody
                                      .toList();

                              return GridView.builder(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  30.0,
                                ),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12.0,
                                  mainAxisSpacing: 12.0,
                                  childAspectRatio: 1.4,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: entertainmentList.length,
                                itemBuilder: (context, entertainmentListIndex) {
                                  final entertainmentListItem =
                                      entertainmentList[entertainmentListIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (_model.entertainmentSelected
                                          .contains(getJsonField(
                                        entertainmentListItem,
                                        r'''$.entertainment_id''',
                                      ))) {
                                        _model.removeFromEntertainmentSelected(
                                            getJsonField(
                                          entertainmentListItem,
                                          r'''$.entertainment_id''',
                                        ));
                                        safeSetState(() {});
                                      } else {
                                        _model.addToEntertainmentSelected(
                                            getJsonField(
                                          entertainmentListItem,
                                          r'''$.entertainment_id''',
                                        ));
                                        safeSetState(() {});
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.network(
                                            getJsonField(
                                              entertainmentListItem,
                                              r'''$.entertainment_image''',
                                            ).toString(),
                                          ).image,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                        border: Border.all(
                                          color: _model.entertainmentSelected
                                                  .contains(getJsonField(
                                            entertainmentListItem,
                                            r'''$.entertainment_id''',
                                          ))
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryCyan
                                              : Color(0x00000000),
                                          width: 3.0,
                                        ),
                                      ),
                                      child: Container(
                                        width: 170.0,
                                        height: 120.0,
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -0.8, 0.8),
                                              child: Text(
                                                getJsonField(
                                                  entertainmentListItem,
                                                  r'''$.entertainment_type''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            if (_model.entertainmentSelected
                                                    .contains(getJsonField(
                                              entertainmentListItem,
                                              r'''$.entertainment_id''',
                                            ))
                                                ? true
                                                : false)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.92, -0.92),
                                                child: FlutterFlowIconButton(
                                                  borderRadius: 8.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    FFIcons.kvector3,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 14.0))
                      .addToStart(SizedBox(height: 4.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: wrapWithModel(
                model: _model.cHRDLabelBtnModel,
                updateCallback: () => safeSetState(() {}),
                child: CHRDLabelBtnWidget(
                  heading: widget!.venueId != null ? 'Update' : 'Next',
                  txtColor: FlutterFlowTheme.of(context).primaryText,
                  btnColor: FlutterFlowTheme.of(context).primaryViolet,
                  borderColor: FlutterFlowTheme.of(context).primaryViolet,
                  hight: 45.0,
                  headingFontSize: 14,
                  isDisiable: !(_model.entertainmentSelected.isNotEmpty),
                  onTab: () async {
                    if (widget!.venueId != null) {
                      await VenuesTable().update(
                        data: {
                          'entertainment_id': _model.entertainmentSelected,
                        },
                        matchingRows: (rows) => rows.eqOrNull(
                          'id',
                          widget!.venueId,
                        ),
                      );
                      context.safePop();
                    } else if (widget!.musicianID != null) {
                      await UsersTable().update(
                        data: {
                          'entertainment_id': _model.entertainmentSelected,
                          'step': 3,
                        },
                        matchingRows: (rows) => rows.eqOrNull(
                          'id',
                          FFAppState().userId,
                        ),
                      );

                      context.pushNamed(
                        VenueGenres8Widget.routeName,
                        queryParameters: {
                          'musicianID': serializeParam(
                            FFAppState().userId,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    } else if (FFAppState().userType == Type.Fan) {
                      FFAppState().updateFanUserDataStruct(
                        (e) => e
                          ..fanEntertainmentId =
                              _model.entertainmentSelected.toList(),
                      );
                      safeSetState(() {});

                      context.pushNamed(
                        NavPageWidget.routeName,
                        queryParameters: {
                          'index': serializeParam(
                            0,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    } else {
                      FFAppState().updateVenueAccountCreateStruct(
                        (e) => e
                          ..entertainmentId =
                              _model.entertainmentSelected.toList(),
                      );
                      safeSetState(() {});

                      context.pushNamed(VenueGenres8Widget.routeName);
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
