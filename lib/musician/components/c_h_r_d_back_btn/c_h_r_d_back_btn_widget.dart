import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_h_r_d_back_btn_model.dart';
export 'c_h_r_d_back_btn_model.dart';

class CHRDBackBtnWidget extends StatefulWidget {
  const CHRDBackBtnWidget({
    super.key,
    required this.btnAction,
    this.icon,
  });

  final Future Function()? btnAction;
  final Widget? icon;

  @override
  State<CHRDBackBtnWidget> createState() => _CHRDBackBtnWidgetState();
}

class _CHRDBackBtnWidgetState extends State<CHRDBackBtnWidget> {
  late CHRDBackBtnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CHRDBackBtnModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowIconButton(
      borderRadius: 100.0,
      buttonSize: 42.0,
      fillColor: Color(0x2CFFFFFF),
      icon: widget!.icon!,
      onPressed: () async {
        await widget.btnAction?.call();
      },
    );
  }
}
