import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_number/c_h_r_d_label_text_field_number_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_with_border/c_h_r_d_label_text_field_with_border_widget.dart';
import '/musician/components/c_h_r_d_progress_bar/c_h_r_d_progress_bar_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_phone_no_venue/c_h_r_d_phone_no_venue_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'venue_account_info3_model.dart';
export 'venue_account_info3_model.dart';

class VenueAccountInfo3Widget extends StatefulWidget {
  const VenueAccountInfo3Widget({
    super.key,
    this.venueId,
    bool? isEdit,
  }) : this.isEdit = isEdit ?? false;

  final int? venueId;
  final bool isEdit;

  static String routeName = 'venue_account_info3';
  static String routePath = '/venueAccountInfo3';

  @override
  State<VenueAccountInfo3Widget> createState() =>
      _VenueAccountInfo3WidgetState();
}

class _VenueAccountInfo3WidgetState extends State<VenueAccountInfo3Widget> {
  late VenueAccountInfo3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VenueAccountInfo3Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.venueId != null) {
        FFAppState().tempPhoneNumber = '';
        safeSetState(() {});
        _model.isReadOnly = true;
        safeSetState(() {});
        _model.venueOutput = await VenuesTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'id',
            widget!.venueId,
          ),
        );
        FFAppState().tempPhoneNumber =
            _model.venueOutput!.firstOrNull!.phoneNumber!;
        safeSetState(() {});
        safeSetState(() {
          _model.vanueNameModel.textController?.text =
              _model.venueOutput!.firstOrNull!.name;
        });
        safeSetState(() {
          _model.addressModel.textController?.text =
              _model.venueOutput!.firstOrNull!.address!;
        });
        safeSetState(() {
          _model.descriptionTextController?.text =
              _model.venueOutput!.firstOrNull!.description!;
        });
        safeSetState(() {
          _model.venueCapacityModel.textController?.text =
              _model.venueOutput!.firstOrNull!.venueCapacity!;
        });
        safeSetState(() {
          _model.agePolicyModel.textController?.text =
              _model.venueOutput!.firstOrNull!.agePolicy!;
        });
        safeSetState(() {
          _model.hoursOperationModel.textController?.text =
              _model.venueOutput!.firstOrNull!.hoursOperation!;
        });
        safeSetState(() {
          _model.amenitiesModel.textController?.text =
              _model.venueOutput!.firstOrNull!.amenities!;
        });
        safeSetState(() {
          _model.cHRDPhoneNoVenueModel.phoneNumberTextController?.text =
              _model.venueOutput!.firstOrNull!.phoneNumber!;
          _model.cHRDPhoneNoVenueModel.phoneNumberMask.updateMask(
            newValue: TextEditingValue(
              text:
                  _model.cHRDPhoneNoVenueModel.phoneNumberTextController!.text,
            ),
          );
        });
        safeSetState(() {
          _model.emailModel.textController?.text =
              _model.venueOutput!.firstOrNull!.email;
        });
        safeSetState(() {
          _model.websiteModel.textController?.text =
              _model.venueOutput!.firstOrNull!.website!;
        });
      }
    });

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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/venue_account.png',
                  ).image,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-0.9, 0.0),
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
                              context.safePop();
                            },
                          ),
                        ),
                      ),
                      if (widget!.venueId == null)
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(-0.2, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Step 1 of 8',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
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
                                  width: 150.0,
                                  child: wrapWithModel(
                                    model: _model.cHRDProgressBarModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CHRDProgressBarWidget(
                                      progressValue: 0.1,
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 6.0)),
                            ),
                          ),
                        ),
                    ].addToStart(SizedBox(width: 21.0)),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.cHRDLabelColumnTextModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CHRDLabelColumnTextWidget(
                        heading: 'Venue Account info',
                        subHeading: 'Tell us about your venue',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 0.0),
                    child: Text(
                      'Venue Details',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ]
                    .addToStart(SizedBox(height: 56.0))
                    .addToEnd(SizedBox(height: 20.0)),
              ),
            ),
            Expanded(
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
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
                            freezeEmailInput: !_model.isReadOnly,
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
                            hintText:
                                '4441 Collins Ave, Miami Beach, FL 33140, USA',
                            freezeEmailInput: !_model.isReadOnly,
                            onChange: () async {
                              safeSetState(() {});
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).neutralDark900,
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
                                  readOnly: _model.isReadOnly,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Description',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    hintText:
                                        'Liv Nightclub is committed to providing a website that is accessible to all users, including those with visual impairments. As part of this commitment, our website has been designed to conform to the requirements of Section 508 of the U.S. Rehabilitation Act as amended and endeavors to conform to the World Wide Web Consortium (W3C) Web Content Accessibility Guidelines 2.0 AA. These guidelines explain how to make web content more accessible for people with disabilities. If you would like additional assistance or have accessibility concerns,',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0x8DFFFFFF),
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .neutralDark900,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
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
                                  validator: _model
                                      .descriptionTextControllerValidator
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
                            isReadonly: _model.isReadOnly,
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
                            isReadonly: _model.isReadOnly,
                            onChange: () async {
                              safeSetState(() {});
                            },
                          ),
                        ),
                        if (false)
                          wrapWithModel(
                            model: _model.hoursOperationModel,
                            updateCallback: () => safeSetState(() {}),
                            child: CHRDLabelTextFieldNumberWidget(
                              labelText: 'Hours Of Operation',
                              hintText: 'Simple weekly hours',
                              isReadonly: _model.isReadOnly,
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
                            hintText:
                                'Parking, Safety, Party Stage, Outdoor Spaces',
                            freezeEmailInput: !_model.isReadOnly,
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: Text(
                            'Contact Details',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                            phoneValue: FFAppState().tempPhoneNumber,
                            isReadOnly: _model.isReadOnly,
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
                            freezeEmailInput: !_model.isReadOnly,
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
                            freezeEmailInput: !_model.isReadOnly,
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 20.0, 0.0),
              child: wrapWithModel(
                model: _model.cHRDLabelBtnModel,
                updateCallback: () => safeSetState(() {}),
                child: CHRDLabelBtnWidget(
                  heading: widget!.isEdit == true
                      ? (_model.isReadOnly ? 'Edit Information' : 'Update')
                      : 'Next',
                  txtColor: FlutterFlowTheme.of(context).primaryText,
                  btnColor: FlutterFlowTheme.of(context).primaryViolet,
                  borderColor: FlutterFlowTheme.of(context).primaryViolet,
                  hight: 45.0,
                  headingFontSize: 14,
                  isDisiable: (_model.descriptionTextController.text != null &&
                              _model.descriptionTextController.text != '') &&
                          (_model.vanueNameModel.textController.text != null &&
                              _model.vanueNameModel.textController.text !=
                                  '') &&
                          (_model.addressModel.textController.text != null &&
                              _model.addressModel.textController.text != '') &&
                          (_model.venueCapacityModel.textController.text !=
                                  null &&
                              _model.venueCapacityModel.textController.text !=
                                  '') &&
                          (_model.agePolicyModel.textController.text != null &&
                              _model.agePolicyModel.textController.text !=
                                  '') &&
                          (_model.amenitiesModel.textController.text != null &&
                              _model.amenitiesModel.textController.text !=
                                  '') &&
                          (_model.cHRDPhoneNoVenueModel
                                      .phoneNumberTextController.text !=
                                  null &&
                              _model.cHRDPhoneNoVenueModel
                                      .phoneNumberTextController.text !=
                                  '') &&
                          (_model.emailModel.textController.text != null &&
                              _model.emailModel.textController.text != '') &&
                          (_model.websiteModel.textController.text != null &&
                              _model.websiteModel.textController.text != '')
                      ? false
                      : true,
                  onTab: () async {
                    if (_model.isReadOnly) {
                      _model.isReadOnly = false;
                      safeSetState(() {});
                    } else {
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        return;
                      }
                      if (widget!.venueId != null) {
                        await VenuesTable().update(
                          data: {
                            'name': _model.vanueNameModel.textController.text,
                            'address': _model.addressModel.textController.text,
                            'description':
                                _model.descriptionTextController.text,
                            'venue_capacity':
                                _model.venueCapacityModel.textController.text,
                            'age_policy':
                                _model.agePolicyModel.textController.text,
                            'hours_operation': _model.hoursOperationModel
                                            .textController.text !=
                                        null &&
                                    _model.hoursOperationModel.textController
                                            .text !=
                                        ''
                                ? _model.hoursOperationModel.textController.text
                                : '',
                            'amenities':
                                _model.amenitiesModel.textController.text,
                            'phone_number': _model.cHRDPhoneNoVenueModel
                                .phoneNumberTextController.text,
                            'email': _model.emailModel.textController.text,
                            'website': _model.websiteModel.textController.text,
                            'updated_at':
                                supaSerialize<DateTime>(getCurrentTimestamp),
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'id',
                            widget!.venueId,
                          ),
                        );
                        context.safePop();
                      } else {
                        FFAppState().vanueName =
                            _model.vanueNameModel.textController.text;
                        safeSetState(() {});
                        FFAppState().venueAccountCreate =
                            VenueAccountCreateStruct(
                          name: _model.vanueNameModel.textController.text,
                          description: _model.descriptionTextController.text,
                          email: _model.emailModel.textController.text,
                          mobileNo: _model.cHRDPhoneNoVenueModel
                              .phoneNumberTextController.text,
                          address: _model.addressModel.textController.text,
                          website: _model.websiteModel.textController.text,
                          createdBy: FFAppState().userId,
                          hoursOperation:
                              _model.hoursOperationModel.textController.text,
                          agePolicy: _model.agePolicyModel.textController.text,
                          amenities: _model.amenitiesModel.textController.text,
                          venueCapacity:
                              _model.venueCapacityModel.textController.text,
                        );

                        context.pushNamed(VenueProfilePic4Widget.routeName);
                      }
                    }
                  },
                ),
              ),
            ),
          ].addToEnd(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
