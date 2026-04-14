// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EntertainmentsCountListStruct extends BaseStruct {
  EntertainmentsCountListStruct({
    int? id,
    int? selectedCount,
  })  : _id = id,
        _selectedCount = selectedCount;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "SelectedCount" field.
  int? _selectedCount;
  int get selectedCount => _selectedCount ?? 0;
  set selectedCount(int? val) => _selectedCount = val;

  void incrementSelectedCount(int amount) =>
      selectedCount = selectedCount + amount;

  bool hasSelectedCount() => _selectedCount != null;

  static EntertainmentsCountListStruct fromMap(Map<String, dynamic> data) =>
      EntertainmentsCountListStruct(
        id: castToType<int>(data['id']),
        selectedCount: castToType<int>(data['SelectedCount']),
      );

  static EntertainmentsCountListStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? EntertainmentsCountListStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'SelectedCount': _selectedCount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'SelectedCount': serializeParam(
          _selectedCount,
          ParamType.int,
        ),
      }.withoutNulls;

  static EntertainmentsCountListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      EntertainmentsCountListStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        selectedCount: deserializeParam(
          data['SelectedCount'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'EntertainmentsCountListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EntertainmentsCountListStruct &&
        id == other.id &&
        selectedCount == other.selectedCount;
  }

  @override
  int get hashCode => const ListEquality().hash([id, selectedCount]);
}

EntertainmentsCountListStruct createEntertainmentsCountListStruct({
  int? id,
  int? selectedCount,
}) =>
    EntertainmentsCountListStruct(
      id: id,
      selectedCount: selectedCount,
    );
