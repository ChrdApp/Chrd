import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Venue Group Code

class VenueGroup {
  static String getBaseUrl() =>
      'https://kasnaqcqfuqnfydsjvpy.supabase.co/rest/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
}

class VenueOpenSlotsCall {
  Future<ApiCallResponse> call({
    int? pUserId,
  }) async {
    final baseUrl = VenueGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = VenueGroup.getBaseUrl();

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
  "p_repeat_type": "${escapeStringForJson(repeatType)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Unified  Slot Creation',
      apiUrl: '${baseUrl}/rpc/create_venue_open_slots_unified',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = VenueGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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

class GetSingleSlotDetailsCall {
  Future<ApiCallResponse> call({
    int? slotId,
    int? pCurrentUserId,
  }) async {
    final baseUrl = VenueGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = VenueGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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

class GetMusiciansListCall {
  Future<ApiCallResponse> call({
    String? name = '',
  }) async {
    final baseUrl = VenueGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = VenueGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = VenueGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = VenueGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = VenueGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
}

class GetEntertainmetCall {
  Future<ApiCallResponse> call({
    String? search = '',
  }) async {
    final baseUrl = VenueGroup.getBaseUrl();

    final ffApiRequestBody = '''
{"search": "${escapeStringForJson(search)}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Entertainmet',
      apiUrl: '${baseUrl}/rpc/get_entertainment',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = VenueGroup.getBaseUrl();

    final ffApiRequestBody = '''
{"search": "${escapeStringForJson(search)}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetGenre',
      apiUrl: '${baseUrl}/rpc/get_genres',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = VenueGroup.getBaseUrl();
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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = VenueGroup.getBaseUrl();

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
  "p_load_duration": "${escapeStringForJson(loadDuration)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Venue Slots Unified',
      apiUrl: '${baseUrl}/rpc/update_venue_open_slots_unified',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = VenueGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = VenueGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = VenueGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = VenueGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = VenueGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = VenueGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = VenueGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = VenueGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = VenueGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  static String getBaseUrl() =>
      'https://kasnaqcqfuqnfydsjvpy.supabase.co/rest/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
}

class GetOpenSlotsThisWeekCall {
  Future<ApiCallResponse> call({
    int? musicianId,
  }) async {
    final baseUrl = MusicianGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  Future<ApiCallResponse> call() async {
    final baseUrl = MusicianGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Discover Open Gigs',
      apiUrl: '${baseUrl}/rpc/get_gigs_summary',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
      },
      params: {},
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
  }) async {
    final baseUrl = MusicianGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = MusicianGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = MusicianGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = MusicianGroup.getBaseUrl();
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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = MusicianGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = MusicianGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = MusicianGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = MusicianGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = MusicianGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  static String getBaseUrl() =>
      'https://kasnaqcqfuqnfydsjvpy.supabase.co/functions/v1/';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = NotificationGroup.getBaseUrl();
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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = NotificationGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final baseUrl = NotificationGroup.getBaseUrl();

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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
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
      apiUrl:
          'https://kasnaqcqfuqnfydsjvpy.supabase.co/rest/v1/venues?select=id',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
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
      apiUrl:
          'https://kasnaqcqfuqnfydsjvpy.supabase.co/rest/v1/venue_open_slots',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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
  }) async {
    final ffApiRequestBody = '''
{
  "p_date": "${escapeStringForJson(pDate)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Show Planner',
      apiUrl:
          'https://kasnaqcqfuqnfydsjvpy.supabase.co/rest/v1/rpc/fetch_events_by_date',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs',
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

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
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
