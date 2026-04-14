// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EntertainmentsModelStruct extends BaseStruct {
  EntertainmentsModelStruct({
    String? entertainmentName,
    String? entertainmentImage,
  })  : _entertainmentName = entertainmentName,
        _entertainmentImage = entertainmentImage;

  // "entertainment_name" field.
  String? _entertainmentName;
  String get entertainmentName => _entertainmentName ?? '';
  set entertainmentName(String? val) => _entertainmentName = val;

  bool hasEntertainmentName() => _entertainmentName != null;

  // "entertainment_image" field.
  String? _entertainmentImage;
  String get entertainmentImage => _entertainmentImage ?? '';
  set entertainmentImage(String? val) => _entertainmentImage = val;

  bool hasEntertainmentImage() => _entertainmentImage != null;

  static EntertainmentsModelStruct fromMap(Map<String, dynamic> data) =>
      EntertainmentsModelStruct(
        entertainmentName: data['entertainment_name'] as String?,
        entertainmentImage: data['entertainment_image'] as String?,
      );

  static EntertainmentsModelStruct? maybeFromMap(dynamic data) => data is Map
      ? EntertainmentsModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'entertainment_name': _entertainmentName,
        'entertainment_image': _entertainmentImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'entertainment_name': serializeParam(
          _entertainmentName,
          ParamType.String,
        ),
        'entertainment_image': serializeParam(
          _entertainmentImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static EntertainmentsModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      EntertainmentsModelStruct(
        entertainmentName: deserializeParam(
          data['entertainment_name'],
          ParamType.String,
          false,
        ),
        entertainmentImage: deserializeParam(
          data['entertainment_image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'EntertainmentsModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EntertainmentsModelStruct &&
        entertainmentName == other.entertainmentName &&
        entertainmentImage == other.entertainmentImage;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([entertainmentName, entertainmentImage]);
}

EntertainmentsModelStruct createEntertainmentsModelStruct({
  String? entertainmentName,
  String? entertainmentImage,
}) =>
    EntertainmentsModelStruct(
      entertainmentName: entertainmentName,
      entertainmentImage: entertainmentImage,
    );
