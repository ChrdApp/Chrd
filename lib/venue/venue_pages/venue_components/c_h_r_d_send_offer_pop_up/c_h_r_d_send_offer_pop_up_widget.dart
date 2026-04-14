import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_h_r_d_send_offer_pop_up_model.dart';
export 'c_h_r_d_send_offer_pop_up_model.dart';

class CHRDSendOfferPopUpWidget extends StatefulWidget {
  const CHRDSendOfferPopUpWidget({
    super.key,
    required this.image,
    required this.offerBtnAction,
    required this.musicianName,
  });

  final String? image;
  final Future Function()? offerBtnAction;
  final String? musicianName;

  @override
  State<CHRDSendOfferPopUpWidget> createState() =>
      _CHRDSendOfferPopUpWidgetState();
}

class _CHRDSendOfferPopUpWidgetState extends State<CHRDSendOfferPopUpWidget> {
  late CHRDSendOfferPopUpModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CHRDSendOfferPopUpModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).neutralDark800,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 34.0, 20.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(38.0, 0.0, 24.0, 0.0),
                child: Text(
                  'Are you sure you want to start an offer to:',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.montserrat(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.5, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.8),
                      child: Container(
                        width: 46.0,
                        height: 46.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF01CDD0),
                              Color(0xFF04C8D0),
                              Color(0xFF0EBCD1),
                              Color(0xFF20A7D4),
                              Color(0xFF3A89D8),
                              Color(0xFF6951DC),
                              Color(0xFF8D28E3)
                            ],
                            stops: [0.0, 0.3, 0.4, 0.5, 0.6, 0.7, 1.0],
                            begin: AlignmentDirectional(-1.0, 0.0),
                            end: AlignmentDirectional(1.0, 0),
                          ),
                          shape: BoxShape.circle,
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: 44.0,
                          height: 44.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            valueOrDefault<String>(
                              widget!.image,
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ--u2TdcxqgeVhgSwJeJMr9Zrp45l4GIJXkg&s',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget!.musicianName!,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ].divide(SizedBox(height: 6.0)),
                    ),
                  ].divide(SizedBox(width: 10.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 34.5, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: wrapWithModel(
                          model: _model.cHRDLabelBtnModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: CHRDLabelBtnWidget(
                            heading: 'Cancel',
                            txtColor: FlutterFlowTheme.of(context).primaryText,
                            btnColor:
                                FlutterFlowTheme.of(context).primaryViolet,
                            borderColor:
                                FlutterFlowTheme.of(context).primaryViolet,
                            hight: 34.0,
                            headingFontSize: 14,
                            isDisiable: false,
                            onTab: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: wrapWithModel(
                        model: _model.cHRDLabelBtnModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: CHRDLabelBtnWidget(
                          heading: 'Offer',
                          txtColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          btnColor: FlutterFlowTheme.of(context).primaryText,
                          borderColor: FlutterFlowTheme.of(context).primaryText,
                          hight: 34.0,
                          headingFontSize: 14,
                          isDisiable: false,
                          onTab: () async {
                            await widget.offerBtnAction?.call();
                          },
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 10.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
