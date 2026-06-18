import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_with_border/c_h_r_d_label_text_field_with_border_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_app_bar2/c_h_r_d_app_bar2_widget.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'musician_account_info_model.dart';
export 'musician_account_info_model.dart';

class MusicianAccountInfoWidget extends StatefulWidget {
  const MusicianAccountInfoWidget({super.key});

  static String routeName = 'musician_account_info';
  static String routePath = '/musicianAccountInfo';

  @override
  State<MusicianAccountInfoWidget> createState() =>
      _MusicianAccountInfoWidgetState();
}

class _MusicianAccountInfoWidgetState extends State<MusicianAccountInfoWidget> {
  late MusicianAccountInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MusicianAccountInfoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (currentUserEmail != null && currentUserEmail != '') {
        safeSetState(() {
          _model.emailModel.textController?.text = currentUserEmail;
        });
        if (FFAppState().firstName != null && FFAppState().firstName != '') {
          safeSetState(() {
            _model.firstNameModel.textController?.text = FFAppState().firstName;
          });
          safeSetState(() {
            _model.lastNameModel.textController?.text = FFAppState().lastName;
          });
        }
      }
    });

    _model.musicianStatementTextController ??= TextEditingController();
    _model.musicianStatementFocusNode ??= FocusNode();

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
                    'assets/images/Rectangle_4495.png',
                  ).image,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(21.0, 0.0, 19.0, 0.0),
                    child: wrapWithModel(
                      model: _model.cHRDAppBar2Model,
                      updateCallback: () => safeSetState(() {}),
                      child: CHRDAppBar2Widget(
                        step: 2,
                        skip: 'Skip',
                        progressValue: 0.5,
                        hideSkipButton: true,
                        count: 6,
                        isEdit: false,
                        onNavBack: () async {
                          context.pop();
                        },
                        onSkip: () async {
                          await UsersTable().update(
                            data: {
                              'step': 6,
                            },
                            matchingRows: (rows) => rows.eqOrNull(
                              'id',
                              FFAppState().userId,
                            ),
                          );
                          FFAppState().step = 6;

                          context.goNamed(HomeVWidget.routeName);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.cHRDLabelColumnTextModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CHRDLabelColumnTextWidget(
                        heading: 'Account Info',
                        subHeading: 'Let us know how to properly address you',
                      ),
                    ),
                  ),
                ]
                    .addToStart(SizedBox(height: 57.0))
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
                      children: [
                        wrapWithModel(
                          model: _model.firstNameModel,
                          updateCallback: () => safeSetState(() {}),
                          child: CHRDLabelTextFieldWithBorderWidget(
                            labelText: 'First Name',
                            hintText: 'First Name',
                            freezeEmailInput: true,
                            onChange: () async {},
                          ),
                        ),
                        wrapWithModel(
                          model: _model.lastNameModel,
                          updateCallback: () => safeSetState(() {}),
                          child: CHRDLabelTextFieldWithBorderWidget(
                            labelText: 'Last Name',
                            hintText: 'Last Name',
                            freezeEmailInput: true,
                            onChange: () async {
                              safeSetState(() {});
                            },
                          ),
                        ),
                        if (currentUserEmail == null || currentUserEmail == '')
                          wrapWithModel(
                            model: _model.emailModel,
                            updateCallback: () => safeSetState(() {}),
                            child: CHRDLabelTextFieldWithBorderWidget(
                              labelText: 'Email',
                              hintText: 'Email',
                              freezeEmailInput: currentUserEmail != null &&
                                      currentUserEmail != ''
                                  ? false
                                  : true,
                              onChange: () async {
                                safeSetState(() {});
                              },
                            ),
                          ),
                        if (false)
                          FutureBuilder<List<EntertainmentRow>>(
                            future: EntertainmentTable().queryRows(
                              queryFn: (q) => q,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<EntertainmentRow>
                                  multiSelectDropdownEntertainmentEntertainmentRowList =
                                  snapshot.data!;

                              return Container(
                                width: double.infinity,
                                height: 58.0,
                                child: custom_widgets.MultiSelectDropdownCopy(
                                  width: double.infinity,
                                  height: 58.0,
                                  dropdownTitle: 'Select ',
                                  dropdownText:
                                      'Select Your Entertainment Type',
                                  labelList:
                                      multiSelectDropdownEntertainmentEntertainmentRowList
                                          .map((e) => e.entertainmentType)
                                          .toList(),
                                  optionList: (List<int> var1) {
                                    return var1
                                        .map((e) => e.toString())
                                        .toList();
                                  }(multiSelectDropdownEntertainmentEntertainmentRowList
                                      .map((e) => e.entertainmentId)
                                      .toList()),
                                  initialSelectedOptions:
                                      _model.selectedEntertainment,
                                  onSelectionChanged: (value) async {
                                    _model.selectedEntertainment =
                                        value!.toList().cast<String>();
                                    safeSetState(() {});
                                  },
                                ),
                              );
                            },
                          ),
                        if (false)
                          FutureBuilder<List<GenresRow>>(
                            future: GenresTable().queryRows(
                              queryFn: (q) => q,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<GenresRow>
                                  multiSelectDropdownGenreGenresRowList =
                                  snapshot.data!;

                              return Container(
                                width: double.infinity,
                                height: 58.0,
                                child: custom_widgets.MultiSelectDropdownCopy(
                                  width: double.infinity,
                                  height: 58.0,
                                  dropdownTitle: 'Select ',
                                  dropdownText: 'Select Your music genre',
                                  labelList:
                                      multiSelectDropdownGenreGenresRowList
                                          .map((e) => e.genreType)
                                          .toList(),
                                  optionList: (List<int> var1) {
                                    return var1
                                        .map((e) => e.toString())
                                        .toList();
                                  }(multiSelectDropdownGenreGenresRowList
                                      .map((e) => e.genreId)
                                      .toList()),
                                  initialSelectedOptions: _model.selectedGenre,
                                  onSelectionChanged: (value) async {
                                    _model.selectedGenre =
                                        value!.toList().cast<String>();
                                    safeSetState(() {});
                                  },
                                ),
                              );
                            },
                          ),
                        if (false)
                          FutureBuilder<List<EntertainmentRow>>(
                            future: EntertainmentTable().queryRows(
                              queryFn: (q) => q,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<EntertainmentRow>
                                  entertainmentDropDownEntertainmentRowList =
                                  snapshot.data!;

                              return FlutterFlowDropDown<String>(
                                multiSelectController: _model
                                        .entertainmentDropDownValueController ??=
                                    FormListFieldController<String>(null),
                                options: List<String>.from(
                                    functions.intListToStringList(
                                        entertainmentDropDownEntertainmentRowList
                                            .map((e) => e.entertainmentId)
                                            .toList())!),
                                optionLabels:
                                    entertainmentDropDownEntertainmentRowList
                                        .map((e) => e.entertainmentType)
                                        .toList(),
                                width: double.infinity,
                                height: 58.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
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
                                hintText: 'Select your Entertainment Type',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor:
                                    FlutterFlowTheme.of(context).neutralDark900,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 12.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: false,
                                isMultiSelect: true,
                                onMultiSelectChanged: (val) => safeSetState(
                                    () => _model.entertainmentDropDownValue =
                                        val),
                              );
                            },
                          ),
                        if (false)
                          FutureBuilder<List<GenresRow>>(
                            future: GenresTable().queryRows(
                              queryFn: (q) => q,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<GenresRow> genreDropDownGenresRowList =
                                  snapshot.data!;

                              return FlutterFlowDropDown<String>(
                                multiSelectController:
                                    _model.genreDropDownValueController ??=
                                        FormListFieldController<String>(null),
                                options: List<String>.from(
                                    functions.intListToStringList(
                                        genreDropDownGenresRowList
                                            .map((e) => e.genreId)
                                            .toList())!),
                                optionLabels: genreDropDownGenresRowList
                                    .map((e) => e.genreType)
                                    .toList(),
                                width: double.infinity,
                                height: 58.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
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
                                hintText: 'Select your music genre',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor:
                                    FlutterFlowTheme.of(context).neutralDark900,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 12.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: false,
                                isMultiSelect: true,
                                onMultiSelectChanged: (val) => safeSetState(
                                    () => _model.genreDropDownValue = val),
                              );
                            },
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
                                  controller:
                                      _model.musicianStatementTextController,
                                  focusNode: _model.musicianStatementFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.musicianStatementTextController',
                                    Duration(milliseconds: 0),
                                    () async {
                                      safeSetState(() {});
                                    },
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Performer Statement',
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
                                    hintText: 'Performer Statement',
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
                                  maxLines: 6,
                                  maxLength: 250,
                                  maxLengthEnforcement:
                                      MaxLengthEnforcement.enforced,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  enableInteractiveSelection: true,
                                  validator: _model
                                      .musicianStatementTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 14.0))
                          .addToEnd(SizedBox(height: 20.0)),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: wrapWithModel(
                model: _model.cHRDLabelBtnModel,
                updateCallback: () => safeSetState(() {}),
                child: CHRDLabelBtnWidget(
                  heading: 'Next',
                  txtColor: FlutterFlowTheme.of(context).primaryText,
                  btnColor: FlutterFlowTheme.of(context).primaryViolet,
                  borderColor: FlutterFlowTheme.of(context).primaryViolet,
                  hight: 45.0,
                  headingFontSize: 14,
                  isDisiable: (_model.firstNameModel.textController.text !=
                                  null &&
                              _model.firstNameModel.textController.text !=
                                  '') &&
                          (_model.lastNameModel.textController.text != null &&
                              _model.lastNameModel.textController.text != '') &&
                          (_model.emailModel.textController.text != null &&
                              _model.emailModel.textController.text != '') &&
                          (_model.musicianStatementTextController.text !=
                                  null &&
                              _model.musicianStatementTextController.text != '')
                      ? false
                      : true,
                  onTab: () async {
                    var _shouldSetState = false;
                    if (_model.formKey.currentState == null ||
                        !_model.formKey.currentState!.validate()) {
                      return;
                    }
                    _model.authOutput = await UsersTable().queryRows(
                      queryFn: (q) => q.eqOrNull(
                        'email',
                        currentUserEmail != null && currentUserEmail != ''
                            ? currentUserEmail
                            : _model.emailModel.textController.text,
                      ),
                    );
                    _shouldSetState = true;
                    if (_model.authOutput?.length != 0) {
                      if ((_model.authOutput?.firstOrNull?.email ==
                              _model.emailModel.textController.text) &&
                          (_model.authOutput?.firstOrNull?.id !=
                              FFAppState().userId)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Email already exists. Try with different one.',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: FlutterFlowTheme.of(context).error,
                          ),
                        );
                        if (_shouldSetState) safeSetState(() {});
                        return;
                      }
                    }
                    _model.userOutput = await UsersTable().update(
                      data: {
                        'name':
                            '${_model.firstNameModel.textController.text} ${_model.lastNameModel.textController.text}',
                        'user_type': Type.Musician.name,
                        'step': 2,
                        'email': _model.emailModel.textController.text,
                        'entertainment_id': functions.stringListToIntList(
                            _model.selectedEntertainment.toList()),
                        'genre_id': functions
                            .stringListToIntList(_model.selectedGenre.toList()),
                        'musician_statement':
                            _model.musicianStatementTextController.text,
                      },
                      matchingRows: (rows) => rows.eqOrNull(
                        'id',
                        FFAppState().userId,
                      ),
                      returnRows: true,
                    );
                    _shouldSetState = true;
                    FFAppState().step = 2;
                    FFAppState().AdminName =
                        '${_model.firstNameModel.textController.text} ${_model.lastNameModel.textController.text}';
                    safeSetState(() {});

                    context.pushNamed(
                      VenueEntertainment7Widget.routeName,
                      queryParameters: {
                        'musicianID': serializeParam(
                          FFAppState().userId,
                          ParamType.int,
                        ),
                      }.withoutNulls,
                    );

                    if (_shouldSetState) safeSetState(() {});
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
