import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'c_h_r_d_phone_number_model.dart';
export 'c_h_r_d_phone_number_model.dart';

class CHRDPhoneNumberWidget extends StatefulWidget {
  const CHRDPhoneNumberWidget({
    super.key,
    required this.onChange,
    bool? freezeMobileInput,
    this.initialValue,
  }) : this.freezeMobileInput = freezeMobileInput ?? false;

  final Future Function()? onChange;
  final bool freezeMobileInput;
  final String? initialValue;

  @override
  State<CHRDPhoneNumberWidget> createState() => _CHRDPhoneNumberWidgetState();
}

class _CHRDPhoneNumberWidgetState extends State<CHRDPhoneNumberWidget> {
  late CHRDPhoneNumberModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CHRDPhoneNumberModel());

    _model.phoneNumberTextController ??= TextEditingController(
        text: functions.formatUSNumber(widget!.initialValue));
    _model.phoneNumberFocusNode ??= FocusNode();

    _model.phoneNumberMask = MaskTextInputFormatter(mask: '+# (###) ###-####');
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
      height: 58.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).neutralDark900,
        borderRadius: BorderRadius.circular(12.0),
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 24.0,
                height: 24.0,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/Group.png',
                  fit: BoxFit.cover,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: FlutterFlowTheme.of(context).neutralLight300,
                size: 24.0,
              ),
            ].divide(SizedBox(width: 2.0)),
          ),
          SizedBox(
            height: 40.0,
            child: VerticalDivider(
              thickness: 1.0,
              color: Color(0xFFE2E4E8),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
              child: Container(
                width: double.infinity,
                child: TextFormField(
                  controller: _model.phoneNumberTextController,
                  focusNode: _model.phoneNumberFocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.phoneNumberTextController',
                    Duration(milliseconds: 0),
                    () async {
                      await widget.onChange?.call();
                    },
                  ),
                  autofocus: false,
                  enabled: widget!.freezeMobileInput,
                  textInputAction: TextInputAction.next,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Phone Number',
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              font: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontStyle,
                            ),
                    hintText: '+1  (207) 555-0119',
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              font: GoogleFonts.montserrat(
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                              color: Color(0x8CFFFFFF),
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontStyle,
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
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  keyboardType: TextInputType.number,
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  enableInteractiveSelection: true,
                  validator: _model.phoneNumberTextControllerValidator
                      .asValidator(context),
                  inputFormatters: [_model.phoneNumberMask],
                ),
              ),
            ),
          ),
        ].addToStart(SizedBox(width: 10.0)),
      ),
    );
  }
}
