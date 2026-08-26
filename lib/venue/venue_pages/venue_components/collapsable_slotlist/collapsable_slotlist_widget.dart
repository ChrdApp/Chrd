import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'collapsable_slotlist_model.dart';
export 'collapsable_slotlist_model.dart';

class CollapsableSlotlistWidget extends StatefulWidget {
  const CollapsableSlotlistWidget({
    super.key,
    required this.stageJson,
  });

  final dynamic stageJson;

  @override
  State<CollapsableSlotlistWidget> createState() =>
      _CollapsableSlotlistWidgetState();
}

class _CollapsableSlotlistWidgetState extends State<CollapsableSlotlistWidget> {
  late CollapsableSlotlistModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CollapsableSlotlistModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 19.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0x26FFFFFF),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(9.0, 7.0, 11.0, 8.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (_model.isExpanded) {
                    _model.isExpanded = false;
                    safeSetState(() {});
                    return;
                  } else {
                    _model.isExpanded = true;
                    safeSetState(() {});
                    return;
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 59.0,
                  decoration: BoxDecoration(
                    color: Color(0x47000000),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 4.47, 0.0, 4.47),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                31.0, 0.0, 0.0, 0.0),
                            child: Text(
                              getJsonField(
                                widget!.stageJson,
                                r'''$.stage_name''',
                              ).toString(),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                          child: VerticalDivider(
                            thickness: 1.0,
                            color: Color(0x0AFFFFFF),
                          ),
                        ),
                        if (!_model.isExpanded)
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        if (_model.isExpanded)
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                      ]
                          .addToStart(SizedBox(width: 6.0))
                          .addToEnd(SizedBox(width: 11.0)),
                    ),
                  ),
                ),
              ),
            ),
            if (_model.isExpanded)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 11.0, 8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0x47000000),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        21.33, 18.0, 18.13, 18.0),
                    child: Builder(
                      builder: (context) {
                        final slotsList = getJsonField(
                          widget!.stageJson,
                          r'''$.slots''',
                        ).toList();

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: slotsList.length,
                          separatorBuilder: (_, __) => SizedBox(height: 21.0),
                          itemBuilder: (context, slotsListIndex) {
                            final slotsListItem = slotsList[slotsListIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().updateGigOfferStruct(
                                  (e) => e
                                    ..slotId = getJsonField(
                                      slotsListItem,
                                      r'''$.slot_id''',
                                    ),
                                );
                                safeSetState(() {});
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if ('${FFAppState().gigOffer.slotId.toString()}' !=
                                          getJsonField(
                                            slotsListItem,
                                            r'''$.slot_id''',
                                          ).toString())
                                        Icon(
                                          Icons.radio_button_off,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryViolet,
                                          size: 24.0,
                                        ),
                                      if ('${FFAppState().gigOffer.slotId.toString()}' ==
                                          getJsonField(
                                            slotsListItem,
                                            r'''$.slot_id''',
                                          ).toString())
                                        Icon(
                                          Icons.radio_button_checked_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryViolet,
                                          size: 24.0,
                                        ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        getJsonField(
                                          slotsListItem,
                                          r'''$.start_date''',
                                        ).toString(),
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
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        '${getJsonField(
                                          slotsListItem,
                                          r'''$.start_time''',
                                        ).toString()} - ${getJsonField(
                                          slotsListItem,
                                          r'''$.end_time''',
                                        ).toString()}',
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
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ].divide(SizedBox(width: 16.0)),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
