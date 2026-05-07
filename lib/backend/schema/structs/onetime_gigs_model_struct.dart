// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OnetimeGigsModelStruct extends BaseStruct {
  OnetimeGigsModelStruct({
    int? slotId,
    String? startDate,
    String? startTime,
    String? endTime,
    int? venueId,
    String? venueName,
    String? venuePhoto,
    String? groupUuid,
    String? repeatType,
    List<EntertainmentsModelStruct>? entertainments,
    List<GenreModelStruct>? genres,
    int? venueOwnerId,
    bool? isInquired,
  })  : _slotId = slotId,
        _startDate = startDate,
        _startTime = startTime,
        _endTime = endTime,
        _venueId = venueId,
        _venueName = venueName,
        _venuePhoto = venuePhoto,
        _groupUuid = groupUuid,
        _repeatType = repeatType,
        _entertainments = entertainments,
        _genres = genres,
        _venueOwnerId = venueOwnerId,
        _isInquired = isInquired;

  // "slot_id" field.
  int? _slotId;
  int get slotId => _slotId ?? 0;
  set slotId(int? val) => _slotId = val;

  void incrementSlotId(int amount) => slotId = slotId + amount;

  bool hasSlotId() => _slotId != null;

  // "start_date" field.
  String? _startDate;
  String get startDate => _startDate ?? '';
  set startDate(String? val) => _startDate = val;

  bool hasStartDate() => _startDate != null;

  // "start_time" field.
  String? _startTime;
  String get startTime => _startTime ?? '';
  set startTime(String? val) => _startTime = val;

  bool hasStartTime() => _startTime != null;

  // "end_time" field.
  String? _endTime;
  String get endTime => _endTime ?? '';
  set endTime(String? val) => _endTime = val;

  bool hasEndTime() => _endTime != null;

  // "venue_id" field.
  int? _venueId;
  int get venueId => _venueId ?? 0;
  set venueId(int? val) => _venueId = val;

  void incrementVenueId(int amount) => venueId = venueId + amount;

  bool hasVenueId() => _venueId != null;

  // "venue_name" field.
  String? _venueName;
  String get venueName => _venueName ?? '';
  set venueName(String? val) => _venueName = val;

  bool hasVenueName() => _venueName != null;

  // "venue_photo" field.
  String? _venuePhoto;
  String get venuePhoto => _venuePhoto ?? '';
  set venuePhoto(String? val) => _venuePhoto = val;

  bool hasVenuePhoto() => _venuePhoto != null;

  // "group_uuid" field.
  String? _groupUuid;
  String get groupUuid => _groupUuid ?? '';
  set groupUuid(String? val) => _groupUuid = val;

  bool hasGroupUuid() => _groupUuid != null;

  // "repeat_type" field.
  String? _repeatType;
  String get repeatType => _repeatType ?? '';
  set repeatType(String? val) => _repeatType = val;

  bool hasRepeatType() => _repeatType != null;

  // "entertainments" field.
  List<EntertainmentsModelStruct>? _entertainments;
  List<EntertainmentsModelStruct> get entertainments =>
      _entertainments ?? const [];
  set entertainments(List<EntertainmentsModelStruct>? val) =>
      _entertainments = val;

  void updateEntertainments(
      Function(List<EntertainmentsModelStruct>) updateFn) {
    updateFn(_entertainments ??= []);
  }

  bool hasEntertainments() => _entertainments != null;

  // "genres" field.
  List<GenreModelStruct>? _genres;
  List<GenreModelStruct> get genres => _genres ?? const [];
  set genres(List<GenreModelStruct>? val) => _genres = val;

  void updateGenres(Function(List<GenreModelStruct>) updateFn) {
    updateFn(_genres ??= []);
  }

  bool hasGenres() => _genres != null;

  // "venue_owner_id" field.
  int? _venueOwnerId;
  int get venueOwnerId => _venueOwnerId ?? 0;
  set venueOwnerId(int? val) => _venueOwnerId = val;

  void incrementVenueOwnerId(int amount) =>
      venueOwnerId = venueOwnerId + amount;

  bool hasVenueOwnerId() => _venueOwnerId != null;

  // "is_inquired" field.
  bool? _isInquired;
  bool get isInquired => _isInquired ?? false;
  set isInquired(bool? val) => _isInquired = val;

  bool hasIsInquired() => _isInquired != null;

  static OnetimeGigsModelStruct fromMap(Map<String, dynamic> data) =>
      OnetimeGigsModelStruct(
        slotId: castToType<int>(data['slot_id']),
        startDate: data['start_date'] as String?,
        startTime: data['start_time'] as String?,
        endTime: data['end_time'] as String?,
        venueId: castToType<int>(data['venue_id']),
        venueName: data['venue_name'] as String?,
        venuePhoto: data['venue_photo'] as String?,
        groupUuid: data['group_uuid'] as String?,
        repeatType: data['repeat_type'] as String?,
        entertainments: getStructList(
          data['entertainments'],
          EntertainmentsModelStruct.fromMap,
        ),
        genres: getStructList(
          data['genres'],
          GenreModelStruct.fromMap,
        ),
        venueOwnerId: castToType<int>(data['venue_owner_id']),
        isInquired: data['is_inquired'] as bool?,
      );

  static OnetimeGigsModelStruct? maybeFromMap(dynamic data) => data is Map
      ? OnetimeGigsModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'slot_id': _slotId,
        'start_date': _startDate,
        'start_time': _startTime,
        'end_time': _endTime,
        'venue_id': _venueId,
        'venue_name': _venueName,
        'venue_photo': _venuePhoto,
        'group_uuid': _groupUuid,
        'repeat_type': _repeatType,
        'entertainments': _entertainments?.map((e) => e.toMap()).toList(),
        'genres': _genres?.map((e) => e.toMap()).toList(),
        'venue_owner_id': _venueOwnerId,
        'is_inquired': _isInquired,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'slot_id': serializeParam(
          _slotId,
          ParamType.int,
        ),
        'start_date': serializeParam(
          _startDate,
          ParamType.String,
        ),
        'start_time': serializeParam(
          _startTime,
          ParamType.String,
        ),
        'end_time': serializeParam(
          _endTime,
          ParamType.String,
        ),
        'venue_id': serializeParam(
          _venueId,
          ParamType.int,
        ),
        'venue_name': serializeParam(
          _venueName,
          ParamType.String,
        ),
        'venue_photo': serializeParam(
          _venuePhoto,
          ParamType.String,
        ),
        'group_uuid': serializeParam(
          _groupUuid,
          ParamType.String,
        ),
        'repeat_type': serializeParam(
          _repeatType,
          ParamType.String,
        ),
        'entertainments': serializeParam(
          _entertainments,
          ParamType.DataStruct,
          isList: true,
        ),
        'genres': serializeParam(
          _genres,
          ParamType.DataStruct,
          isList: true,
        ),
        'venue_owner_id': serializeParam(
          _venueOwnerId,
          ParamType.int,
        ),
        'is_inquired': serializeParam(
          _isInquired,
          ParamType.bool,
        ),
      }.withoutNulls;

  static OnetimeGigsModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      OnetimeGigsModelStruct(
        slotId: deserializeParam(
          data['slot_id'],
          ParamType.int,
          false,
        ),
        startDate: deserializeParam(
          data['start_date'],
          ParamType.String,
          false,
        ),
        startTime: deserializeParam(
          data['start_time'],
          ParamType.String,
          false,
        ),
        endTime: deserializeParam(
          data['end_time'],
          ParamType.String,
          false,
        ),
        venueId: deserializeParam(
          data['venue_id'],
          ParamType.int,
          false,
        ),
        venueName: deserializeParam(
          data['venue_name'],
          ParamType.String,
          false,
        ),
        venuePhoto: deserializeParam(
          data['venue_photo'],
          ParamType.String,
          false,
        ),
        groupUuid: deserializeParam(
          data['group_uuid'],
          ParamType.String,
          false,
        ),
        repeatType: deserializeParam(
          data['repeat_type'],
          ParamType.String,
          false,
        ),
        entertainments: deserializeStructParam<EntertainmentsModelStruct>(
          data['entertainments'],
          ParamType.DataStruct,
          true,
          structBuilder: EntertainmentsModelStruct.fromSerializableMap,
        ),
        genres: deserializeStructParam<GenreModelStruct>(
          data['genres'],
          ParamType.DataStruct,
          true,
          structBuilder: GenreModelStruct.fromSerializableMap,
        ),
        venueOwnerId: deserializeParam(
          data['venue_owner_id'],
          ParamType.int,
          false,
        ),
        isInquired: deserializeParam(
          data['is_inquired'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'OnetimeGigsModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OnetimeGigsModelStruct &&
        slotId == other.slotId &&
        startDate == other.startDate &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        venueId == other.venueId &&
        venueName == other.venueName &&
        venuePhoto == other.venuePhoto &&
        groupUuid == other.groupUuid &&
        repeatType == other.repeatType &&
        listEquality.equals(entertainments, other.entertainments) &&
        listEquality.equals(genres, other.genres) &&
        venueOwnerId == other.venueOwnerId &&
        isInquired == other.isInquired;
  }

  @override
  int get hashCode => const ListEquality().hash([
        slotId,
        startDate,
        startTime,
        endTime,
        venueId,
        venueName,
        venuePhoto,
        groupUuid,
        repeatType,
        entertainments,
        genres,
        venueOwnerId,
        isInquired
      ]);
}

OnetimeGigsModelStruct createOnetimeGigsModelStruct({
  int? slotId,
  String? startDate,
  String? startTime,
  String? endTime,
  int? venueId,
  String? venueName,
  String? venuePhoto,
  String? groupUuid,
  String? repeatType,
  int? venueOwnerId,
  bool? isInquired,
}) =>
    OnetimeGigsModelStruct(
      slotId: slotId,
      startDate: startDate,
      startTime: startTime,
      endTime: endTime,
      venueId: venueId,
      venueName: venueName,
      venuePhoto: venuePhoto,
      groupUuid: groupUuid,
      repeatType: repeatType,
      venueOwnerId: venueOwnerId,
      isInquired: isInquired,
    );
