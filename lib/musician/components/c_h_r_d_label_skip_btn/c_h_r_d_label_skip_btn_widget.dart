import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_h_r_d_label_skip_btn_model.dart';
export 'c_h_r_d_label_skip_btn_model.dart';

class CHRDLabelSkipBtnWidget extends StatefulWidget {
  const CHRDLabelSkipBtnWidget({
    super.key,
    required this.heading,
    this.onTabAction,
  });

  final String? heading;
  final Future Function()? onTabAction;

  @override
  State<CHRDLabelSkipBtnWidget> createState() => _CHRDLabelSkipBtnWidgetState();
}

class _CHRDLabelSkipBtnWidgetState extends State<CHRDLabelSkipBtnWidget> {
  late CHRDLabelSkipBtnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CHRDLabelSkipBtnModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        await widget.onTabAction?.call();
      },
      text: widget!.heading!,
      icon: Icon(
        Icons.arrow_forward_ios_sharp,
        size: 16.0,
      ),
      options: FFButtonOptions(
        height: 30.0,
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 8.0, 0.0),
        iconAlignment: IconAlignment.end,
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        iconColor: FlutterFlowTheme.of(context).primaryText,
        color: Color(0x5F000000),
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              font: GoogleFonts.interTight(
                fontWeight: FontWeight.normal,
                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
              ),
              color: FlutterFlowTheme.of(context).neutralLight300,
              fontSize: 14.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.normal,
              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
            ),
        elevation: 0.0,
        borderRadius: BorderRadius.circular(21.0),
      ),
    );
  }
}
