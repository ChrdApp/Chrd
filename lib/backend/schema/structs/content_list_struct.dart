// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContentListStruct extends BaseStruct {
  ContentListStruct({
    String? thumbnailImage,
    String? content,
  })  : _thumbnailImage = thumbnailImage,
        _content = content;

  // "thumbnailImage" field.
  String? _thumbnailImage;
  String get thumbnailImage => _thumbnailImage ?? '';
  set thumbnailImage(String? val) => _thumbnailImage = val;

  bool hasThumbnailImage() => _thumbnailImage != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  static ContentListStruct fromMap(Map<String, dynamic> data) =>
      ContentListStruct(
        thumbnailImage: data['thumbnailImage'] as String?,
        content: data['content'] as String?,
      );

  static ContentListStruct? maybeFromMap(dynamic data) => data is Map
      ? ContentListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'thumbnailImage': _thumbnailImage,
        'content': _content,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'thumbnailImage': serializeParam(
          _thumbnailImage,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
      }.withoutNulls;

  static ContentListStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContentListStruct(
        thumbnailImage: deserializeParam(
          data['thumbnailImage'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ContentListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContentListStruct &&
        thumbnailImage == other.thumbnailImage &&
        content == other.content;
  }

  @override
  int get hashCode => const ListEquality().hash([thumbnailImage, content]);
}

ContentListStruct createContentListStruct({
  String? thumbnailImage,
  String? content,
}) =>
    ContentListStruct(
      thumbnailImage: thumbnailImage,
      content: content,
    );
