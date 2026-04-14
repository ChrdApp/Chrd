import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_text_field_number/c_h_r_d_label_text_field_number_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_with_border/c_h_r_d_label_text_field_with_border_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_phone_no_venue/c_h_r_d_phone_no_venue_widget.dart';
import 'dart:ui';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_model.dart';
export 'test_model.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  static String routeName = 'test';
  static String routePath = '/test';

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  late TestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestModel());

    _model.descriptionTextController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            child: Text(
              'Current Location',
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    font: GoogleFonts.montserrat(
                      fontWeight:
                          FlutterFlowTheme.of(context).labelMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).labelMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelMedium.fontStyle,
                  ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 16.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                icon: Icon(
                  Icons.notifications_none,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.vanueNameModel,
                    updateCallback: () => safeSetState(() {}),
                    child: CHRDLabelTextFieldWithBorderWidget(
                      labelText: 'Venue Name',
                      hintText: 'LIV Nightclub',
                      onChange: () async {
                        safeSetState(() {});
                      },
                    ),
                  ),
                  wrapWithModel(
                    model: _model.addressModel,
                    updateCallback: () => safeSetState(() {}),
                    child: CHRDLabelTextFieldWithBorderWidget(
                      labelText: 'Address',
                      hintText: '4441 Collins Ave, Miami Beach, FL 33140, USA',
                      onChange: () async {
                        safeSetState(() {});
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).neutralDark900,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.descriptionTextController,
                            focusNode: _model.descriptionFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.descriptionTextController',
                              Duration(milliseconds: 0),
                              () => safeSetState(() {}),
                            ),
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Description',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                              hintText:
                                  'Liv Nightclub is committed to providing a website that is accessible to all users, including those with visual impairments. As part of this commitment, our website has been designed to conform to the requirements of Section 508 of the U.S. Rehabilitation Act as amended and endeavors to conform to the World Wide Web Consortium (W3C) Web Content Accessibility Guidelines 2.0 AA. These guidelines explain how to make web content more accessible for people with disabilities. If you would like additional assistance or have accessibility concerns,',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0x8DFFFFFF),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              filled: true,
                              fillColor:
                                  FlutterFlowTheme.of(context).neutralDark900,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            maxLines: 3,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            enableInteractiveSelection: true,
                            validator: _model.descriptionTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.venueCapacityModel,
                    updateCallback: () => safeSetState(() {}),
                    child: CHRDLabelTextFieldNumberWidget(
                      labelText: 'Venue Capacity',
                      hintText: 'Enter the venue capacity',
                      onChange: () async {
                        safeSetState(() {});
                      },
                    ),
                  ),
                  wrapWithModel(
                    model: _model.agePolicyModel,
                    updateCallback: () => safeSetState(() {}),
                    child: CHRDLabelTextFieldNumberWidget(
                      labelText: 'Age policy',
                      hintText: 'Enter the minimum age',
                      onChange: () async {
                        safeSetState(() {});
                      },
                    ),
                  ),
                  wrapWithModel(
                    model: _model.hoursOperationModel,
                    updateCallback: () => safeSetState(() {}),
                    child: CHRDLabelTextFieldNumberWidget(
                      labelText: 'Hours Of Operation',
                      hintText: 'Simple weekly hours',
                      onChange: () async {
                        safeSetState(() {});
                      },
                    ),
                  ),
                  wrapWithModel(
                    model: _model.amenitiesModel,
                    updateCallback: () => safeSetState(() {}),
                    child: CHRDLabelTextFieldWithBorderWidget(
                      labelText: 'Amenities',
                      hintText: 'Parking, Safety, Party Stage, Outdoor Spaces',
                      freezeEmailInput: true,
                      onChange: () async {
                        safeSetState(() {});
                      },
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).neutralDark900,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                    child: Text(
                      'Contact Details',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.cHRDPhoneNoVenueModel,
                    updateCallback: () => safeSetState(() {}),
                    child: CHRDPhoneNoVenueWidget(
                      phoneValue: '',
                      onChange: () async {
                        safeSetState(() {});
                      },
                    ),
                  ),
                  wrapWithModel(
                    model: _model.emailModel,
                    updateCallback: () => safeSetState(() {}),
                    child: CHRDLabelTextFieldWithBorderWidget(
                      labelText: 'Email',
                      hintText: 'info@livnightclub.com',
                      onChange: () async {
                        safeSetState(() {});
                      },
                    ),
                  ),
                  wrapWithModel(
                    model: _model.websiteModel,
                    updateCallback: () => safeSetState(() {}),
                    child: CHRDLabelTextFieldWithBorderWidget(
                      labelText: 'Website',
                      hintText: 'https://liv.com',
                      freezeEmailInput: false,
                      onChange: () async {
                        safeSetState(() {});
                      },
                    ),
                  ),
                ]
                    .divide(SizedBox(height: 14.0))
                    .addToEnd(SizedBox(height: 28.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
