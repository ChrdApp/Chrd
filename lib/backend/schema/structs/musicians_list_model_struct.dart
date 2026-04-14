// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MusiciansListModelStruct extends BaseStruct {
  MusiciansListModelStruct({
    int? id,
    String? name,
    String? profileImage,
  })  : _id = id,
        _name = name,
        _profileImage = profileImage;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "profile_image" field.
  String? _profileImage;
  String get profileImage => _profileImage ?? '';
  set profileImage(String? val) => _profileImage = val;

  bool hasProfileImage() => _profileImage != null;

  static MusiciansListModelStruct fromMap(Map<String, dynamic> data) =>
      MusiciansListModelStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        profileImage: data['profile_image'] as String?,
      );

  static MusiciansListModelStruct? maybeFromMap(dynamic data) => data is Map
      ? MusiciansListModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'profile_image': _profileImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'profile_image': serializeParam(
          _profileImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static MusiciansListModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MusiciansListModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        profileImage: deserializeParam(
          data['profile_image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MusiciansListModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MusiciansListModelStruct &&
        id == other.id &&
        name == other.name &&
        profileImage == other.profileImage;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, profileImage]);
}

MusiciansListModelStruct createMusiciansListModelStruct({
  int? id,
  String? name,
  String? profileImage,
}) =>
    MusiciansListModelStruct(
      id: id,
      name: name,
      profileImage: profileImage,
    );
