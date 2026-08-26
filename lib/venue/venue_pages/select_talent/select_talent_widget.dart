import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/no_data_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/venue/venue_pages/venue_components/c_h_r_d_send_offer_pop_up/c_h_r_d_send_offer_pop_up_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'select_talent_model.dart';
export 'select_talent_model.dart';

class SelectTalentWidget extends StatefulWidget {
  const SelectTalentWidget({
    super.key,
    this.venueId,
    this.slotId,
    required this.venueName,
    this.venueImage,
  });

  final int? venueId;
  final int? slotId;
  final String? venueName;
  final String? venueImage;

  static String routeName = 'select_talent';
  static String routePath = '/selectTalent';

  @override
  State<SelectTalentWidget> createState() => _SelectTalentWidgetState();
}

class _SelectTalentWidgetState extends State<SelectTalentWidget> {
  late SelectTalentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectTalentModel());

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

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(VenueGroup.getMusiciansListCall.call(
              name: _model.textController.text,
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final selectTalentGetMusiciansListResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.arrow_back,
                              color: FlutterFlowTheme.of(context).info,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              context.safePop();
                            },
                          ),
                          Expanded(
                            child: Text(
                              'Gig Offer',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ),
                    Text(
                      'Select Talent',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    Text(
                      'Send your gig offer directly to talent. Use filtering system to connect with the right talent.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).neutralDark500,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController',
                            Duration(milliseconds: 0),
                            () async {
                              _model.apiResult5iq =
                                  await VenueGroup.getMusiciansListCall.call(
                                name: _model.textController.text,
                              );

                              safeSetState(
                                  () => _model.apiRequestCompleter = null);
                              await _model.waitForApiRequestCompleted();

                              safeSetState(() {});
                            },
                          ),
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
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
                                  color: FlutterFlowTheme.of(context).hintTxt,
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
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).hintTxt,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).neutralDark900,
                            prefixIcon: Icon(
                              FFIcons.ksearch,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            suffixIcon: _model.textController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.textController?.clear();
                                      _model.apiResult5iq = await VenueGroup
                                          .getMusiciansListCall
                                          .call(
                                        name: _model.textController.text,
                                      );

                                      safeSetState(() =>
                                          _model.apiRequestCompleter = null);
                                      await _model.waitForApiRequestCompleted();

                                      safeSetState(() {});
                                      safeSetState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                  )
                                : null,
                          ),
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
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          enableInteractiveSelection: true,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    if (_model.textController.text == null ||
                        _model.textController.text == '')
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            final musiciansList =
                                (selectTalentGetMusiciansListResponse.jsonBody
                                                .toList()
                                                .map<MusiciansListModelStruct?>(
                                                    MusiciansListModelStruct
                                                        .maybeFromMap)
                                                .toList()
                                            as Iterable<
                                                MusiciansListModelStruct?>)
                                        .withoutNulls
                                        ?.map((e) => e)
                                        .toList()
                                        ?.toList() ??
                                    [];
                            if (musiciansList.isEmpty) {
                              return NoDataFoundWidget(
                                inputText: 'No Data Found!',
                              );
                            }

                            return ListView.separated(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                35.0,
                                0,
                                0,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: musiciansList.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 15.0),
                              itemBuilder: (context, musiciansListIndex) {
                                final musiciansListItem =
                                    musiciansList[musiciansListIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 44.0,
                                        height: 44.0,
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
                                            stops: [
                                              0.0,
                                              0.3,
                                              0.4,
                                              0.5,
                                              0.6,
                                              0.7,
                                              1.0
                                            ],
                                            begin:
                                                AlignmentDirectional(-1.0, 0.0),
                                            end: AlignmentDirectional(1.0, 0),
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(500.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    Duration(milliseconds: 500),
                                                imageUrl:
                                                    valueOrDefault<String>(
                                                  musiciansListItem
                                                      .profileImage,
                                                  'https://kasnaqcqfuqnfydsjvpy.supabase.co/storage/v1/object/public/venueC/error.png',
                                                ),
                                                width: 42.0,
                                                height: 42.0,
                                                fit: BoxFit.cover,
                                                errorWidget: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.jpg',
                                                  width: 42.0,
                                                  height: 42.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              musiciansListItem.name,
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
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  VenueMusicianProfile1Widget
                                                      .routeName,
                                                  queryParameters: {
                                                    'musicianId':
                                                        serializeParam(
                                                      musiciansListItem.id,
                                                      ParamType.int,
                                                    ),
                                                    'venueId': serializeParam(
                                                      widget!.venueId,
                                                      ParamType.int,
                                                    ),
                                                    'slotId': serializeParam(
                                                      widget!.slotId,
                                                      ParamType.int,
                                                    ),
                                                    'venueName': serializeParam(
                                                      widget!.venueName,
                                                      ParamType.String,
                                                    ),
                                                    'venueImage':
                                                        serializeParam(
                                                      widget!.venueImage,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Text(
                                                'View profile',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .neutralDark500,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          lineHeight: 1.4,
                                                        ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 6.0)),
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) =>
                                            FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            FFIcons.ksendMsg,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child:
                                                        CHRDSendOfferPopUpWidget(
                                                      image: valueOrDefault<
                                                          String>(
                                                        musiciansListItem
                                                            .profileImage,
                                                        'https://kasnaqcqfuqnfydsjvpy.supabase.co/storage/v1/object/public/venueC/error.png',
                                                      ),
                                                      musicianName:
                                                          musiciansListItem
                                                              .name,
                                                      offerBtnAction: () async {
                                                        var _shouldSetState =
                                                            false;
                                                        _model.upsertOutput =
                                                            await VenueGroup
                                                                .upsertGigsCall
                                                                .call(
                                                          venueId:
                                                              widget!.venueId,
                                                          musicianId:
                                                              musiciansListItem
                                                                  .id,
                                                          slotid:
                                                              widget!.slotId,
                                                          venueOwnerId:
                                                              FFAppState()
                                                                  .userId,
                                                        );

                                                        _shouldSetState = true;
                                                        if ((_model.upsertOutput
                                                                ?.succeeded ??
                                                            true)) {
                                                          if ('true' ==
                                                              getJsonField(
                                                                (_model.upsertOutput
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$..slot_thread_is_created_now''',
                                                              ).toString()) {
                                                            _model.notificationOutput =
                                                                await NotificationGroup
                                                                    .sendNotificationCall
                                                                    .call(
                                                              title:
                                                                  '${widget!.venueName} invited you',
                                                              description:
                                                                  '${widget!.venueName} invited you to perform. Check details.',
                                                              sendToList:
                                                                  (int var1) {
                                                                return List<
                                                                    String>.from([
                                                                  var1.toString()
                                                                ]);
                                                              }(musiciansListItem
                                                                      .id),
                                                              type:
                                                                  'PerformerInvited',
                                                              usertype:
                                                                  FFAppState()
                                                                      .userType
                                                                      ?.name,
                                                              dataJson: <String,
                                                                  dynamic>{
                                                                'is_venue':
                                                                    'false',
                                                                'thread_id':
                                                                    getJsonField(
                                                                  (_model.upsertOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$..slot_thread_id''',
                                                                ),
                                                                'image': widget!
                                                                    .venueImage,
                                                              },
                                                            );

                                                            _shouldSetState =
                                                                true;
                                                            await NotificationTable()
                                                                .insert({
                                                              'user_id':
                                                                  musiciansListItem
                                                                      .id,
                                                              'title':
                                                                  '${widget!.venueName} invited you',
                                                              'description':
                                                                  '${widget!.venueName} invited you to perform. Check details.',
                                                              'type':
                                                                  'PerformerInvited',
                                                              'data': <String,
                                                                  dynamic>{
                                                                'is_venue':
                                                                    'false',
                                                                'thread_id':
                                                                    getJsonField(
                                                                  (_model.upsertOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$..slot_thread_id''',
                                                                ),
                                                                'image': widget!
                                                                    .venueImage,
                                                              },
                                                              'usertype':
                                                                  FFAppState()
                                                                      .userType
                                                                      ?.name,
                                                              'is_read': false,
                                                              'created_at': supaSerialize<
                                                                      DateTime>(
                                                                  functions
                                                                      .toUtcTimestamp(
                                                                          getCurrentTimestamp)),
                                                              'updated_at': supaSerialize<
                                                                      DateTime>(
                                                                  functions
                                                                      .toUtcTimestamp(
                                                                          getCurrentTimestamp)),
                                                            });
                                                          }
                                                          Navigator.pop(
                                                              context);

                                                          context.pushNamed(
                                                            CustomChatVenueWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'threadId':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  (_model.upsertOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$..slot_thread_id''',
                                                                ),
                                                                ParamType.int,
                                                              ),
                                                              'isVenue':
                                                                  serializeParam(
                                                                true,
                                                                ParamType.bool,
                                                              ),
                                                            }.withoutNulls,
                                                          );

                                                          return;
                                                        } else {
                                                          return;
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            safeSetState(() {});
                                          },
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 13.0)),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    if (_model.textController.text != null &&
                        _model.textController.text != '')
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            final filteredmusiciansList = ((_model
                                                    .apiResult5iq?.jsonBody ??
                                                '')
                                            .toList()
                                            .map<MusiciansListModelStruct?>(
                                                MusiciansListModelStruct
                                                    .maybeFromMap)
                                            .toList()
                                        as Iterable<MusiciansListModelStruct?>)
                                    .withoutNulls
                                    ?.map((e) => e)
                                    .toList()
                                    ?.toList() ??
                                [];
                            if (filteredmusiciansList.isEmpty) {
                              return NoDataFoundWidget(
                                inputText: 'No Data Found!',
                              );
                            }

                            return ListView.separated(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                35.0,
                                0,
                                0,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: filteredmusiciansList.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 15.0),
                              itemBuilder:
                                  (context, filteredmusiciansListIndex) {
                                final filteredmusiciansListItem =
                                    filteredmusiciansList[
                                        filteredmusiciansListIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 44.0,
                                        height: 44.0,
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
                                            stops: [
                                              0.0,
                                              0.3,
                                              0.4,
                                              0.5,
                                              0.6,
                                              0.7,
                                              1.0
                                            ],
                                            begin:
                                                AlignmentDirectional(-1.0, 0.0),
                                            end: AlignmentDirectional(1.0, 0),
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(500.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    Duration(milliseconds: 500),
                                                imageUrl:
                                                    valueOrDefault<String>(
                                                  filteredmusiciansListItem
                                                      .profileImage,
                                                  'https://kasnaqcqfuqnfydsjvpy.supabase.co/storage/v1/object/public/venueC/error.png',
                                                ),
                                                width: 42.0,
                                                height: 42.0,
                                                fit: BoxFit.cover,
                                                errorWidget: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.jpg',
                                                  width: 42.0,
                                                  height: 42.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              filteredmusiciansListItem.name,
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
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  VenueMusicianProfile1Widget
                                                      .routeName,
                                                  queryParameters: {
                                                    'musicianId':
                                                        serializeParam(
                                                      filteredmusiciansListItem
                                                          .id,
                                                      ParamType.int,
                                                    ),
                                                    'venueId': serializeParam(
                                                      widget!.venueId,
                                                      ParamType.int,
                                                    ),
                                                    'slotId': serializeParam(
                                                      widget!.slotId,
                                                      ParamType.int,
                                                    ),
                                                    'venueName': serializeParam(
                                                      filteredmusiciansListItem
                                                          .name,
                                                      ParamType.String,
                                                    ),
                                                    'venueImage':
                                                        serializeParam(
                                                      widget!.venueImage,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Text(
                                                'View profile',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .neutralDark500,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          lineHeight: 1.4,
                                                        ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 6.0)),
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) =>
                                            FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            FFIcons.ksendMsg,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child:
                                                        CHRDSendOfferPopUpWidget(
                                                      image:
                                                          filteredmusiciansListItem
                                                              .profileImage,
                                                      musicianName:
                                                          filteredmusiciansListItem
                                                              .name,
                                                      offerBtnAction: () async {
                                                        var _shouldSetState =
                                                            false;
                                                        _model.upsertOutputCopy =
                                                            await VenueGroup
                                                                .upsertGigsCall
                                                                .call(
                                                          venueId:
                                                              widget!.venueId,
                                                          musicianId:
                                                              filteredmusiciansListItem
                                                                  .id,
                                                          slotid:
                                                              widget!.slotId,
                                                          venueOwnerId:
                                                              FFAppState()
                                                                  .userId,
                                                        );

                                                        _shouldSetState = true;
                                                        if ((_model
                                                                .upsertOutputCopy
                                                                ?.succeeded ??
                                                            true)) {
                                                          if ('true' ==
                                                              getJsonField(
                                                                (_model.upsertOutputCopy
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$..slot_thread_is_created_now''',
                                                              ).toString()) {
                                                            _model.notificationOutputCopy =
                                                                await NotificationGroup
                                                                    .sendNotificationCall
                                                                    .call(
                                                              title:
                                                                  '${widget!.venueName} invited you',
                                                              description:
                                                                  '${widget!.venueName} invited you to perform. Check details.',
                                                              sendToList:
                                                                  (int var1) {
                                                                return List<
                                                                    String>.from([
                                                                  var1.toString()
                                                                ]);
                                                              }(filteredmusiciansListItem
                                                                      .id),
                                                              type:
                                                                  'PerformerInvited',
                                                              usertype:
                                                                  FFAppState()
                                                                      .userType
                                                                      ?.name,
                                                              dataJson: <String,
                                                                  dynamic>{
                                                                'is_venue':
                                                                    'false',
                                                                'thread_id':
                                                                    getJsonField(
                                                                  (_model.upsertOutputCopy
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$..slot_thread_id''',
                                                                ),
                                                                'image': widget!
                                                                    .venueImage,
                                                              },
                                                            );

                                                            _shouldSetState =
                                                                true;
                                                            await NotificationTable()
                                                                .insert({
                                                              'user_id':
                                                                  filteredmusiciansListItem
                                                                      .id,
                                                              'title':
                                                                  '${widget!.venueName} invited you',
                                                              'description':
                                                                  '${widget!.venueName} invited you to perform. Check details.',
                                                              'type':
                                                                  'PerformerInvited',
                                                              'data': <String,
                                                                  dynamic>{
                                                                'is_venue':
                                                                    'false',
                                                                'thread_id':
                                                                    getJsonField(
                                                                  (_model.upsertOutputCopy
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$..slot_thread_id''',
                                                                ),
                                                                'image': widget!
                                                                    .venueImage,
                                                              },
                                                              'usertype':
                                                                  FFAppState()
                                                                      .userType
                                                                      ?.name,
                                                              'is_read': false,
                                                              'created_at': supaSerialize<
                                                                      DateTime>(
                                                                  functions
                                                                      .toUtcTimestamp(
                                                                          getCurrentTimestamp)),
                                                              'updated_at': supaSerialize<
                                                                      DateTime>(
                                                                  functions
                                                                      .toUtcTimestamp(
                                                                          getCurrentTimestamp)),
                                                            });
                                                          }
                                                          Navigator.pop(
                                                              context);

                                                          context.pushNamed(
                                                            CustomChatVenueWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'threadId':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  (_model.upsertOutputCopy
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$..slot_thread_id''',
                                                                ),
                                                                ParamType.int,
                                                              ),
                                                              'isVenue':
                                                                  serializeParam(
                                                                true,
                                                                ParamType.bool,
                                                              ),
                                                            }.withoutNulls,
                                                          );

                                                          return;
                                                        } else {
                                                          return;
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            safeSetState(() {});
                                          },
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 13.0)),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                  ]
                      .addToStart(SizedBox(height: 12.0))
                      .addToEnd(SizedBox(height: 30.0)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
