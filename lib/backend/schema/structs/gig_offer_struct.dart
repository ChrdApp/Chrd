// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GigOfferStruct extends BaseStruct {
  GigOfferStruct({
    int? musicianId,
    int? venueId,
    String? dayOfWeek,
    int? perfromanceStage,
    String? notes,
    DateTime? showDateTime,
    int? slotId,
    String? venueName,
    String? venueImage,
  })  : _musicianId = musicianId,
        _venueId = venueId,
        _dayOfWeek = dayOfWeek,
        _perfromanceStage = perfromanceStage,
        _notes = notes,
        _showDateTime = showDateTime,
        _slotId = slotId,
        _venueName = venueName,
        _venueImage = venueImage;

  // "musician_id" field.
  int? _musicianId;
  int get musicianId => _musicianId ?? 0;
  set musicianId(int? val) => _musicianId = val;

  void incrementMusicianId(int amount) => musicianId = musicianId + amount;

  bool hasMusicianId() => _musicianId != null;

  // "venue_id" field.
  int? _venueId;
  int get venueId => _venueId ?? 0;
  set venueId(int? val) => _venueId = val;

  void incrementVenueId(int amount) => venueId = venueId + amount;

  bool hasVenueId() => _venueId != null;

  // "day_of_week" field.
  String? _dayOfWeek;
  String get dayOfWeek => _dayOfWeek ?? '';
  set dayOfWeek(String? val) => _dayOfWeek = val;

  bool hasDayOfWeek() => _dayOfWeek != null;

  // "perfromance_stage" field.
  int? _perfromanceStage;
  int get perfromanceStage => _perfromanceStage ?? 0;
  set perfromanceStage(int? val) => _perfromanceStage = val;

  void incrementPerfromanceStage(int amount) =>
      perfromanceStage = perfromanceStage + amount;

  bool hasPerfromanceStage() => _perfromanceStage != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  set notes(String? val) => _notes = val;

  bool hasNotes() => _notes != null;

  // "show_date_time" field.
  DateTime? _showDateTime;
  DateTime? get showDateTime => _showDateTime;
  set showDateTime(DateTime? val) => _showDateTime = val;

  bool hasShowDateTime() => _showDateTime != null;

  // "slot_id" field.
  int? _slotId;
  int get slotId => _slotId ?? 0;
  set slotId(int? val) => _slotId = val;

  void incrementSlotId(int amount) => slotId = slotId + amount;

  bool hasSlotId() => _slotId != null;

  // "venue_name" field.
  String? _venueName;
  String get venueName => _venueName ?? '';
  set venueName(String? val) => _venueName = val;

  bool hasVenueName() => _venueName != null;

  // "venue_image" field.
  String? _venueImage;
  String get venueImage => _venueImage ?? '';
  set venueImage(String? val) => _venueImage = val;

  bool hasVenueImage() => _venueImage != null;

  static GigOfferStruct fromMap(Map<String, dynamic> data) => GigOfferStruct(
        musicianId: castToType<int>(data['musician_id']),
        venueId: castToType<int>(data['venue_id']),
        dayOfWeek: data['day_of_week'] as String?,
        perfromanceStage: castToType<int>(data['perfromance_stage']),
        notes: data['notes'] as String?,
        showDateTime: data['show_date_time'] as DateTime?,
        slotId: castToType<int>(data['slot_id']),
        venueName: data['venue_name'] as String?,
        venueImage: data['venue_image'] as String?,
      );

  static GigOfferStruct? maybeFromMap(dynamic data) =>
      data is Map ? GigOfferStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'musician_id': _musicianId,
        'venue_id': _venueId,
        'day_of_week': _dayOfWeek,
        'perfromance_stage': _perfromanceStage,
        'notes': _notes,
        'show_date_time': _showDateTime,
        'slot_id': _slotId,
        'venue_name': _venueName,
        'venue_image': _venueImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'musician_id': serializeParam(
          _musicianId,
          ParamType.int,
        ),
        'venue_id': serializeParam(
          _venueId,
          ParamType.int,
        ),
        'day_of_week': serializeParam(
          _dayOfWeek,
          ParamType.String,
        ),
        'perfromance_stage': serializeParam(
          _perfromanceStage,
          ParamType.int,
        ),
        'notes': serializeParam(
          _notes,
          ParamType.String,
        ),
        'show_date_time': serializeParam(
          _showDateTime,
          ParamType.DateTime,
        ),
        'slot_id': serializeParam(
          _slotId,
          ParamType.int,
        ),
        'venue_name': serializeParam(
          _venueName,
          ParamType.String,
        ),
        'venue_image': serializeParam(
          _venueImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static GigOfferStruct fromSerializableMap(Map<String, dynamic> data) =>
      GigOfferStruct(
        musicianId: deserializeParam(
          data['musician_id'],
          ParamType.int,
          false,
        ),
        venueId: deserializeParam(
          data['venue_id'],
          ParamType.int,
          false,
        ),
        dayOfWeek: deserializeParam(
          data['day_of_week'],
          ParamType.String,
          false,
        ),
        perfromanceStage: deserializeParam(
          data['perfromance_stage'],
          ParamType.int,
          false,
        ),
        notes: deserializeParam(
          data['notes'],
          ParamType.String,
          false,
        ),
        showDateTime: deserializeParam(
          data['show_date_time'],
          ParamType.DateTime,
          false,
        ),
        slotId: deserializeParam(
          data['slot_id'],
          ParamType.int,
          false,
        ),
        venueName: deserializeParam(
          data['venue_name'],
          ParamType.String,
          false,
        ),
        venueImage: deserializeParam(
          data['venue_image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GigOfferStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GigOfferStruct &&
        musicianId == other.musicianId &&
        venueId == other.venueId &&
        dayOfWeek == other.dayOfWeek &&
        perfromanceStage == other.perfromanceStage &&
        notes == other.notes &&
        showDateTime == other.showDateTime &&
        slotId == other.slotId &&
        venueName == other.venueName &&
        venueImage == other.venueImage;
  }

  @override
  int get hashCode => const ListEquality().hash([
        musicianId,
        venueId,
        dayOfWeek,
        perfromanceStage,
        notes,
        showDateTime,
        slotId,
        venueName,
        venueImage
      ]);
}

GigOfferStruct createGigOfferStruct({
  int? musicianId,
  int? venueId,
  String? dayOfWeek,
  int? perfromanceStage,
  String? notes,
  DateTime? showDateTime,
  int? slotId,
  String? venueName,
  String? venueImage,
}) =>
    GigOfferStruct(
      musicianId: musicianId,
      venueId: venueId,
      dayOfWeek: dayOfWeek,
      perfromanceStage: perfromanceStage,
      notes: notes,
      showDateTime: showDateTime,
      slotId: slotId,
      venueName: venueName,
      venueImage: venueImage,
    );
