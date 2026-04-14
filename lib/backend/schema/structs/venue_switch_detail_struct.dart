// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VenueSwitchDetailStruct extends BaseStruct {
  VenueSwitchDetailStruct({
    int? venueId,
    String? venueName,
  })  : _venueId = venueId,
        _venueName = venueName;

  // "venueId" field.
  int? _venueId;
  int get venueId => _venueId ?? 0;
  set venueId(int? val) => _venueId = val;

  void incrementVenueId(int amount) => venueId = venueId + amount;

  bool hasVenueId() => _venueId != null;

  // "venueName" field.
  String? _venueName;
  String get venueName => _venueName ?? '';
  set venueName(String? val) => _venueName = val;

  bool hasVenueName() => _venueName != null;

  static VenueSwitchDetailStruct fromMap(Map<String, dynamic> data) =>
      VenueSwitchDetailStruct(
        venueId: castToType<int>(data['venueId']),
        venueName: data['venueName'] as String?,
      );

  static VenueSwitchDetailStruct? maybeFromMap(dynamic data) => data is Map
      ? VenueSwitchDetailStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'venueId': _venueId,
        'venueName': _venueName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'venueId': serializeParam(
          _venueId,
          ParamType.int,
        ),
        'venueName': serializeParam(
          _venueName,
          ParamType.String,
        ),
      }.withoutNulls;

  static VenueSwitchDetailStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      VenueSwitchDetailStruct(
        venueId: deserializeParam(
          data['venueId'],
          ParamType.int,
          false,
        ),
        venueName: deserializeParam(
          data['venueName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VenueSwitchDetailStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VenueSwitchDetailStruct &&
        venueId == other.venueId &&
        venueName == other.venueName;
  }

  @override
  int get hashCode => const ListEquality().hash([venueId, venueName]);
}

VenueSwitchDetailStruct createVenueSwitchDetailStruct({
  int? venueId,
  String? venueName,
}) =>
    VenueSwitchDetailStruct(
      venueId: venueId,
      venueName: venueName,
    );
