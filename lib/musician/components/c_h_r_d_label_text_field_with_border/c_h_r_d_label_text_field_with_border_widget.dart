import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_h_r_d_label_text_field_with_border_model.dart';
export 'c_h_r_d_label_text_field_with_border_model.dart';

class CHRDLabelTextFieldWithBorderWidget extends StatefulWidget {
  const CHRDLabelTextFieldWithBorderWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.onChange,
    bool? freezeEmailInput,
  }) : this.freezeEmailInput = freezeEmailInput ?? true;

  final String? labelText;
  final String? hintText;
  final Future Function()? onChange;
  final bool freezeEmailInput;

  @override
  State<CHRDLabelTextFieldWithBorderWidget> createState() =>
      _CHRDLabelTextFieldWithBorderWidgetState();
}

class _CHRDLabelTextFieldWithBorderWidgetState
    extends State<CHRDLabelTextFieldWithBorderWidget> {
  late CHRDLabelTextFieldWithBorderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CHRDLabelTextFieldWithBorderModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => safeSetState(() {}));
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
        color: FlutterFlowTheme.of(context).neutralDark900,
        borderRadius: BorderRadius.circular(12.0),
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(2.0, 9.5, 2.0, 9.5),
        child: Container(
          width: double.infinity,
          child: TextFormField(
            controller: _model.textController,
            focusNode: _model.textFieldFocusNode,
            onChanged: (_) => EasyDebounce.debounce(
              '_model.textController',
              Duration(milliseconds: 0),
              () async {
                await widget.onChange?.call();
              },
            ),
            autofocus: false,
            enabled: widget!.freezeEmailInput,
            textInputAction: TextInputAction.next,
            obscureText: false,
            decoration: InputDecoration(
              isDense: true,
              labelText: widget!.labelText,
              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    font: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelMedium.fontStyle,
                  ),
              hintText: widget!.hintText,
              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    font: GoogleFonts.montserrat(
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
                    color: Color(0x8BFFFFFF),
                    fontSize: 13.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelMedium.fontStyle,
                  ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              filled: true,
              fillColor: FlutterFlowTheme.of(context).neutralDark900,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
            maxLines: null,
            cursorColor: FlutterFlowTheme.of(context).primaryText,
            enableInteractiveSelection: true,
            validator: _model.textControllerValidator.asValidator(context),
          ),
        ),
      ),
    );
  }
}
