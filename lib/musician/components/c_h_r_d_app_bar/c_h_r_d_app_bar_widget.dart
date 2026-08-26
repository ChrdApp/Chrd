import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_h_r_d_app_bar_model.dart';
export 'c_h_r_d_app_bar_model.dart';

class CHRDAppBarWidget extends StatefulWidget {
  const CHRDAppBarWidget({
    super.key,
    required this.heading,
    required this.btnAction,
  });

  final String? heading;
  final Future Function()? btnAction;

  @override
  State<CHRDAppBarWidget> createState() => _CHRDAppBarWidgetState();
}

class _CHRDAppBarWidgetState extends State<CHRDAppBarWidget> {
  late CHRDAppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CHRDAppBarModel());

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
      height: 57.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).appBarClr,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
            onPressed: () async {
              await widget.btnAction?.call();
            },
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget!.heading,
                    'back',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ],
            ),
          ),
        ].addToStart(SizedBox(width: 24.0)),
      ),
    );
  }
}
