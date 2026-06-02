import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/confirmation_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_container/c_h_r_d_container_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_musician_profile_model.dart';
export 'edit_musician_profile_model.dart';

class EditMusicianProfileWidget extends StatefulWidget {
  const EditMusicianProfileWidget({super.key});

  static String routeName = 'edit_musician_profile';
  static String routePath = '/editMusicianProfile';

  @override
  State<EditMusicianProfileWidget> createState() =>
      _EditMusicianProfileWidgetState();
}

class _EditMusicianProfileWidgetState extends State<EditMusicianProfileWidget> {
  late EditMusicianProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditMusicianProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userOutput = await UsersTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id',
          FFAppState().userId,
        ),
      );
      safeSetState(() {
        _model.musicianStatementTextController?.text =
            _model.userOutput!.firstOrNull!.musicianStatement!;
      });
      _model.genreEntertainmentOutput =
          await MusicianGroup.getGenreEntertainmentTypeCall.call(
        pEntertainmentIdsList: _model.userOutput?.firstOrNull?.entertainmentId,
        pGenreIdsList: _model.userOutput?.firstOrNull?.genreId,
      );

      if ((_model.genreEntertainmentOutput?.succeeded ?? true)) {
        _model.selectedEntertainment =
            MusicianGroup.getGenreEntertainmentTypeCall
                .entertainmentType(
                  (_model.genreEntertainmentOutput?.jsonBody ?? ''),
                )!
                .toList()
                .cast<String>();
        _model.selectedGenre = MusicianGroup.getGenreEntertainmentTypeCall
            .genreType(
              (_model.genreEntertainmentOutput?.jsonBody ?? ''),
            )!
            .toList()
            .cast<String>();
        safeSetState(() {});
        return;
      } else {
        return;
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/Rectangle_4495_(1).png',
                          ).image,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            wrapWithModel(
                              model: _model.cHRDBackBtnModel,
                              updateCallback: () => safeSetState(() {}),
                              child: CHRDBackBtnWidget(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                btnAction: () async {
                                  context.safePop();
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 28.0, 0.0, 12.0),
                              child: Text(
                                'Account Info',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Text(
                              'Click into fields to edit',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .neutralLight300,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ].addToStart(SizedBox(height: 13.0)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      LoginSecurityWidget.routeName,
                                      queryParameters: {
                                        'userData': serializeParam(
                                          _model.userOutput?.firstOrNull,
                                          ParamType.SupabaseRow,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: wrapWithModel(
                                    model: _model.cHRDContainerModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CHRDContainerWidget(
                                      heading: 'Login and Security',
                                      subHeading:
                                          'Name, email and phone number',
                                      iconButton: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                        size: 14.0,
                                      ),
                                      subHeadingColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      onTab: () async {
                                        _model.updatedOutput =
                                            await UsersTable().queryRows(
                                          queryFn: (q) => q.eqOrNull(
                                            'id',
                                            _model.userOutput?.firstOrNull?.id,
                                          ),
                                        );

                                        context.pushNamed(
                                          LoginSecurityWidget.routeName,
                                          queryParameters: {
                                            'userData': serializeParam(
                                              _model.updatedOutput?.firstOrNull,
                                              ParamType.SupabaseRow,
                                            ),
                                          }.withoutNulls,
                                        );

                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              FutureBuilder<List<EntertainmentRow>>(
                                future: FFAppState()
                                    .entertainmentMultiselectMusicianProfilePage(
                                  uniqueQueryKey:
                                      'entertainment_multiselect_musician_profile_page',
                                  requestFn: () =>
                                      EntertainmentTable().queryRows(
                                    queryFn: (q) => q,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
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
                                    child:
                                        custom_widgets.MultiSelectDropdownCopy(
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
                              FutureBuilder<List<GenresRow>>(
                                future: FFAppState().genreQueryResponse(
                                  uniqueQueryKey: 'genre_query_response',
                                  requestFn: () => GenresTable().queryRows(
                                    queryFn: (q) => q,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
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
                                    child:
                                        custom_widgets.MultiSelectDropdownCopy(
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
                                      initialSelectedOptions:
                                          _model.selectedGenre,
                                      onSelectionChanged: (value) async {
                                        _model.selectedGenre =
                                            value!.toList().cast<String>();
                                        safeSetState(() {});
                                      },
                                    ),
                                  );
                                },
                              ),
                              Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .neutralDark900,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: Container(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller: _model
                                              .musicianStatementTextController,
                                          focusNode:
                                              _model.musicianStatementFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
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
                                            labelText: 'Musician Statement',
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                            hintText: 'Musician Statement',
                                            hintStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0x8DFFFFFF),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .neutralDark900,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          maxLines: 6,
                                          maxLength: 250,
                                          maxLengthEnforcement:
                                              MaxLengthEnforcement.enforced,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          enableInteractiveSelection: true,
                                          validator: _model
                                              .musicianStatementTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    LoginSecurityWidget.routeName,
                                    queryParameters: {
                                      'userData': serializeParam(
                                        _model.userOutput?.firstOrNull,
                                        ParamType.SupabaseRow,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: wrapWithModel(
                                  model: _model.cHRDContainerModel2,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CHRDContainerWidget(
                                    heading: 'Edit Profile',
                                    subHeading: 'Edit Profile Image',
                                    iconButton: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 14.0,
                                    ),
                                    subHeadingColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    onTab: () async {
                                      context.pushNamed(
                                        EditProfilePictureWidget.routeName,
                                        queryParameters: {
                                          'profileImage': serializeParam(
                                            _model.userOutput?.firstOrNull
                                                ?.profilePhoto,
                                            ParamType.String,
                                          ),
                                          'musicianId': serializeParam(
                                            _model.userOutput?.firstOrNull?.id,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 14.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      LoginSecurityWidget.routeName,
                                      queryParameters: {
                                        'userData': serializeParam(
                                          _model.userOutput?.firstOrNull,
                                          ParamType.SupabaseRow,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: wrapWithModel(
                                    model: _model.cHRDContainerModel3,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CHRDContainerWidget(
                                      heading: 'Social Media',
                                      subHeading: 'Edit Social Media',
                                      iconButton: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                        size: 14.0,
                                      ),
                                      subHeadingColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      onTab: () async {
                                        context.pushNamed(
                                          VenueSocialMedia6Widget.routeName,
                                          queryParameters: {
                                            'type': serializeParam(
                                              Type.Musician.name,
                                              ParamType.String,
                                            ),
                                            'musicianId': serializeParam(
                                              FFAppState().userId,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 14.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Builder(
                        builder: (context) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 8.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.8,
                                        child: ConfirmationDialogWidget(
                                          acceptbtnText: 'Logout',
                                          title:
                                              'Are you sure you want to Logout?',
                                          acceptBtnAction: () async {
                                            FFAppState().venueId = 0;
                                            FFAppState().userId = 0;
                                            FFAppState().step = 0;
                                            FFAppState().userType = null;
                                            FFAppState().vanueName = '';
                                            FFAppState().AdminName = '';
                                            FFAppState().venueProfilePic = '';
                                            FFAppState().venueContentVenueList =
                                                [];
                                            FFAppState().venueAccountCreate =
                                                VenueAccountCreateStruct();
                                            FFAppState()
                                                .performanceStagesContentList = [];
                                            FFAppState().startTime = null;
                                            FFAppState().endTime = null;
                                            FFAppState().slotRepeatType =
                                                'None';
                                            FFAppState().slotEndDate = null;
                                            FFAppState().accountType = '';
                                            FFAppState().musicianAddImages = [];
                                            FFAppState().ProfileHighlight = [];
                                            FFAppState().gigOffer =
                                                GigOfferStruct();
                                            FFAppState().json = jsonDecode(
                                                '[{\"sender\":\"venue\",\"text\":\"Hey! We\'ve been following your shows and would love to have you DJ for us! How much money would you want for each show?\",\"timestamp\":\"9:41am\",\"date\":\"Oct 23rd, 2025\",\"isProposal\":true},{\"sender\":\"musician\",\"text\":\"Hi there! I would love to perform. I am not available Wednesday, Nov 26th. I am still interested in doing the other 3 shows for \$400 each.\",\"timestamp\":\"10:54am\"}]');
                                            FFAppState().email = '';
                                            FFAppState().firstName = '';
                                            FFAppState().lastName = '';
                                            safeSetState(() {});
                                            await actions.oneSignalLogout();
                                            GoRouter.of(context)
                                                .prepareAuthEvent();
                                            await authManager.signOut();
                                            GoRouter.of(context)
                                                .clearRedirectLocation();

                                            context.goNamedAuth(
                                                SplashScreenWidget.routeName,
                                                context.mounted);
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              height: 44.0,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).neutralDark900,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 10.0, 12.0, 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Log out',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Builder(
                        builder: (context) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 8.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.8,
                                        child: ConfirmationDialogWidget(
                                          acceptbtnText: 'Delete',
                                          title:
                                              'Are you sure you want to Delete Account?',
                                          acceptBtnAction: () async {
                                            var _shouldSetState = false;
                                            _model.deactivatedUserOutput =
                                                await VenueGroup
                                                    .deactivateUserCall
                                                    .call(
                                              pUserId: FFAppState().userId,
                                            );

                                            _shouldSetState = true;
                                            if ('true' ==
                                                getJsonField(
                                                  (_model.deactivatedUserOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.success''',
                                                ).toString()) {
                                              await actions.oneSignalLogout();
                                              FFAppState().venueId = 0;
                                              FFAppState().userId = 0;
                                              FFAppState().step = 0;
                                              FFAppState().userType = null;
                                              FFAppState().vanueName = '';
                                              FFAppState().AdminName = '';
                                              FFAppState().venueProfilePic = '';
                                              FFAppState()
                                                  .venueContentVenueList = [];
                                              FFAppState().venueAccountCreate =
                                                  VenueAccountCreateStruct();
                                              FFAppState()
                                                  .performanceStagesContentList = [];
                                              FFAppState().startTime = null;
                                              FFAppState().endTime = null;
                                              FFAppState().slotRepeatType =
                                                  'None';
                                              FFAppState().slotEndDate = null;
                                              FFAppState().accountType = '';
                                              FFAppState().musicianAddImages =
                                                  [];
                                              FFAppState().ProfileHighlight =
                                                  [];
                                              FFAppState().gigOffer =
                                                  GigOfferStruct();
                                              FFAppState().json = jsonDecode(
                                                  '[{\"sender\":\"venue\",\"text\":\"Hey! We\'ve been following your shows and would love to have you DJ for us! How much money would you want for each show?\",\"timestamp\":\"9:41am\",\"date\":\"Oct 23rd, 2025\",\"isProposal\":true},{\"sender\":\"musician\",\"text\":\"Hi there! I would love to perform. I am not available Wednesday, Nov 26th. I am still interested in doing the other 3 shows for \$400 each.\",\"timestamp\":\"10:54am\"}]');
                                              FFAppState().email = '';
                                              FFAppState().firstName = '';
                                              FFAppState().lastName = '';
                                              safeSetState(() {});
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              await authManager.signOut();
                                              GoRouter.of(context)
                                                  .clearRedirectLocation();

                                              context.goNamedAuth(
                                                  SplashScreenWidget.routeName,
                                                  context.mounted);

                                              return;
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    getJsonField(
                                                      (_model.deactivatedUserOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.message''',
                                                    ).toString(),
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                              Navigator.pop(context);
                                              return;
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );

                              safeSetState(() {});
                            },
                            child: Container(
                              width: double.infinity,
                              height: 44.0,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).neutralDark900,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Delete Account',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: wrapWithModel(
                  model: _model.cHRDLabelBtnModel,
                  updateCallback: () => safeSetState(() {}),
                  child: CHRDLabelBtnWidget(
                    heading: 'Save',
                    txtColor: FlutterFlowTheme.of(context).primaryText,
                    btnColor: FlutterFlowTheme.of(context).primaryViolet,
                    borderColor: FlutterFlowTheme.of(context).primaryViolet,
                    hight: 45.0,
                    headingFontSize: 14,
                    isDisiable: false,
                    onTab: () async {
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        return;
                      }
                      await UsersTable().update(
                        data: {
                          'musician_statement':
                              _model.musicianStatementTextController.text,
                          'genre_id': _model.selectedGenre.isNotEmpty
                              ? functions.stringListToIntList(
                                  _model.selectedGenre.toList())
                              : _model.userOutput?.firstOrNull?.genreId,
                          'updated_at':
                              supaSerialize<DateTime>(getCurrentTimestamp),
                          'entertainment_id': _model.selectedGenre.isNotEmpty
                              ? functions.stringListToIntList(
                                  _model.selectedEntertainment.toList())
                              : _model.userOutput?.firstOrNull?.entertainmentId,
                        },
                        matchingRows: (rows) => rows.eqOrNull(
                          'id',
                          FFAppState().userId,
                        ),
                      );
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed(
                        NavPageWidget.routeName,
                        queryParameters: {
                          'index': serializeParam(
                            4,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    },
                  ),
                ),
              ),
            ].addToEnd(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
