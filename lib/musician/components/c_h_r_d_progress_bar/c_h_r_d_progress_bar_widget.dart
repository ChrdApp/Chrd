import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'c_h_r_d_progress_bar_model.dart';
export 'c_h_r_d_progress_bar_model.dart';

class CHRDProgressBarWidget extends StatefulWidget {
  const CHRDProgressBarWidget({
    super.key,
    required this.progressValue,
  });

  final double? progressValue;

  @override
  State<CHRDProgressBarWidget> createState() => _CHRDProgressBarWidgetState();
}

class _CHRDProgressBarWidgetState extends State<CHRDProgressBarWidget> {
  late CHRDProgressBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CHRDProgressBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      percent: widget!.progressValue!,
      lineHeight: 4.0,
      animation: true,
      animateFromLastPercent: true,
      progressColor: FlutterFlowTheme.of(context).primaryText,
      backgroundColor: Color(0x56D9D9D9),
      barRadius: Radius.circular(22.0),
      padding: EdgeInsets.zero,
    );
  }
}
