import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_list_image_widget.dart';
import '/components/loader_placeholder_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_h_r_d_switching_venue_in_messages_model.dart';
export 'c_h_r_d_switching_venue_in_messages_model.dart';

class CHRDSwitchingVenueInMessagesWidget extends StatefulWidget {
  const CHRDSwitchingVenueInMessagesWidget({
    super.key,
    required this.callBackAction,
  });

  final Future Function()? callBackAction;

  @override
  State<CHRDSwitchingVenueInMessagesWidget> createState() =>
      _CHRDSwitchingVenueInMessagesWidgetState();
}

class _CHRDSwitchingVenueInMessagesWidgetState
    extends State<CHRDSwitchingVenueInMessagesWidget> {
  late CHRDSwitchingVenueInMessagesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CHRDSwitchingVenueInMessagesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/Rectangle_4495.png',
            ).image,
          ),
          gradient: LinearGradient(
            colors: [Color(0x89030303), Color(0xFF030303)],
            stops: [0.6, 1.0],
            begin: AlignmentDirectional(0.0, -1.0),
            end: AlignmentDirectional(0, 1.0),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        alignment: AlignmentDirectional(0.0, 1.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 8.5, 20.0, 25.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 59.0,
                height: 3.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: FutureBuilder<List<VenuesRow>>(
                  future: VenuesTable().queryRows(
                    queryFn: (q) => q.eqOrNull(
                      'created_by',
                      FFAppState().userId,
                    ),
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
                    List<VenuesRow> listViewVenuesRowList = snapshot.data!;

                    if (listViewVenuesRowList.isEmpty) {
                      return Center(
                        child: EmptyListImageWidget(
                          msg: 'No Venues available',
                        ),
                      );
                    }

                    return ListView.separated(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        32.5,
                        0,
                        0,
                      ),
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewVenuesRowList.length,
                      separatorBuilder: (_, __) => SizedBox(height: 4.0),
                      itemBuilder: (context, listViewIndex) {
                        final listViewVenuesRow =
                            listViewVenuesRowList[listViewIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            FFAppState().updateSelectedVenueSwitchStruct(
                              (e) => e
                                ..venueId = listViewVenuesRow.id
                                ..venueName = listViewVenuesRow.name,
                            );
                            FFAppState().update(() {});
                            await widget.callBackAction?.call();
                          },
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
                                stops: [0.0, 0.3, 0.4, 0.5, 0.6, 0.7, 1.0],
                                begin: AlignmentDirectional(0.0, -1.0),
                                end: AlignmentDirectional(0, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(valueOrDefault<double>(
                                FFAppState().selectedVenueSwitch.venueId ==
                                        listViewVenuesRow.id
                                    ? 2.0
                                    : 0.0,
                                0.0,
                              )),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF1C2738),
                                          Color(0xFF23162E)
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(0.0, -1.0),
                                        end: AlignmentDirectional(0, 1.0),
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: _model.isSelected
                                            ? Color(0xFF20A7D4)
                                            : Color(0x00000000),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.8),
                                            child: Container(
                                              width: 52.0,
                                              height: 52.0,
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
                                                  stops: [
                                                    0.0,
                                                    0.3,
                                                    0.4,
                                                    0.5,
                                                    0.6,
                                                    0.7,
                                                    1.0
                                                  ],
                                                  begin: AlignmentDirectional(
                                                      -1.0, 0.0),
                                                  end: AlignmentDirectional(
                                                      1.0, 0),
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      listViewVenuesRow
                                                          .venuePhoto!,
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.jpg',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  listViewVenuesRow.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16.0,
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
                                                Text(
                                                  listViewVenuesRow.address!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                          ),
                                          FutureBuilder<List<GigsRow>>(
                                            future: GigsTable().queryRows(
                                              queryFn: (q) => q.eqOrNull(
                                                'venue_id',
                                                listViewVenuesRow.id,
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return LoaderPlaceholderWidget();
                                              }
                                              List<GigsRow>
                                                  containerGigsRowList =
                                                  snapshot.data!;

                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: Visibility(
                                                  visible: containerGigsRowList
                                                          .where((e) => e
                                                              .hasAnyThreadMessageUnread!)
                                                          .toList()
                                                          .length !=
                                                      0,
                                                  child: Container(
                                                    width: 12.0,
                                                    height: 12.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryCyan,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
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
                ),
              ),
              wrapWithModel(
                model: _model.cHRDLabelBtnModel,
                updateCallback: () => safeSetState(() {}),
                child: CHRDLabelBtnWidget(
                  heading: 'Manage Venues',
                  txtColor: FlutterFlowTheme.of(context).primaryText,
                  btnColor: FlutterFlowTheme.of(context).primaryViolet,
                  borderColor: FlutterFlowTheme.of(context).primaryViolet,
                  hight: 45.0,
                  headingFontSize: 14,
                  isDisiable: false,
                  onTab: () async {
                    context.pushNamed(
                      NavPageWidget.routeName,
                      queryParameters: {
                        'index': serializeParam(
                          4,
                          ParamType.int,
                        ),
                      }.withoutNulls,
                    );
                  },
                ),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
