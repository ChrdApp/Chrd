import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_h_r_d_performance_stages_model.dart';
export 'c_h_r_d_performance_stages_model.dart';

class CHRDPerformanceStagesWidget extends StatefulWidget {
  const CHRDPerformanceStagesWidget({
    super.key,
    required this.venueId,
  });

  final int? venueId;

  @override
  State<CHRDPerformanceStagesWidget> createState() =>
      _CHRDPerformanceStagesWidgetState();
}

class _CHRDPerformanceStagesWidgetState
    extends State<CHRDPerformanceStagesWidget> {
  late CHRDPerformanceStagesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CHRDPerformanceStagesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).neutralDark900,
            borderRadius: BorderRadius.circular(16.0),
          ),
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Stages',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                Expanded(
                  child: FutureBuilder<List<PerformanceStagesRow>>(
                    future: PerformanceStagesTable().queryRows(
                      queryFn: (q) => q.eqOrNull(
                        'venue_id',
                        widget!.venueId,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 40.0,
                            height: 40.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<PerformanceStagesRow>
                          listViewPerformanceStagesRowList = snapshot.data!;

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewPerformanceStagesRowList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewPerformanceStagesRow =
                              listViewPerformanceStagesRowList[listViewIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.selectedName =
                                  listViewPerformanceStagesRow.name;
                              _model.selectedId =
                                  listViewPerformanceStagesRow.id;
                              Navigator.pop(context, <String, dynamic>{
                                'name': _model.selectedName,
                                'id': _model.selectedId,
                              });
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    listViewPerformanceStagesRow.name,
                                    'NA',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: Color(0x19FFFFFF),
                                ),
                              ]
                                  .divide(SizedBox(height: 12.0))
                                  .addToStart(SizedBox(height: 12.0)),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
