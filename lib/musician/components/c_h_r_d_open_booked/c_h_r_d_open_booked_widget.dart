import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_h_r_d_open_booked_model.dart';
export 'c_h_r_d_open_booked_model.dart';

class CHRDOpenBookedWidget extends StatefulWidget {
  const CHRDOpenBookedWidget({
    super.key,
    required this.heading,
    required this.backcolor,
    required this.iconColor,
  });

  final String? heading;
  final Color? backcolor;
  final Color? iconColor;

  @override
  State<CHRDOpenBookedWidget> createState() => _CHRDOpenBookedWidgetState();
}

class _CHRDOpenBookedWidgetState extends State<CHRDOpenBookedWidget> {
  late CHRDOpenBookedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CHRDOpenBookedModel());

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
      height: 22.0,
      decoration: BoxDecoration(
        color: widget!.backcolor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Icons.circle_sharp,
            color: widget!.iconColor,
            size: 10.0,
          ),
          Text(
            valueOrDefault<String>(
              widget!.heading,
              'h',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 10.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
        ]
            .divide(SizedBox(width: 4.0))
            .addToStart(SizedBox(width: 7.0))
            .addToEnd(SizedBox(width: 7.0)),
      ),
    );
  }
}
