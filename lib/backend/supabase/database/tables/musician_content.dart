import '../database.dart';

class MusicianContentTable extends SupabaseTable<MusicianContentRow> {
  @override
  String get tableName => 'musician_content';

  @override
  MusicianContentRow createRow(Map<String, dynamic> data) =>
      MusicianContentRow(data);
}

class MusicianContentRow extends SupabaseDataRow {
  MusicianContentRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MusicianContentTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  int? get createdBy => getField<int>('created_by');
  set createdBy(int? value) => setField<int>('created_by', value);

  String? get videoThumbnail => getField<String>('video_thumbnail');
  set videoThumbnail(String? value) =>
      setField<String>('video_thumbnail', value);
}
