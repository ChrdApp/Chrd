import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_app_bar2/c_h_r_d_app_bar2_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'venue_genres8_model.dart';
export 'venue_genres8_model.dart';

class VenueGenres8Widget extends StatefulWidget {
  const VenueGenres8Widget({
    super.key,
    this.venueId,
    this.genersId,
    this.musicianID,
  });

  final int? venueId;
  final List<int>? genersId;
  final int? musicianID;

  static String routeName = 'venue_genres8';
  static String routePath = '/venueGenres8';

  @override
  State<VenueGenres8Widget> createState() => _VenueGenres8WidgetState();
}

class _VenueGenres8WidgetState extends State<VenueGenres8Widget> {
  late VenueGenres8Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VenueGenres8Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.genersId != null && (widget!.genersId)!.isNotEmpty) {
        _model.selectedGenres = widget!.genersId!.toList().cast<int>();
        safeSetState(() {});
      } else {
        return;
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
                    'assets/images/genres.png',
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
                        step: widget!.musicianID != null ? 4 : 6,
                        skip: 'Skip',
                        progressValue: 0.6,
                        hideSkipButton: () {
                          if (widget!.venueId != null) {
                            return true;
                          } else if (widget!.musicianID != null) {
                            return true;
                          } else {
                            return false;
                          }
                        }(),
                        count: widget!.musicianID != null ? 6 : 8,
                        isEdit: widget!.venueId != null ? true : false,
                        onNavBack: () async {
                          context.safePop();
                        },
                        onSkip: () async {
                          _model.createVenueSkip = await VenuesTable().insert({
                            'name': FFAppState().venueAccountCreate.name,
                            'email': FFAppState().venueAccountCreate.email,
                            'phone_number':
                                FFAppState().venueAccountCreate.mobileNo,
                            'address': FFAppState().venueAccountCreate.address,
                            'created_at':
                                supaSerialize<DateTime>(getCurrentTimestamp),
                            'description':
                                FFAppState().venueAccountCreate.description,
                            'services':
                                FFAppState().venueAccountCreate.services,
                            'website': FFAppState().venueAccountCreate.website,
                            'created_by':
                                FFAppState().venueAccountCreate.createdBy,
                            'updated_at':
                                supaSerialize<DateTime>(getCurrentTimestamp),
                            'instagram_id':
                                FFAppState().venueAccountCreate.instagramId,
                            'facebook_id':
                                FFAppState().venueAccountCreate.facebookId,
                            'x_id': FFAppState().venueAccountCreate.xId,
                            'youtube_id':
                                FFAppState().venueAccountCreate.youtubeId,
                            'venue_photo':
                                FFAppState().venueAccountCreate.venuePhoto,
                            'entertainment_id':
                                FFAppState().venueAccountCreate.entertainmentId,
                            'genre_id': FFAppState().venueAccountCreate.genreId,
                            'age_policy':
                                FFAppState().venueAccountCreate.agePolicy,
                            'hours_operation':
                                FFAppState().venueAccountCreate.hoursOperation,
                            'amenities':
                                FFAppState().venueAccountCreate.amenities,
                            'venue_capacity':
                                FFAppState().venueAccountCreate.venueCapacity,
                          });
                          for (int loop1Index = 0;
                              loop1Index < FFAppState().contentList.length;
                              loop1Index++) {
                            final currentLoop1Item =
                                FFAppState().contentList[loop1Index];
                            _model.contentListOutputSkip =
                                await VenueContentTable().insert({
                              'created_at':
                                  supaSerialize<DateTime>(getCurrentTimestamp),
                              'content': currentLoop1Item.content,
                              'venue_thumbnail':
                                  currentLoop1Item.thumbnailImage,
                              'venue_id': _model.createVenue?.id,
                            });
                          }
                          await UsersTable().update(
                            data: {
                              'step': 3,
                            },
                            matchingRows: (rows) => rows.eqOrNull(
                              'id',
                              FFAppState().userId,
                            ),
                          );
                          FFAppState().venueId = _model.createVenueSkip!.id;
                          FFAppState().step = 3;
                          safeSetState(() {});

                          context
                              .goNamed(AddPerformanceStages9Widget.routeName);

                          safeSetState(() {});
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.cHRDLabelColumnTextModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CHRDLabelColumnTextWidget(
                        heading:
                            'Select genres for ${widget!.musicianID != null ? FFAppState().AdminName : FFAppState().vanueName}',
                        subHeading:
                            'Select the genre that best match your venues entertainment (skip if not applicable)',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          Duration(milliseconds: 0),
                          () => safeSetState(() {}),
                        ),
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                          hintText: 'Search by name',
                          hintStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                font: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).neutralDark500,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  FlutterFlowTheme.of(context).neutralDark900,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  FlutterFlowTheme.of(context).neutralDark900,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).neutralDark900,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 13.0, 0.0, 0.0),
                          prefixIcon: Icon(
                            FontAwesomeIcons.search,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.montserrat(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color:
                                  FlutterFlowTheme.of(context).neutralDark500,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        enableInteractiveSelection: true,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                ]
                    .addToStart(SizedBox(height: 57.0))
                    .addToEnd(SizedBox(height: 20.0)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FutureBuilder<ApiCallResponse>(
                        future: VenueGroup.getGenreCall.call(
                          search: _model.textController.text,
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
                          final gridViewGetGenreResponse = snapshot.data!;

                          return Builder(
                            builder: (context) {
                              final genreList =
                                  gridViewGetGenreResponse.jsonBody.toList();

                              return GridView.builder(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  30.0,
                                ),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12.0,
                                  mainAxisSpacing: 12.0,
                                  childAspectRatio: 1.4,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: genreList.length,
                                itemBuilder: (context, genreListIndex) {
                                  final genreListItem =
                                      genreList[genreListIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (_model.selectedGenres
                                          .contains(getJsonField(
                                        genreListItem,
                                        r'''$.genre_id''',
                                      ))) {
                                        _model.removeFromSelectedGenres(
                                            getJsonField(
                                          genreListItem,
                                          r'''$.genre_id''',
                                        ));
                                        safeSetState(() {});
                                      } else {
                                        _model.addToSelectedGenres(getJsonField(
                                          genreListItem,
                                          r'''$.genre_id''',
                                        ));
                                        safeSetState(() {});
                                      }
                                    },
                                    child: Container(
                                      width: 170.0,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: Image.network(
                                            getJsonField(
                                              genreListItem,
                                              r'''$.genre_image''',
                                            ).toString(),
                                          ).image,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        border: Border.all(
                                          color: _model.selectedGenres
                                                  .contains(getJsonField(
                                            genreListItem,
                                            r'''$.genre_id''',
                                          ))
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryCyan
                                              : Color(0x00000000),
                                          width: 3.0,
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-0.8, 0.8),
                                            child: Text(
                                              getJsonField(
                                                genreListItem,
                                                r'''$.genre_type''',
                                              ).toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                          if (_model.selectedGenres
                                                  .contains(getJsonField(
                                            genreListItem,
                                            r'''$.genre_id''',
                                          ))
                                              ? true
                                              : false)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.9, -0.9),
                                              child: FlutterFlowIconButton(
                                                borderRadius: 100.0,
                                                buttonSize: 40.0,
                                                icon: Icon(
                                                  FFIcons.kvector3,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 24.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 14.0))
                      .addToStart(SizedBox(height: 4.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: wrapWithModel(
                model: _model.cHRDLabelBtnModel,
                updateCallback: () => safeSetState(() {}),
                child: CHRDLabelBtnWidget(
                  heading: widget!.venueId != null ? 'Update' : 'Next',
                  txtColor: FlutterFlowTheme.of(context).primaryText,
                  btnColor: FlutterFlowTheme.of(context).primaryViolet,
                  borderColor: FlutterFlowTheme.of(context).primaryViolet,
                  hight: 45.0,
                  headingFontSize: 14,
                  isDisiable: !(_model.selectedGenres.isNotEmpty),
                  onTab: () async {
                    var _shouldSetState = false;
                    if (widget!.venueId != null) {
                      await VenuesTable().update(
                        data: {
                          'genre_id': _model.selectedGenres,
                        },
                        matchingRows: (rows) => rows.eqOrNull(
                          'id',
                          widget!.venueId,
                        ),
                      );
                      context.safePop();
                      if (_shouldSetState) safeSetState(() {});
                      return;
                    } else if (widget!.musicianID != null) {
                      await UsersTable().update(
                        data: {
                          'genre_id': _model.selectedGenres,
                          'step': 4,
                        },
                        matchingRows: (rows) => rows.eqOrNull(
                          'id',
                          FFAppState().userId,
                        ),
                      );

                      context.goNamed(AddVenueContent5Widget.routeName);

                      if (_shouldSetState) safeSetState(() {});
                      return;
                    } else if (FFAppState().userType == Type.Fan) {
                    } else {
                      FFAppState().updateVenueAccountCreateStruct(
                        (e) => e..genreId = _model.selectedGenres.toList(),
                      );
                      safeSetState(() {});
                      _model.createVenue = await VenuesTable().insert({
                        'name': FFAppState().venueAccountCreate.name,
                        'email': FFAppState().venueAccountCreate.email,
                        'phone_number':
                            FFAppState().venueAccountCreate.mobileNo,
                        'address': FFAppState().venueAccountCreate.address,
                        'created_at':
                            supaSerialize<DateTime>(getCurrentTimestamp),
                        'description':
                            FFAppState().venueAccountCreate.description,
                        'services': FFAppState().venueAccountCreate.services,
                        'website': FFAppState().venueAccountCreate.website,
                        'created_by': FFAppState().venueAccountCreate.createdBy,
                        'updated_at':
                            supaSerialize<DateTime>(getCurrentTimestamp),
                        'instagram_id':
                            FFAppState().venueAccountCreate.instagramId,
                        'facebook_id':
                            FFAppState().venueAccountCreate.facebookId,
                        'x_id': FFAppState().venueAccountCreate.xId,
                        'youtube_id': FFAppState().venueAccountCreate.youtubeId,
                        'venue_photo':
                            FFAppState().venueAccountCreate.venuePhoto,
                        'entertainment_id':
                            FFAppState().venueAccountCreate.entertainmentId,
                        'genre_id': FFAppState().venueAccountCreate.genreId,
                        'age_policy': FFAppState().venueAccountCreate.agePolicy,
                        'hours_operation':
                            FFAppState().venueAccountCreate.hoursOperation,
                        'amenities': FFAppState().venueAccountCreate.amenities,
                        'venue_capacity':
                            FFAppState().venueAccountCreate.venueCapacity,
                      });
                      _shouldSetState = true;
                      for (int loop1Index = 0;
                          loop1Index < FFAppState().contentList.length;
                          loop1Index++) {
                        final currentLoop1Item =
                            FFAppState().contentList[loop1Index];
                        _model.contentListOutput =
                            await VenueContentTable().insert({
                          'created_at':
                              supaSerialize<DateTime>(getCurrentTimestamp),
                          'content': currentLoop1Item.content,
                          'venue_thumbnail': currentLoop1Item.thumbnailImage,
                          'venue_id': _model.createVenue?.id,
                        });
                        _shouldSetState = true;
                      }
                      await UsersTable().update(
                        data: {
                          'step': 3,
                        },
                        matchingRows: (rows) => rows.eqOrNull(
                          'id',
                          FFAppState().userId,
                        ),
                      );
                      FFAppState().venueId = _model.createVenue!.id;
                      FFAppState().step = 3;
                      safeSetState(() {});

                      context.goNamed(AddPerformanceStages9Widget.routeName);

                      if (_shouldSetState) safeSetState(() {});
                      return;
                    }

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
