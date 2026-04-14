import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_h_r_d_label_invit_user_model.dart';
export 'c_h_r_d_label_invit_user_model.dart';

class CHRDLabelInvitUserWidget extends StatefulWidget {
  const CHRDLabelInvitUserWidget({
    super.key,
    required this.heading,
    this.onTap,
  });

  final String? heading;
  final Future Function()? onTap;

  @override
  State<CHRDLabelInvitUserWidget> createState() =>
      _CHRDLabelInvitUserWidgetState();
}

class _CHRDLabelInvitUserWidgetState extends State<CHRDLabelInvitUserWidget> {
  late CHRDLabelInvitUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CHRDLabelInvitUserModel());

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
        await widget.onTap?.call();
      },
      text: widget!.heading!,
      icon: Icon(
        FFIcons.kframe,
        size: 16.0,
      ),
      options: FFButtonOptions(
        height: 30.0,
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 10.0, 0.0),
        iconAlignment: IconAlignment.end,
        iconPadding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
        iconColor: FlutterFlowTheme.of(context).primaryText,
        color: Color(0x4D8B2BE3),
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
