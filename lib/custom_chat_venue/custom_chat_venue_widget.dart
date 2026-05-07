import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_chat_venue_model.dart';
export 'custom_chat_venue_model.dart';

class CustomChatVenueWidget extends StatefulWidget {
  const CustomChatVenueWidget({
    super.key,
    required this.threadId,
    bool? isVenue,
  }) : this.isVenue = isVenue ?? false;

  final int? threadId;
  final bool isVenue;

  static String routeName = 'customChatVenue';
  static String routePath = '/customChatVenue';

  @override
  State<CustomChatVenueWidget> createState() => _CustomChatVenueWidgetState();
}

class _CustomChatVenueWidgetState extends State<CustomChatVenueWidget> {
  late CustomChatVenueModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomChatVenueModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.threadOutput = await GigThreadsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget!.threadId,
        ),
      );
      _model.acceptRejectGigOutput = await VenueOpenSlotsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'group_uuid',
          _model.threadOutput?.firstOrNull?.slotGroupId,
        ),
      );
    });

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
      future: VenueGroup.getGigThreadDetailCall.call(
        threadId: widget!.threadId,
      ),
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
        final customChatVenueGetGigThreadDetailResponse = snapshot.data!;

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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: custom_widgets.GigChatThread(
                        width: double.infinity,
                        height: double.infinity,
                        musicianName: !widget!.isVenue
                            ? VenueGroup.getGigThreadDetailCall.venueNane(
                                customChatVenueGetGigThreadDetailResponse
                                    .jsonBody,
                              )!
                            : VenueGroup.getGigThreadDetailCall.musicianName(
                                customChatVenueGetGigThreadDetailResponse
                                    .jsonBody,
                              )!,
                        musicianCategory: VenueGroup.getGigThreadDetailCall
                            .musicianCategories(
                              customChatVenueGetGigThreadDetailResponse
                                  .jsonBody,
                            )!
                            .firstOrNull!,
                        musicianAvatar: !widget!.isVenue
                            ? VenueGroup.getGigThreadDetailCall.venuePhoto(
                                customChatVenueGetGigThreadDetailResponse
                                    .jsonBody,
                              )!
                            : VenueGroup.getGigThreadDetailCall.musicianPhoto(
                                customChatVenueGetGigThreadDetailResponse
                                    .jsonBody,
                              )!,
                        venueName: VenueGroup.getGigThreadDetailCall.venueNane(
                          customChatVenueGetGigThreadDetailResponse.jsonBody,
                        )!,
                        gigStatus: VenueGroup.getGigThreadDetailCall.gigStatus(
                          customChatVenueGetGigThreadDetailResponse.jsonBody,
                        )!,
                        gigDate: VenueGroup.getGigThreadDetailCall.gigStartDate(
                          customChatVenueGetGigThreadDetailResponse.jsonBody,
                        )!,
                        threadId: widget!.threadId!,
                        currentUserId: FFAppState().userId,
                        isVenue: widget!.isVenue,
                        slotType: VenueGroup.getGigThreadDetailCall.gigType(
                          customChatVenueGetGigThreadDetailResponse.jsonBody,
                        )!,
                        stageName: VenueGroup.getGigThreadDetailCall.stageName(
                                      customChatVenueGetGigThreadDetailResponse
                                          .jsonBody,
                                    ) !=
                                    null &&
                                VenueGroup.getGigThreadDetailCall.stageName(
                                      customChatVenueGetGigThreadDetailResponse
                                          .jsonBody,
                                    ) !=
                                    ''
                            ? VenueGroup.getGigThreadDetailCall.stageName(
                                customChatVenueGetGigThreadDetailResponse
                                    .jsonBody,
                              )!
                            : '',
                        onSendBtnClicked: (value) async {
                          await ThreadMessagesTable().insert({
                            'message_type': 'text',
                            'created_at': supaSerialize<DateTime>(
                                functions.toUtcTimestamp(getCurrentTimestamp)),
                            'thread_id': widget!.threadId,
                            'sender_id': FFAppState().userId,
                            'message_content': value,
                          });
                          if (!widget!.isVenue) {
                            _model.notificationPerformer =
                                await NotificationGroup.sendNotificationCall
                                    .call(
                              sendToList: (int var1) {
                                return List<String>.from([var1.toString()]);
                              }(getJsonField(
                                customChatVenueGetGigThreadDetailResponse
                                    .jsonBody,
                                r'''$..venue_owner_id''',
                              )),
                              title:
                                  '${VenueGroup.getGigThreadDetailCall.musicianName(
                                customChatVenueGetGigThreadDetailResponse
                                    .jsonBody,
                              )} Messaged You',
                              description: value,
                              type: 'PerformerMessaged',
                              usertype: FFAppState().userType?.name,
                              dataJson: <String, dynamic>{
                                'thread_id': widget!.threadId,
                                'is_venue': 'true',
                              },
                            );
                          } else {
                            _model.notificationVenue = await NotificationGroup
                                .sendNotificationCall
                                .call(
                              sendToList: (int var1) {
                                return List<String>.from([var1.toString()]);
                              }(getJsonField(
                                customChatVenueGetGigThreadDetailResponse
                                    .jsonBody,
                                r'''$..musician_id''',
                              )),
                              title:
                                  '${VenueGroup.getGigThreadDetailCall.venueNane(
                                customChatVenueGetGigThreadDetailResponse
                                    .jsonBody,
                              )} Messaged You',
                              description: value,
                              type: 'VenueMessaged',
                              usertype: FFAppState().userType?.name,
                              dataJson: <String, dynamic>{
                                'thread_id': widget!.threadId,
                                'is_venue': 'false',
                              },
                            );
                          }

                          safeSetState(() {});
                        },
                        viewOtherGigAction: () async {
                          if (widget!.isVenue) {
                            context.pushNamed(
                              VenueGigContractOverlayCopyWidget.routeName,
                              queryParameters: {
                                'slotId': serializeParam(
                                  _model.acceptRejectGigOutput?.firstOrNull?.id,
                                  ParamType.int,
                                ),
                                'threadId': serializeParam(
                                  widget!.threadId,
                                  ParamType.int,
                                ),
                                'musicianName': serializeParam(
                                  VenueGroup.getGigThreadDetailCall
                                      .musicianName(
                                    customChatVenueGetGigThreadDetailResponse
                                        .jsonBody,
                                  ),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );

                            return;
                          } else {
                            context.pushNamed(
                              VenueGigViewOverlayWidget.routeName,
                              queryParameters: {
                                'slotId': serializeParam(
                                  _model.acceptRejectGigOutput?.firstOrNull?.id,
                                  ParamType.int,
                                ),
                                'threadId': serializeParam(
                                  widget!.threadId,
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                            );

                            return;
                          }
                        },
                        showGigDetailAction: () async {},
                        viewProfileAction: () async {
                          if (widget!.isVenue) {
                            context.pushNamed(
                              VenueMusicianProfile1Widget.routeName,
                              queryParameters: {
                                'musicianId': serializeParam(
                                  VenueGroup.getGigThreadDetailCall.musicianId(
                                    customChatVenueGetGigThreadDetailResponse
                                        .jsonBody,
                                  ),
                                  ParamType.int,
                                ),
                                'venueId': serializeParam(
                                  VenueGroup.getGigThreadDetailCall.venueId(
                                    customChatVenueGetGigThreadDetailResponse
                                        .jsonBody,
                                  ),
                                  ParamType.int,
                                ),
                                'isBooked': serializeParam(
                                  VenueGroup.getGigThreadDetailCall.gigStatus(
                                            customChatVenueGetGigThreadDetailResponse
                                                .jsonBody,
                                          ) ==
                                          'open'
                                      ? false
                                      : true,
                                  ParamType.bool,
                                ),
                              }.withoutNulls,
                            );

                            return;
                          } else {
                            context.pushNamed(
                              VenueGigViewOverlayWidget.routeName,
                              queryParameters: {
                                'slotId': serializeParam(
                                  _model.acceptRejectGigOutput?.firstOrNull?.id,
                                  ParamType.int,
                                ),
                                'threadId': serializeParam(
                                  widget!.threadId,
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                            );

                            return;
                          }
                        },
                        msgClickAction: () async {
                          if (widget!.isVenue) {
                            context.pushNamed(
                              VenueGigViewOverlayWidget.routeName,
                              queryParameters: {
                                'slotId': serializeParam(
                                  _model.acceptRejectGigOutput?.firstOrNull?.id,
                                  ParamType.int,
                                ),
                                'threadId': serializeParam(
                                  widget!.threadId,
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                            );
                          } else {
                            context.pushNamed(
                              AcceptDeclineGigOverlayWidget.routeName,
                              queryParameters: {
                                'slotId': serializeParam(
                                  _model.acceptRejectGigOutput?.firstOrNull?.id,
                                  ParamType.int,
                                ),
                                'threadId': serializeParam(
                                  widget!.threadId,
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                            );
                          }
                        },
                        onDeleteAction: () async {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
