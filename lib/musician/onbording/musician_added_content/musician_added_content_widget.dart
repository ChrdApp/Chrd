import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_app_bar2/c_h_r_d_app_bar2_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'musician_added_content_model.dart';
export 'musician_added_content_model.dart';

class MusicianAddedContentWidget extends StatefulWidget {
  const MusicianAddedContentWidget({super.key});

  static String routeName = 'musician_added_content';
  static String routePath = '/musicianAddedContent';

  @override
  State<MusicianAddedContentWidget> createState() =>
      _MusicianAddedContentWidgetState();
}

class _MusicianAddedContentWidgetState
    extends State<MusicianAddedContentWidget> {
  late MusicianAddedContentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MusicianAddedContentModel());

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
                    'assets/images/add_contant.png',
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
                        step: 4,
                        skip: 'Skip',
                        progressValue: 0.5,
                        hideSkipButton: _model.hideSkipButton,
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
                        heading: 'Add content ',
                        subHeading:
                            'Upload photos or videos to showcase your talent. Highlight your best moments and make your profile stand out.',
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: GridView(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 1.0,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-0.27, 0.24),
                            child: Container(
                              width: 110.0,
                              height: 120.0,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).neutralDark900,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(1.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 4.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 100.0,
                                        buttonSize: 32.0,
                                        fillColor: Color(0x8D000000),
                                        icon: Icon(
                                          Icons.close,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 16.0,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.video,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 40.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 14.0))
                      .addToStart(SizedBox(height: 20.0)),
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
                  isDisiable: FFAppState().venueContentVenueList.length <= 1,
                  onTab: () async {},
                ),
              ),
            ),
          ].addToEnd(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
