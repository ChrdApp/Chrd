import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_h_r_d_remove_musician_model.dart';
export 'c_h_r_d_remove_musician_model.dart';

class CHRDRemoveMusicianWidget extends StatefulWidget {
  const CHRDRemoveMusicianWidget({
    super.key,
    required this.musicianName,
    required this.removeBtnAction,
  });

  final String? musicianName;
  final Future Function()? removeBtnAction;

  @override
  State<CHRDRemoveMusicianWidget> createState() =>
      _CHRDRemoveMusicianWidgetState();
}

class _CHRDRemoveMusicianWidgetState extends State<CHRDRemoveMusicianWidget> {
  late CHRDRemoveMusicianModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CHRDRemoveMusicianModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).neutralDark800,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(21.0, 0.0, 20.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Are you sure you want to remove ${widget!.musicianName} from this gig?:',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.montserrat(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.56, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: wrapWithModel(
                      model: _model.cHRDLabelBtnModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: CHRDLabelBtnWidget(
                        heading: 'Cancel',
                        txtColor: FlutterFlowTheme.of(context).primaryText,
                        btnColor: FlutterFlowTheme.of(context).primaryViolet,
                        borderColor: FlutterFlowTheme.of(context).primaryViolet,
                        hight: 32.83,
                        headingFontSize: 14,
                        isDisiable: false,
                        onTab: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: wrapWithModel(
                      model: _model.cHRDLabelBtnModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: CHRDLabelBtnWidget(
                        heading: 'Remove',
                        txtColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        btnColor: FlutterFlowTheme.of(context).primaryText,
                        borderColor: FlutterFlowTheme.of(context).primaryText,
                        hight: 32.83,
                        headingFontSize: 14,
                        isDisiable: false,
                        onTab: () async {
                          await widget.removeBtnAction?.call();
                        },
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 10.0)),
              ),
            ),
          ]
              .divide(SizedBox(height: 5.79))
              .addToStart(SizedBox(height: 32.83))
              .addToEnd(SizedBox(height: 29.94)),
        ),
      ),
    );
  }
}
