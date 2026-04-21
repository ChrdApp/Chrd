// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FanDataStruct extends BaseStruct {
  FanDataStruct({
    String? fanName,
    String? fanPhoneNumber,
    String? fanEmailAddress,
    List<int>? fanEntertainmentId,
    List<int>? fanGenreId,
  })  : _fanName = fanName,
        _fanPhoneNumber = fanPhoneNumber,
        _fanEmailAddress = fanEmailAddress,
        _fanEntertainmentId = fanEntertainmentId,
        _fanGenreId = fanGenreId;

  // "fanName" field.
  String? _fanName;
  String get fanName => _fanName ?? '';
  set fanName(String? val) => _fanName = val;

  bool hasFanName() => _fanName != null;

  // "fanPhoneNumber" field.
  String? _fanPhoneNumber;
  String get fanPhoneNumber => _fanPhoneNumber ?? '';
  set fanPhoneNumber(String? val) => _fanPhoneNumber = val;

  bool hasFanPhoneNumber() => _fanPhoneNumber != null;

  // "fanEmailAddress" field.
  String? _fanEmailAddress;
  String get fanEmailAddress => _fanEmailAddress ?? '';
  set fanEmailAddress(String? val) => _fanEmailAddress = val;

  bool hasFanEmailAddress() => _fanEmailAddress != null;

  // "fanEntertainmentId" field.
  List<int>? _fanEntertainmentId;
  List<int> get fanEntertainmentId => _fanEntertainmentId ?? const [];
  set fanEntertainmentId(List<int>? val) => _fanEntertainmentId = val;

  void updateFanEntertainmentId(Function(List<int>) updateFn) {
    updateFn(_fanEntertainmentId ??= []);
  }

  bool hasFanEntertainmentId() => _fanEntertainmentId != null;

  // "fanGenreId" field.
  List<int>? _fanGenreId;
  List<int> get fanGenreId => _fanGenreId ?? const [];
  set fanGenreId(List<int>? val) => _fanGenreId = val;

  void updateFanGenreId(Function(List<int>) updateFn) {
    updateFn(_fanGenreId ??= []);
  }

  bool hasFanGenreId() => _fanGenreId != null;

  static FanDataStruct fromMap(Map<String, dynamic> data) => FanDataStruct(
        fanName: data['fanName'] as String?,
        fanPhoneNumber: data['fanPhoneNumber'] as String?,
        fanEmailAddress: data['fanEmailAddress'] as String?,
        fanEntertainmentId: getDataList(data['fanEntertainmentId']),
        fanGenreId: getDataList(data['fanGenreId']),
      );

  static FanDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? FanDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'fanName': _fanName,
        'fanPhoneNumber': _fanPhoneNumber,
        'fanEmailAddress': _fanEmailAddress,
        'fanEntertainmentId': _fanEntertainmentId,
        'fanGenreId': _fanGenreId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fanName': serializeParam(
          _fanName,
          ParamType.String,
        ),
        'fanPhoneNumber': serializeParam(
          _fanPhoneNumber,
          ParamType.String,
        ),
        'fanEmailAddress': serializeParam(
          _fanEmailAddress,
          ParamType.String,
        ),
        'fanEntertainmentId': serializeParam(
          _fanEntertainmentId,
          ParamType.int,
          isList: true,
        ),
        'fanGenreId': serializeParam(
          _fanGenreId,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static FanDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      FanDataStruct(
        fanName: deserializeParam(
          data['fanName'],
          ParamType.String,
          false,
        ),
        fanPhoneNumber: deserializeParam(
          data['fanPhoneNumber'],
          ParamType.String,
          false,
        ),
        fanEmailAddress: deserializeParam(
          data['fanEmailAddress'],
          ParamType.String,
          false,
        ),
        fanEntertainmentId: deserializeParam<int>(
          data['fanEntertainmentId'],
          ParamType.int,
          true,
        ),
        fanGenreId: deserializeParam<int>(
          data['fanGenreId'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'FanDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FanDataStruct &&
        fanName == other.fanName &&
        fanPhoneNumber == other.fanPhoneNumber &&
        fanEmailAddress == other.fanEmailAddress &&
        listEquality.equals(fanEntertainmentId, other.fanEntertainmentId) &&
        listEquality.equals(fanGenreId, other.fanGenreId);
  }

  @override
  int get hashCode => const ListEquality().hash([
        fanName,
        fanPhoneNumber,
        fanEmailAddress,
        fanEntertainmentId,
        fanGenreId
      ]);
}

FanDataStruct createFanDataStruct({
  String? fanName,
  String? fanPhoneNumber,
  String? fanEmailAddress,
}) =>
    FanDataStruct(
      fanName: fanName,
      fanPhoneNumber: fanPhoneNumber,
      fanEmailAddress: fanEmailAddress,
    );
