import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_h_r_d_dropdown_model.dart';
export 'c_h_r_d_dropdown_model.dart';

class CHRDDropdownWidget extends StatefulWidget {
  const CHRDDropdownWidget({
    super.key,
    required this.hint,
    required this.initialValue,
    this.defineOptions,
  });

  final String? hint;
  final String? initialValue;
  final List<String>? defineOptions;

  @override
  State<CHRDDropdownWidget> createState() => _CHRDDropdownWidgetState();
}

class _CHRDDropdownWidgetState extends State<CHRDDropdownWidget> {
  late CHRDDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CHRDDropdownModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowDropDown<String>(
      controller: _model.dropDownValueController ??=
          FormFieldController<String>(
        _model.dropDownValue ??= widget!.initialValue,
      ),
      options: widget!.defineOptions!,
      onChanged: (val) => safeSetState(() => _model.dropDownValue = val),
      width: 103.0,
      height: 40.0,
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            font: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
            color: FlutterFlowTheme.of(context).primaryText,
            fontSize: 12.0,
            letterSpacing: 0.0,
            fontWeight: FontWeight.w600,
            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
          ),
      hintText: widget!.hint,
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: FlutterFlowTheme.of(context).neutralDark500,
        size: 24.0,
      ),
      fillColor: FlutterFlowTheme.of(context).neutralDark800,
      elevation: 2.0,
      borderColor: Colors.transparent,
      borderWidth: 0.0,
      borderRadius: 8.0,
      margin: EdgeInsetsDirectional.fromSTEB(11.0, 0.0, 11.0, 0.0),
      hidesUnderline: true,
      isOverButton: false,
      isSearchable: false,
      isMultiSelect: false,
    );
  }
}
