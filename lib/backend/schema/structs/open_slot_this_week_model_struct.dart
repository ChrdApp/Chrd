// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OpenSlotThisWeekModelStruct extends BaseStruct {
  OpenSlotThisWeekModelStruct({
    String? venuePhoto,
    String? venueName,
    int? venueId,
    int? slotId,
    String? startDate,
    String? startTime,
    String? groupUuid,
  })  : _venuePhoto = venuePhoto,
        _venueName = venueName,
        _venueId = venueId,
        _slotId = slotId,
        _startDate = startDate,
        _startTime = startTime,
        _groupUuid = groupUuid;

  // "venue_photo" field.
  String? _venuePhoto;
  String get venuePhoto => _venuePhoto ?? '';
  set venuePhoto(String? val) => _venuePhoto = val;

  bool hasVenuePhoto() => _venuePhoto != null;

  // "venue_name" field.
  String? _venueName;
  String get venueName => _venueName ?? '';
  set venueName(String? val) => _venueName = val;

  bool hasVenueName() => _venueName != null;

  // "venue_id" field.
  int? _venueId;
  int get venueId => _venueId ?? 0;
  set venueId(int? val) => _venueId = val;

  void incrementVenueId(int amount) => venueId = venueId + amount;

  bool hasVenueId() => _venueId != null;

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

  // "group_uuid" field.
  String? _groupUuid;
  String get groupUuid => _groupUuid ?? '';
  set groupUuid(String? val) => _groupUuid = val;

  bool hasGroupUuid() => _groupUuid != null;

  static OpenSlotThisWeekModelStruct fromMap(Map<String, dynamic> data) =>
      OpenSlotThisWeekModelStruct(
        venuePhoto: data['venue_photo'] as String?,
        venueName: data['venue_name'] as String?,
        venueId: castToType<int>(data['venue_id']),
        slotId: castToType<int>(data['slot_id']),
        startDate: data['start_date'] as String?,
        startTime: data['start_time'] as String?,
        groupUuid: data['group_uuid'] as String?,
      );

  static OpenSlotThisWeekModelStruct? maybeFromMap(dynamic data) => data is Map
      ? OpenSlotThisWeekModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'venue_photo': _venuePhoto,
        'venue_name': _venueName,
        'venue_id': _venueId,
        'slot_id': _slotId,
        'start_date': _startDate,
        'start_time': _startTime,
        'group_uuid': _groupUuid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'venue_photo': serializeParam(
          _venuePhoto,
          ParamType.String,
        ),
        'venue_name': serializeParam(
          _venueName,
          ParamType.String,
        ),
        'venue_id': serializeParam(
          _venueId,
          ParamType.int,
        ),
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
        'group_uuid': serializeParam(
          _groupUuid,
          ParamType.String,
        ),
      }.withoutNulls;

  static OpenSlotThisWeekModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      OpenSlotThisWeekModelStruct(
        venuePhoto: deserializeParam(
          data['venue_photo'],
          ParamType.String,
          false,
        ),
        venueName: deserializeParam(
          data['venue_name'],
          ParamType.String,
          false,
        ),
        venueId: deserializeParam(
          data['venue_id'],
          ParamType.int,
          false,
        ),
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
        groupUuid: deserializeParam(
          data['group_uuid'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OpenSlotThisWeekModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OpenSlotThisWeekModelStruct &&
        venuePhoto == other.venuePhoto &&
        venueName == other.venueName &&
        venueId == other.venueId &&
        slotId == other.slotId &&
        startDate == other.startDate &&
        startTime == other.startTime &&
        groupUuid == other.groupUuid;
  }

  @override
  int get hashCode => const ListEquality().hash([
        venuePhoto,
        venueName,
        venueId,
        slotId,
        startDate,
        startTime,
        groupUuid
      ]);
}

OpenSlotThisWeekModelStruct createOpenSlotThisWeekModelStruct({
  String? venuePhoto,
  String? venueName,
  int? venueId,
  int? slotId,
  String? startDate,
  String? startTime,
  String? groupUuid,
}) =>
    OpenSlotThisWeekModelStruct(
      venuePhoto: venuePhoto,
      venueName: venueName,
      venueId: venueId,
      slotId: slotId,
      startDate: startDate,
      startTime: startTime,
      groupUuid: groupUuid,
    );
