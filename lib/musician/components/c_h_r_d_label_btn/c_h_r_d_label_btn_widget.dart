import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_h_r_d_label_btn_model.dart';
export 'c_h_r_d_label_btn_model.dart';

class CHRDLabelBtnWidget extends StatefulWidget {
  const CHRDLabelBtnWidget({
    super.key,
    required this.heading,
    required this.txtColor,
    required this.btnColor,
    Color? borderColor,
    required this.hight,
    required this.headingFontSize,
    required this.onTab,
    bool? isDisiable,
  })  : this.borderColor = borderColor ?? const Color(0xFF8B2BE3),
        this.isDisiable = isDisiable ?? false;

  final String? heading;
  final Color? txtColor;
  final Color? btnColor;
  final Color borderColor;
  final double? hight;
  final int? headingFontSize;
  final Future Function()? onTab;
  final bool isDisiable;

  @override
  State<CHRDLabelBtnWidget> createState() => _CHRDLabelBtnWidgetState();
}

class _CHRDLabelBtnWidgetState extends State<CHRDLabelBtnWidget> {
  late CHRDLabelBtnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CHRDLabelBtnModel());

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
      onPressed: widget!.isDisiable
          ? null
          : () async {
              await widget.onTab?.call();
            },
      text: widget!.heading!,
      options: FFButtonOptions(
        width: double.infinity,
        height: widget!.hight,
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: widget!.btnColor,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              font: GoogleFonts.interTight(
                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
              ),
              color: widget!.txtColor,
              fontSize: widget!.headingFontSize?.toDouble(),
              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
            ),
        elevation: 0.0,
        borderRadius: BorderRadius.circular(37.0),
        disabledColor: FlutterFlowTheme.of(context).neutralDark800,
      ),
    );
  }
}
