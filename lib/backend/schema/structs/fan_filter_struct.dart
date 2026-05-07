// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FanFilterStruct extends BaseStruct {
  FanFilterStruct({
    String? selectedDate,
    String? selectedEntertainment,
  })  : _selectedDate = selectedDate,
        _selectedEntertainment = selectedEntertainment;

  // "selectedDate" field.
  String? _selectedDate;
  String get selectedDate => _selectedDate ?? '';
  set selectedDate(String? val) => _selectedDate = val;

  bool hasSelectedDate() => _selectedDate != null;

  // "selectedEntertainment" field.
  String? _selectedEntertainment;
  String get selectedEntertainment => _selectedEntertainment ?? '';
  set selectedEntertainment(String? val) => _selectedEntertainment = val;

  bool hasSelectedEntertainment() => _selectedEntertainment != null;

  static FanFilterStruct fromMap(Map<String, dynamic> data) => FanFilterStruct(
        selectedDate: data['selectedDate'] as String?,
        selectedEntertainment: data['selectedEntertainment'] as String?,
      );

  static FanFilterStruct? maybeFromMap(dynamic data) => data is Map
      ? FanFilterStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'selectedDate': _selectedDate,
        'selectedEntertainment': _selectedEntertainment,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'selectedDate': serializeParam(
          _selectedDate,
          ParamType.String,
        ),
        'selectedEntertainment': serializeParam(
          _selectedEntertainment,
          ParamType.String,
        ),
      }.withoutNulls;

  static FanFilterStruct fromSerializableMap(Map<String, dynamic> data) =>
      FanFilterStruct(
        selectedDate: deserializeParam(
          data['selectedDate'],
          ParamType.String,
          false,
        ),
        selectedEntertainment: deserializeParam(
          data['selectedEntertainment'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FanFilterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FanFilterStruct &&
        selectedDate == other.selectedDate &&
        selectedEntertainment == other.selectedEntertainment;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([selectedDate, selectedEntertainment]);
}

FanFilterStruct createFanFilterStruct({
  String? selectedDate,
  String? selectedEntertainment,
}) =>
    FanFilterStruct(
      selectedDate: selectedDate,
      selectedEntertainment: selectedEntertainment,
    );
