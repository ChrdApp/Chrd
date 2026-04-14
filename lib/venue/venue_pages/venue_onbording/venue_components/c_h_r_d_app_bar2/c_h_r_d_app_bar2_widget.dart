import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_label_skip_btn/c_h_r_d_label_skip_btn_widget.dart';
import '/musician/components/c_h_r_d_progress_bar/c_h_r_d_progress_bar_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_h_r_d_app_bar2_model.dart';
export 'c_h_r_d_app_bar2_model.dart';

class CHRDAppBar2Widget extends StatefulWidget {
  const CHRDAppBar2Widget({
    super.key,
    this.step,
    required this.onNavBack,
    this.onSkip,
    this.skip,
    this.progressValue,
    bool? hideSkipButton,
    this.count,
    bool? isEdit,
  })  : this.hideSkipButton = hideSkipButton ?? false,
        this.isEdit = isEdit ?? false;

  final int? step;
  final Future Function()? onNavBack;
  final Future Function()? onSkip;
  final String? skip;
  final double? progressValue;
  final bool hideSkipButton;
  final int? count;
  final bool isEdit;

  @override
  State<CHRDAppBar2Widget> createState() => _CHRDAppBar2WidgetState();
}

class _CHRDAppBar2WidgetState extends State<CHRDAppBar2Widget> {
  late CHRDAppBar2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CHRDAppBar2Model());

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
      child: Stack(
        alignment: AlignmentDirectional(0.0, 0.0),
        children: [
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: wrapWithModel(
              model: _model.cHRDBackBtnModel,
              updateCallback: () => safeSetState(() {}),
              child: CHRDBackBtnWidget(
                icon: Icon(
                  Icons.arrow_back_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                btnAction: () async {
                  await widget.onNavBack?.call();
                },
              ),
            ),
          ),
          if (!widget!.isEdit)
            Align(
              alignment: AlignmentDirectional(-0.2, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Step ${widget!.step?.toString()} of ${valueOrDefault<String>(
                        widget!.count?.toString(),
                        '9',
                      )}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    Container(
                      width: 170.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: wrapWithModel(
                        model: _model.cHRDProgressBarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: CHRDProgressBarWidget(
                          progressValue: widget!.progressValue!,
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 6.0)),
                ),
              ),
            ),
          if (widget!.hideSkipButton == false)
            Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: wrapWithModel(
                model: _model.cHRDLabelSkipBtnModel,
                updateCallback: () => safeSetState(() {}),
                child: CHRDLabelSkipBtnWidget(
                  heading: 'Skip',
                  onTabAction: () async {
                    await widget.onSkip?.call();
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
