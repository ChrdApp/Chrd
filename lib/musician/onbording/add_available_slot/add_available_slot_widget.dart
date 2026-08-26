import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_app_bar2/c_h_r_d_app_bar2_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_available_slot_model.dart';
export 'add_available_slot_model.dart';

class AddAvailableSlotWidget extends StatefulWidget {
  const AddAvailableSlotWidget({super.key});

  static String routeName = 'add_available_slot';
  static String routePath = '/addAvailableSlot';

  @override
  State<AddAvailableSlotWidget> createState() => _AddAvailableSlotWidgetState();
}

class _AddAvailableSlotWidgetState extends State<AddAvailableSlotWidget> {
  late AddAvailableSlotModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddAvailableSlotModel());

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
                    'assets/images/open_slot_show.png',
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
                        step: 7,
                        skip: 'Skip',
                        progressValue: 0.875,
                        hideSkipButton: false,
                        count: 8,
                        onNavBack: () async {
                          context.safePop();
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.cHRDLabelColumnTextModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CHRDLabelColumnTextWidget(
                        heading: 'Add open slots for ${FFAppState().vanueName}',
                        subHeading:
                            'Add open event dates and details  Can add or edit in profile.',
                      ),
                    ),
                  ),
                ]
                    .addToStart(SizedBox(height: 56.0))
                    .addToEnd(SizedBox(height: 20.0)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context
                                .pushNamed(AddAvailableSlotsWidget.routeName);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 102.0,
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).neutralDark900,
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.add_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 50.0,
                                ),
                                Text(
                                  'Add',
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
                                            .neutralLight300,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ]
                                  .divide(SizedBox(height: 6.25))
                                  .addToStart(SizedBox(height: 14.0)),
                            ),
                          ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 14.0))
                        .addToStart(SizedBox(height: 4.0))
                        .addToEnd(SizedBox(height: 18.0)),
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
                    await UsersTable().update(
                      data: {
                        'step': 5,
                      },
                      matchingRows: (rows) => rows.eqOrNull(
                        'id',
                        FFAppState().userId,
                      ),
                    );
                    FFAppState().step = 5;
                    safeSetState(() {});

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
