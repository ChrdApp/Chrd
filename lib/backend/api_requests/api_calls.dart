import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';

import 'package:ff_commons/api_requests/api_paging_params.dart';

export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Venue Group Code

class VenueGroup {
  static String getBaseUrl({
    String? projectURL,
    String? anonKey,
  }) {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    return 'https://${projectURL}.supabase.co/rest/v1';
  }

  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [anonKey]',
    'apikey': '[anonKey]',
  };
  static VenueOpenSlotsCall venueOpenSlotsCall = VenueOpenSlotsCall();
  static UnifiedSlotCreationCall unifiedSlotCreationCall =
      UnifiedSlotCreationCall();
  static VenueOpenSlotsGroupedCall venueOpenSlotsGroupedCall =
      VenueOpenSlotsGroupedCall();
  static GetSingleSlotDetailsCall getSingleSlotDetailsCall =
      GetSingleSlotDetailsCall();
  static GetUserVenuesCall getUserVenuesCall = GetUserVenuesCall();
  static GetMusiciansListCall getMusiciansListCall = GetMusiciansListCall();
  static UpsertGigsCall upsertGigsCall = UpsertGigsCall();
  static ShowAllGigsCall showAllGigsCall = ShowAllGigsCall();
  static GetGigThreadsCall getGigThreadsCall = GetGigThreadsCall();
  static GetGigThreadDetailCall getGigThreadDetailCall =
      GetGigThreadDetailCall();
  static GetEntertainmetCall getEntertainmetCall = GetEntertainmetCall();
  static GetGenreCall getGenreCall = GetGenreCall();
  static GetVenuePlannerSlotsCall getVenuePlannerSlotsCall =
      GetVenuePlannerSlotsCall();
  static UpdateVenueSlotsUnifiedCall updateVenueSlotsUnifiedCall =
      UpdateVenueSlotsUnifiedCall();
  static GetTodaysVenueRundownCall getTodaysVenueRundownCall =
      GetTodaysVenueRundownCall();
  static GetMusicianByCategoryCall getMusicianByCategoryCall =
      GetMusicianByCategoryCall();
  static GetSlotDetailsCall getSlotDetailsCall = GetSlotDetailsCall();
  static DeleteVenueAndReturnURLCall deleteVenueAndReturnURLCall =
      DeleteVenueAndReturnURLCall();
  static DeleteVenueOpenSlotsCall deleteVenueOpenSlotsCall =
      DeleteVenueOpenSlotsCall();
  static DeleteVenueCall deleteVenueCall = DeleteVenueCall();
  static GetSequenceCall getSequenceCall = GetSequenceCall();
  static MarkAllNotificationsReadCall markAllNotificationsReadCall =
      MarkAllNotificationsReadCall();
  static FetchStageWithSlotsCall fetchStageWithSlotsCall =
      FetchStageWithSlotsCall();
  static InsertStageContentCall insertStageContentCall =
      InsertStageContentCall();
  static GetStageDetailCall getStageDetailCall = GetStageDetailCall();
  static DeactivateUserCall deactivateUserCall = DeactivateUserCall();
  static HardDeleteVenueSlotCall hardDeleteVenueSlotCall =
      HardDeleteVenueSlotCall();
  static FetchMusiciansOfGigCall fetchMusiciansOfGigCall =
      FetchMusiciansOfGigCall();
  static RemoveMusicianFromGigCall removeMusicianFromGigCall =
      RemoveMusicianFromGigCall();
  static CreateGigInviteCall createGigInviteCall = CreateGigInviteCall();
}

class VenueOpenSlotsCall {
  Future<ApiCallResponse> call({
    int? pUserId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_user_id": ${pUserId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Venue Open Slots',
      apiUrl: '${baseUrl}/rpc/get_user_venues_with_open_slots',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? venueName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].venue_name''',
      ));
  int? venueId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].venue_id''',
      ));
  String? venueEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].venue_email''',
      ));
  String? venuePhoto(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].venue_photo''',
      ));
  int? slotCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].slot_count''',
      ));
}

class UnifiedSlotCreationCall {
  Future<ApiCallResponse> call({
    int? stageId,
    int? venueId,
    String? startDate = '',
    String? startTime = '',
    String? endTime = '',
    String? loadTime = '',
    String? loadDuration = '',
    int? createdBy,
    String? timeZone = '',
    String? endDate = '',
    String? repeatType = '',
    String? pNotes = '',
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_stage_id": ${stageId},
  "p_venue_id": ${venueId},
  "p_start_date": "${escapeStringForJson(startDate)}",
  "p_start_time": "${escapeStringForJson(startTime)}",
  "p_end_time": "${escapeStringForJson(endTime)}",
  "p_time_zone": "${escapeStringForJson(timeZone)}",
  "p_load_time": "${escapeStringForJson(loadTime)}",
  "p_load_duration": "${escapeStringForJson(loadDuration)}",
  "p_created_by": ${createdBy},
  "p_end_date": "${escapeStringForJson(endDate)}",
  "p_repeat_type": "${escapeStringForJson(repeatType)}",
  "p_notes": "${escapeStringForJson(pNotes)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Unified  Slot Creation',
      apiUrl: '${baseUrl}/rpc/create_venue_open_slots_unified',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class VenueOpenSlotsGroupedCall {
  Future<ApiCallResponse> call({
    int? venueId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_venue_id": ${venueId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Venue Open Slots Grouped',
      apiUrl: '${baseUrl}/rpc/get_venue_open_slots_grouped',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetSingleSlotDetailsCall {
  Future<ApiCallResponse> call({
    int? slotId,
    int? pCurrentUserId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_slot_id": ${slotId},
 "p_current_user_id": ${pCurrentUserId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Single Slot Details',
      apiUrl: '${baseUrl}/rpc/get_venue_open_slot_by_id',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? stageName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.stage_name''',
      ));
  List<String>? stageImages(dynamic response) => (getJsonField(
        response,
        r'''$.data.stage_images''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? duration(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.duration''',
      ));
  String? startsInDuration(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.starts_in''',
      ));
  String? genre(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.genres''',
      ));
  String? entertainment(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.entertainment''',
      ));
}

class GetUserVenuesCall {
  Future<ApiCallResponse> call({
    int? userId,
    String? name = '',
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_user_id": ${userId},
  "p_name": "${escapeStringForJson(name)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get User Venues',
      apiUrl: '${baseUrl}/rpc/get_user_venues',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMusiciansListCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_search": "${escapeStringForJson(name)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Musicians List',
      apiUrl: '${baseUrl}/rpc/get_musicians',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpsertGigsCall {
  Future<ApiCallResponse> call({
    int? venueId,
    int? musicianId,
    int? slotid,
    int? venueOwnerId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "venue": ${venueId},
  "musician": ${musicianId},
  "slotid": ${slotid},
  "userid": ${venueOwnerId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Upsert gigs',
      apiUrl: '${baseUrl}/rpc/create_or_update_gig_flow',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ShowAllGigsCall {
  Future<ApiCallResponse> call({
    int? pUserId,
    String? pSearch = '',
    int? pVenueId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_user_id": "${pUserId}",
  "p_venue_id": ${pVenueId},
  "p_search": "${escapeStringForJson(pSearch)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Show All Gigs',
      apiUrl: '${baseUrl}/rpc/get_gigs_by_venue_owner',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? gigId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].gig_id''',
      ));
  int? venueId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].venue_id''',
      ));
  int? musicianId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].musician_id''',
      ));
  String? musicianName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].musician_name''',
      ));
  String? musicianDisplayImage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].musician_profile_photo''',
      ));
  String? lastMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].last_message_content''',
      ));
  bool? hasAnyMessageUnread(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].has_any_thread_message_unread''',
      ));
  String? venueName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].venue_name''',
      ));
}

class GetGigThreadsCall {
  Future<ApiCallResponse> call({
    int? gigid,
    bool? general,
    int? userId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_gig_id": ${gigid},
  "p_general": ${general},
  "p_user_id": ${userId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Gig Threads',
      apiUrl: '${baseUrl}/rpc/get_gig_threads',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetGigThreadDetailCall {
  Future<ApiCallResponse> call({
    int? threadId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_thread_id": ${threadId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Gig Thread Detail',
      apiUrl: '${baseUrl}/rpc/get_gig_thread_details_by_thread_id',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? gigStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].gig_status''',
      ));
  String? gigType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].gig_type''',
      ));
  String? venueNane(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].venue_name''',
      ));
  String? musicianName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].musician_name''',
      ));
  int? musicianId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].musician_id''',
      ));
  int? venueId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].venue_id''',
      ));
  String? musicianPhoto(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].musician_photo''',
      ));
  List<String>? musicianCategories(dynamic response) => (getJsonField(
        response,
        r'''$[:].musician_categories''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? gigStartDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].gig_start_date_formatted''',
      ));
  String? venuePhoto(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].venue_photo''',
      ));
  String? stageName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].stage_name''',
      ));
}

class GetEntertainmetCall {
  Future<ApiCallResponse> call({
    String? search = '',
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{"search": "${escapeStringForJson(search)}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Entertainmet',
      apiUrl: '${baseUrl}/rpc/get_entertainment',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetGenreCall {
  Future<ApiCallResponse> call({
    String? search = '',
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{"search": "${escapeStringForJson(search)}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetGenre',
      apiUrl: '${baseUrl}/rpc/get_genres',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetVenuePlannerSlotsCall {
  Future<ApiCallResponse> call({
    int? venueOwnerId,
    String? selectedDate = '',
    String? searchText = '',
    List<int>? venueIdsList,
    String? slotStatus = '',
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );
    final venueIds = _serializeList(venueIdsList);

    final ffApiRequestBody = '''
{
  "venue_owner_id_param": ${venueOwnerId},
  "selected_date": "${escapeStringForJson(selectedDate)}",
  "search_text": "${escapeStringForJson(searchText)}",
  "venue_ids": ${venueIds},
  "slot_status": "${escapeStringForJson(slotStatus)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Venue Planner Slots',
      apiUrl: '${baseUrl}/rpc/get_venue_planner_slots',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateVenueSlotsUnifiedCall {
  Future<ApiCallResponse> call({
    int? slotId,
    int? stageId,
    int? venueId,
    String? startDate = '',
    String? startTime = '',
    String? endTime = '',
    String? timeZone = '',
    int? updatedBy,
    String? endDate = '',
    String? repeatType = '',
    String? loadTime = '',
    String? loadDuration = '',
    String? notes = '',
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_slot_id": ${slotId},
  "p_stage_id": ${stageId},
  "p_venue_id": ${venueId},
  "p_start_date": "${escapeStringForJson(startDate)}",
  "p_start_time": "${escapeStringForJson(startTime)}",
  "p_end_time": "${escapeStringForJson(endTime)}",
  "p_time_zone": "${escapeStringForJson(timeZone)}",
  "p_updated_by": ${updatedBy},
  "p_end_date": "${escapeStringForJson(endDate)}",
  "p_repeat_type": "${escapeStringForJson(repeatType)}",
  "p_load_time": "${escapeStringForJson(loadTime)}",
  "p_load_duration": "${escapeStringForJson(loadDuration)}",
"p_notes": "${escapeStringForJson(notes)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Venue Slots Unified',
      apiUrl: '${baseUrl}/rpc/update_venue_open_slots_unified',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTodaysVenueRundownCall {
  Future<ApiCallResponse> call({
    int? venueOwnerId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "venue_owner_id": ${venueOwnerId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Todays venue Rundown',
      apiUrl: '${baseUrl}/rpc/get_todays_venue_rundown',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? date(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].formatted_date''',
      ));
  List? venueTodaySlots(dynamic response) => getJsonField(
        response,
        r'''$[:].venues[:].slots''',
        true,
      ) as List?;
  List? venueList(dynamic response) => getJsonField(
        response,
        r'''$[:].venue_list''',
        true,
      ) as List?;
}

class GetMusicianByCategoryCall {
  Future<ApiCallResponse> call({
    String? search = '',
    int? venueOwnerId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "search": "${escapeStringForJson(search)}",
  "venue_owner_id": ${venueOwnerId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Musician by Category',
      apiUrl: '${baseUrl}/rpc/get_musicians_by_category',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? genre(dynamic response) => getJsonField(
        response,
        r'''$.genres''',
        true,
      ) as List?;
  List? trending(dynamic response) => getJsonField(
        response,
        r'''$.trending''',
        true,
      ) as List?;
}

class GetSlotDetailsCall {
  Future<ApiCallResponse> call({
    int? slotId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "slot_id": ${slotId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Slot Details',
      apiUrl: '${baseUrl}/rpc/get_slot_details',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? slotId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.slot_id''',
      ));
  String? endTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.end_time''',
      ));
  String? loadTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.load_time''',
      ));
  String? groupUUID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.group_uuid''',
      ));
  String? stageName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.stage_name''',
      ));
  String? startDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.start_date''',
      ));
  String? startTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.start_time''',
      ));
  String? repeatType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.repeat_type''',
      ));
  String? daysFromNow(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.days_from_now''',
      ));
  String? loadDuration(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.load_duration''',
      ));
  String? performanceDuration(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.performance_duration''',
      ));
  int? venueId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.venue_id''',
      ));
  int? stageId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.stage_id''',
      ));
  String? endDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.end_date''',
      ));
}

class DeleteVenueAndReturnURLCall {
  Future<ApiCallResponse> call({
    int? pVenueId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_venue_id": ${pVenueId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Venue and Return URL',
      apiUrl: '${baseUrl}/rpc/delete_venue_and_return_urls',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteVenueOpenSlotsCall {
  Future<ApiCallResponse> call({
    int? slotId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_slot_id": ${slotId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Venue Open Slots',
      apiUrl: '${baseUrl}/rpc/delete_venue_open_slot',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteVenueCall {
  Future<ApiCallResponse> call({
    int? pVenueId,
    dynamic? pContentJsonJson,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final pContentJson = _serializeJson(pContentJsonJson);
    final ffApiRequestBody = '''
{
  "p_venue_id": ${pVenueId},
  "p_content_json": ${pContentJson}
  
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Venue',
      apiUrl: '${baseUrl}/rpc/delete_venue_content',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetSequenceCall {
  Future<ApiCallResponse> call({
    String? pGroupUuid = '',
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
    "p_group_uuid": "${escapeStringForJson(pGroupUuid)}"
  }''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Sequence',
      apiUrl: '${baseUrl}/rpc/get_slot_sequence',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MarkAllNotificationsReadCall {
  Future<ApiCallResponse> call({
    int? pUserId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_user_id": ${pUserId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Mark all notifications read ',
      apiUrl: '${baseUrl}/rpc/mark_all_notifications_read',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FetchStageWithSlotsCall {
  Future<ApiCallResponse> call({
    int? pVenueId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
    "p_venue_id": ${pVenueId}
  }''';
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Stage with Slots',
      apiUrl: '${baseUrl}/rpc/fetch_stage_with_slots',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class InsertStageContentCall {
  Future<ApiCallResponse> call({
    int? pStageId,
    List<String>? pContentList,
    List<String>? pThumbnailList,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );
    final pContent = _serializeList(pContentList);
    final pThumbnail = _serializeList(pThumbnailList);

    final ffApiRequestBody = '''
{
  "p_stage_id": ${pStageId},
  "p_content": ${pContent},
  "p_thumbnail": ${pThumbnail}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Insert Stage Content',
      apiUrl: '${baseUrl}/rpc/insert_stage_content',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetStageDetailCall {
  Future<ApiCallResponse> call({
    int? pStageId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_stage_id": ${pStageId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Stage Detail',
      apiUrl: '${baseUrl}/rpc/get_stage_details',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeactivateUserCall {
  Future<ApiCallResponse> call({
    int? pUserId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_user_id": ${pUserId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Deactivate user',
      apiUrl: '${baseUrl}/rpc/deactivate_user',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class HardDeleteVenueSlotCall {
  Future<ApiCallResponse> call({
    int? pSlotId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_slot_id": ${pSlotId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Hard delete venue slot',
      apiUrl: '${baseUrl}/rpc/hard_delete_venue_slot',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FetchMusiciansOfGigCall {
  Future<ApiCallResponse> call({
    int? pSlotId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_slot_id": ${pSlotId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch musicians of gig',
      apiUrl: '${baseUrl}/rpc/fetch_slot_musician_ids',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RemoveMusicianFromGigCall {
  Future<ApiCallResponse> call({
    int? pSenderId,
    int? pThreadId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_thread_id": ${pThreadId},
  "p_sender_id": ${pSenderId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Remove Musician From Gig ',
      apiUrl: '${baseUrl}/rpc/remove_musician_from_gig',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateGigInviteCall {
  Future<ApiCallResponse> call({
    int? pInviterId,
    String? pInviteType = '',
    int? pCountryCode,
    int? pPhone,
    String? pInviteeRole = '',
    int? pSlotId,
    int? pVenueId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = VenueGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_inviter_id": ${pInviterId},
  "p_invite_type": "${escapeStringForJson(pInviteType)}",
  "p_country_code": ${pCountryCode},
  "p_phone": "${pPhone}",
  "p_invitee_role": "${escapeStringForJson(pInviteeRole)}",
  "p_venue_id": ${pVenueId},
  "p_slot_id": ${pSlotId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Gig Invite',
      apiUrl: '${baseUrl}/rpc/create_gig_invite',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Venue Group Code

/// Start Musician Group Code

class MusicianGroup {
  static String getBaseUrl({
    String? projectURL,
    String? anonKey,
  }) {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    return 'https://${projectURL}.supabase.co/rest/v1';
  }

  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [anonKey]',
    'apikey': '[anonKey]',
  };
  static GetOpenSlotsThisWeekCall getOpenSlotsThisWeekCall =
      GetOpenSlotsThisWeekCall();
  static DiscoverOpenGigsCall discoverOpenGigsCall = DiscoverOpenGigsCall();
  static GetPerformerDetailsCall getPerformerDetailsCall =
      GetPerformerDetailsCall();
  static CreateMusicianOpenSlotCall createMusicianOpenSlotCall =
      CreateMusicianOpenSlotCall();
  static GetGigMusicianCall getGigMusicianCall = GetGigMusicianCall();
  static GetGenreEntertainmentTypeCall getGenreEntertainmentTypeCall =
      GetGenreEntertainmentTypeCall();
  static BookGigCall bookGigCall = BookGigCall();
  static GetContractDetailsCall getContractDetailsCall =
      GetContractDetailsCall();
  static GetMusicianPlannerSlotsCall getMusicianPlannerSlotsCall =
      GetMusicianPlannerSlotsCall();
  static BackOutCall backOutCall = BackOutCall();
  static GetMusicianOfferCountCall getMusicianOfferCountCall =
      GetMusicianOfferCountCall();
  static CheckBookingSlotCall checkBookingSlotCall = CheckBookingSlotCall();
}

class GetOpenSlotsThisWeekCall {
  Future<ApiCallResponse> call({
    int? musicianId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = MusicianGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_musician_id": ${musicianId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Open Slots This Week',
      apiUrl: '${baseUrl}/rpc/get_open_slots_this_week',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? venueName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.open_slots[:].venue_name''',
      ));
  String? venuePhoto(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.open_slots[:].venue_photo''',
      ));
  int? venueId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.open_slots[:].venue_id''',
      ));
  int? slotCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.open_slot_count''',
      ));
}

class DiscoverOpenGigsCall {
  Future<ApiCallResponse> call({
    int? pCurrentUserId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = MusicianGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_current_user_id": ${pCurrentUserId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Discover Open Gigs',
      apiUrl: '${baseUrl}/rpc/get_gigs_summary',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<LastMinuteGigModelStruct>? lastMinuteGigModelJsonList(
          dynamic response) =>
      (getJsonField(
        response,
        r'''$.last_minute_gigs''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => LastMinuteGigModelStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  List<RecurringGigsModelStruct>? recurringGigModelJsonList(dynamic response) =>
      (getJsonField(
        response,
        r'''$.recurring_gigs''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => RecurringGigsModelStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  List<OnetimeGigsModelStruct>? oneTimeGigModelJsonList(dynamic response) =>
      (getJsonField(
        response,
        r'''$.onetime_gigs''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => OnetimeGigsModelStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class GetPerformerDetailsCall {
  Future<ApiCallResponse> call({
    int? performerId,
    int? venueOwnerId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = MusicianGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "performer_id": ${performerId},
  "p_venue_owner_id": ${venueOwnerId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Performer Details',
      apiUrl: '${baseUrl}/rpc/get_performer_details',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateMusicianOpenSlotCall {
  Future<ApiCallResponse> call({
    int? createdBy,
    String? startDate = '',
    String? startTime = '',
    String? endTime = '',
    String? timeZone = '',
    String? endDate = '',
    String? repeatType = '',
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = MusicianGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_start_date": "${escapeStringForJson(startDate)}",
  "p_start_time": "${escapeStringForJson(startTime)}",
  "p_end_time": "${escapeStringForJson(endTime)}",
  "p_time_zone": "${escapeStringForJson(timeZone)}",
  "p_created_by": ${createdBy},
  "p_end_date": "${escapeStringForJson(endDate)}",
  "p_repeat_type": "${escapeStringForJson(repeatType)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Musician Open Slot',
      apiUrl: '${baseUrl}/rpc/create_musician_open_slots_unified',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetGigMusicianCall {
  Future<ApiCallResponse> call({
    String? pSearch = '',
    int? pUserId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = MusicianGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_user_id": ${pUserId},
  "p_search": "${escapeStringForJson(pSearch)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Gig Musician',
      apiUrl: '${baseUrl}/rpc/get_gigs_by_musician',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetGenreEntertainmentTypeCall {
  Future<ApiCallResponse> call({
    List<int>? pEntertainmentIdsList,
    List<int>? pGenreIdsList,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = MusicianGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );
    final pEntertainmentIds = _serializeList(pEntertainmentIdsList);
    final pGenreIds = _serializeList(pGenreIdsList);

    final ffApiRequestBody = '''
{
  "p_entertainment_ids": ${pEntertainmentIds},
  "p_genre_ids": ${pGenreIds}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Genre Entertainment type',
      apiUrl: '${baseUrl}/rpc/get_genre_and_entertainment_types',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? entertainmentType(dynamic response) => (getJsonField(
        response,
        r'''$.entertainment_types''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? genreType(dynamic response) => (getJsonField(
        response,
        r'''$.genre_types''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class BookGigCall {
  Future<ApiCallResponse> call({
    int? threadId,
    double? price,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = MusicianGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_thread_id": ${threadId},
  "p_price": ${price}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Book Gig',
      apiUrl: '${baseUrl}/rpc/book_venue_slots_by_thread',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetContractDetailsCall {
  Future<ApiCallResponse> call({
    int? slotId,
    int? gigThreaadId,
    int? musicianId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = MusicianGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_slot_id": ${slotId},
  "p_gig_thread_id": ${gigThreaadId},
  "p_musician_id": ${musicianId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Contract Details',
      apiUrl: '${baseUrl}/rpc/get_gig_contract_details',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? contractPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.contract_price''',
      ));
  bool? isBooked(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.is_booked''',
      ));
  String? slotPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.slot_price''',
      ));
}

class GetMusicianPlannerSlotsCall {
  Future<ApiCallResponse> call({
    int? musicianId,
    String? selectedDate = '',
    String? searchText = '',
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = MusicianGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "musician_id_param": ${musicianId},
  "selected_date": "${escapeStringForJson(selectedDate)}",
  "search_text": "${escapeStringForJson(searchText)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Musician Planner Slots',
      apiUrl: '${baseUrl}/rpc/get_musician_planner_slots',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BackOutCall {
  Future<ApiCallResponse> call({
    int? pThreadId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = MusicianGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_thread_id": ${pThreadId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Back Out',
      apiUrl: '${baseUrl}/rpc/cancel_venue_slots_by_thread',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMusicianOfferCountCall {
  Future<ApiCallResponse> call({
    int? musicianId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = MusicianGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_musician_id": ${musicianId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Musician Offer Count',
      apiUrl: '${baseUrl}/rpc/get_musician_open_offer_count',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CheckBookingSlotCall {
  Future<ApiCallResponse> call({
    int? pSlotId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = MusicianGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_slot_id": ${pSlotId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Check Booking Slot',
      apiUrl: '${baseUrl}/rpc/check_slot_booking_status',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Musician Group Code

/// Start Notification Group Code

class NotificationGroup {
  static String getBaseUrl({
    String? projectURL,
    String? anonKey,
  }) {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    return 'https://${projectURL}.supabase.co/functions/v1/';
  }

  static Map<String, String> headers = {
    'Authorization': 'Bearer [anonKey]',
    'Content-Type': 'application/json',
  };
  static SendNotificationCall sendNotificationCall = SendNotificationCall();
  static SendVenueCancelledNotificationsCall
      sendVenueCancelledNotificationsCall =
      SendVenueCancelledNotificationsCall();
  static NotifyMusicianForVenueCall notifyMusicianForVenueCall =
      NotifyMusicianForVenueCall();
}

class SendNotificationCall {
  Future<ApiCallResponse> call({
    String? title = '',
    String? description = '',
    List<String>? sendToList,
    String? type = '',
    String? usertype = '',
    dynamic? dataJson,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = NotificationGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );
    final sendTo = _serializeList(sendToList);
    final data = _serializeJson(dataJson);
    final ffApiRequestBody = '''
{
  "title": "${escapeStringForJson(title)}",
  "description": "${escapeStringForJson(description)}",
  "send_to": ${sendTo},
  "type": "${escapeStringForJson(type)}",
  "usertype": "${escapeStringForJson(usertype)}",
  "data": ${data}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Notification',
      apiUrl: '${baseUrl}send-notification',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${anonKey}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendVenueCancelledNotificationsCall {
  Future<ApiCallResponse> call({
    dynamic? jsonJson,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = NotificationGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final json = _serializeJson(jsonJson);
    final ffApiRequestBody = '''
[
  [
    ${json}
  ]
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Venue Cancelled Notifications',
      apiUrl: '${baseUrl}/send-venue-cancelled-notifications',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${anonKey}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class NotifyMusicianForVenueCall {
  Future<ApiCallResponse> call({
    int? venueId,
    int? slotId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = NotificationGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "venue_id": ${venueId},
  "slot_id": ${slotId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Notify Musician for Venue',
      apiUrl: '${baseUrl}/notify-new-venue-posted',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${anonKey}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Notification Group Code

/// Start Dynamic Link Group Code

class DynamicLinkGroup {
  static String getBaseUrl({
    String? projectURL,
    String? anonKey,
    String? token = '',
  }) {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    return 'https://${projectURL}.supabase.co/functions/v1/';
  }

  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
    'Content-Type': 'application/json',
    'apikey': '[anonKey]',
  };
  static SendGigInviteCall sendGigInviteCall = SendGigInviteCall();
  static ClaimInviteCall claimInviteCall = ClaimInviteCall();
}

class SendGigInviteCall {
  Future<ApiCallResponse> call({
    String? inviteToken = '',
    String? projectURL,
    String? anonKey,
    String? token = '',
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = DynamicLinkGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
      token: token,
    );

    final ffApiRequestBody = '''
{
  "invite_token": "${escapeStringForJson(inviteToken)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Gig Invite',
      apiUrl: '${baseUrl}/send-gig-invite',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ClaimInviteCall {
  Future<ApiCallResponse> call({
    int? userId,
    String? projectURL,
    String? anonKey,
    String? token = '',
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = DynamicLinkGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
      token: token,
    );

    final ffApiRequestBody = '''
{"user_id": ${userId}}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Claim Invite',
      apiUrl: '${baseUrl}/claim-invites',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Dynamic Link Group Code

/// Start Fan Group Code

class FanGroup {
  static String getBaseUrl({
    String? projectURL,
    String? anonKey,
  }) {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    return 'https://${projectURL}.supabase.co/rest/v1/rpc';
  }

  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [anonKey]',
    'apikey': '[anonKey]',
  };
  static GetGigsForFanCall getGigsForFanCall = GetGigsForFanCall();
  static GigDetailFanCall gigDetailFanCall = GigDetailFanCall();
}

class GetGigsForFanCall {
  Future<ApiCallResponse> call({
    String? pCurrentTime = '',
    String? pSearch = '',
    String? pSelectDate = '',
    String? pEntertainmentType = '',
    int? currentUserId,
    bool? pShowBookmarked,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = FanGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_current_time": "${escapeStringForJson(pCurrentTime)}",
  "p_fan_id": "${currentUserId}",
  "p_search": "${escapeStringForJson(pSearch)}",
  "p_select_date": "${escapeStringForJson(pSelectDate)}",
  "p_entertainment_type": "${escapeStringForJson(pEntertainmentType)}",
  "p_show_bookmarked": "${pShowBookmarked}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Gigs for Fan',
      apiUrl: '${baseUrl}/get_gigs_for_fan',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GigDetailFanCall {
  Future<ApiCallResponse> call({
    String? pGroupUuid = '',
    int? pFanId,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;
    final baseUrl = FanGroup.getBaseUrl(
      projectURL: projectURL,
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "p_group_uuid": "${escapeStringForJson(pGroupUuid)}",
  "p_fan_id": ${pFanId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Gig Detail Fan',
      apiUrl: '${baseUrl}/show_gig_detail_fan',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Fan Group Code

class CreateNewVenueCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? phoneNumber = '',
    String? address = '',
    String? description = '',
    String? services = '',
    String? website = '',
    String? venuePhoto = '',
    int? createdBy,
    String? instagramId = '',
    String? facebookId = '',
    String? xId = '',
    String? youtubeId = '',
    List<String>? contentList,
    List<int>? entertainmentIdList,
    List<int>? genreIdList,
    String? agePolicy = '',
    String? hoursOperation = '',
    String? amenities = '',
    String? venueCapacity = '',
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;

    final content = _serializeList(contentList);
    final entertainmentId = _serializeList(entertainmentIdList);
    final genreId = _serializeList(genreIdList);

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "email": "${escapeStringForJson(email)}",
  "phone_number": "${escapeStringForJson(phoneNumber)}",
  "address": "${escapeStringForJson(address)}",
  "description": "${escapeStringForJson(description)}",
  "services": "${escapeStringForJson(services)}",
  "website": "${escapeStringForJson(website)}",
  "venue_photo": "${escapeStringForJson(venuePhoto)}",
  "created_by": ${createdBy},
  "instagram_id": "${escapeStringForJson(instagramId)}",
  "facebook_id": "${escapeStringForJson(facebookId)}",
  "x_id": "${escapeStringForJson(xId)}",
  "youtube_id": "${escapeStringForJson(youtubeId)}",
  "content": ${content},
  "entertainment_id": ${entertainmentId},
  "genre_id": ${genreId},
  "age_policy": "${escapeStringForJson(agePolicy)}",
  "hours_operation": "${escapeStringForJson(hoursOperation)}",
  "amenities": "${escapeStringForJson(amenities)}",
  "venue_capacity": "${escapeStringForJson(venueCapacity)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createNewVenue',
      apiUrl: 'https://${projectURL}.supabase.co/rest/v1/venues?select=id',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '${anonKey}',
        'Authorization': 'Bearer ${anonKey}',
        'Prefer': 'return=representation',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? responseVenueId(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  static int? ididvenue(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].id''',
      ));
}

class CreateNewSlotCall {
  static Future<ApiCallResponse> call({
    String? startTime = '',
    String? endTime = '',
    String? startDate = '',
    String? loadTime = '',
    String? loadDuration = '',
    int? stageId,
    int? venueId,
    bool? booked,
    int? createdBy,
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;

    final ffApiRequestBody = '''
{
  "time_zone": "EST",
  "start_time": "${escapeStringForJson(startTime)}",
  "end_time": "${escapeStringForJson(endTime)}",
  "start_date": "${escapeStringForJson(startDate)}",
  "load_time": "${escapeStringForJson(loadTime)}",
  "load_duration": "${escapeStringForJson(loadDuration)}",
  "stage_id": ${stageId},
  "venue_id": ${venueId},
  "created_by": ${createdBy}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createNewSlot',
      apiUrl: 'https://${projectURL}.supabase.co/rest/v1/venue_open_slots',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '${anonKey}',
        'Authorization': 'Bearer ${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ShowPlannerCall {
  static Future<ApiCallResponse> call({
    String? pDate = '',
    String? projectURL,
    String? anonKey,
  }) async {
    projectURL ??= FFDevEnvironmentValues().projectURL;
    anonKey ??= FFDevEnvironmentValues().anonKey;

    final ffApiRequestBody = '''
{
  "p_date": "${escapeStringForJson(pDate)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Show Planner',
      apiUrl:
          'https://${projectURL}.supabase.co/rest/v1/rpc/fetch_events_by_date',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${anonKey}',
        'apikey': '${anonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
