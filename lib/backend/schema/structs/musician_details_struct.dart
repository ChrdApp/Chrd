// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MusicianDetailsStruct extends BaseStruct {
  MusicianDetailsStruct({
    String? musicianImage,
  }) : _musicianImage = musicianImage;

  // "musician_Image" field.
  String? _musicianImage;
  String get musicianImage => _musicianImage ?? '';
  set musicianImage(String? val) => _musicianImage = val;

  bool hasMusicianImage() => _musicianImage != null;

  static MusicianDetailsStruct fromMap(Map<String, dynamic> data) =>
      MusicianDetailsStruct(
        musicianImage: data['musician_Image'] as String?,
      );

  static MusicianDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? MusicianDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'musician_Image': _musicianImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'musician_Image': serializeParam(
          _musicianImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static MusicianDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      MusicianDetailsStruct(
        musicianImage: deserializeParam(
          data['musician_Image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MusicianDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MusicianDetailsStruct &&
        musicianImage == other.musicianImage;
  }

  @override
  int get hashCode => const ListEquality().hash([musicianImage]);
}

MusicianDetailsStruct createMusicianDetailsStruct({
  String? musicianImage,
}) =>
    MusicianDetailsStruct(
      musicianImage: musicianImage,
    );
