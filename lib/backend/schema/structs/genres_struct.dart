// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GenresStruct extends BaseStruct {
  GenresStruct({
    String? image,
    String? name,
    int? id,
  })  : _image = image,
        _name = name,
        _id = id;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  static GenresStruct fromMap(Map<String, dynamic> data) => GenresStruct(
        image: data['image'] as String?,
        name: data['name'] as String?,
        id: castToType<int>(data['id']),
      );

  static GenresStruct? maybeFromMap(dynamic data) =>
      data is Map ? GenresStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'name': _name,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static GenresStruct fromSerializableMap(Map<String, dynamic> data) =>
      GenresStruct(
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'GenresStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GenresStruct &&
        image == other.image &&
        name == other.name &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([image, name, id]);
}

GenresStruct createGenresStruct({
  String? image,
  String? name,
  int? id,
}) =>
    GenresStruct(
      image: image,
      name: name,
      id: id,
    );
