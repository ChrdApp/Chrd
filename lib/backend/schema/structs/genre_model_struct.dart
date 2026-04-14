// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GenreModelStruct extends BaseStruct {
  GenreModelStruct({
    String? genreName,
    String? genreImage,
  })  : _genreName = genreName,
        _genreImage = genreImage;

  // "genre_name" field.
  String? _genreName;
  String get genreName => _genreName ?? '';
  set genreName(String? val) => _genreName = val;

  bool hasGenreName() => _genreName != null;

  // "genre_image" field.
  String? _genreImage;
  String get genreImage => _genreImage ?? '';
  set genreImage(String? val) => _genreImage = val;

  bool hasGenreImage() => _genreImage != null;

  static GenreModelStruct fromMap(Map<String, dynamic> data) =>
      GenreModelStruct(
        genreName: data['genre_name'] as String?,
        genreImage: data['genre_image'] as String?,
      );

  static GenreModelStruct? maybeFromMap(dynamic data) => data is Map
      ? GenreModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'genre_name': _genreName,
        'genre_image': _genreImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'genre_name': serializeParam(
          _genreName,
          ParamType.String,
        ),
        'genre_image': serializeParam(
          _genreImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static GenreModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      GenreModelStruct(
        genreName: deserializeParam(
          data['genre_name'],
          ParamType.String,
          false,
        ),
        genreImage: deserializeParam(
          data['genre_image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GenreModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GenreModelStruct &&
        genreName == other.genreName &&
        genreImage == other.genreImage;
  }

  @override
  int get hashCode => const ListEquality().hash([genreName, genreImage]);
}

GenreModelStruct createGenreModelStruct({
  String? genreName,
  String? genreImage,
}) =>
    GenreModelStruct(
      genreName: genreName,
      genreImage: genreImage,
    );
