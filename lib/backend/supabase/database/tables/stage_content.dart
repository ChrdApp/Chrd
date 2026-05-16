import '../database.dart';

class StageContentTable extends SupabaseTable<StageContentRow> {
  @override
  String get tableName => 'stage_content';

  @override
  StageContentRow createRow(Map<String, dynamic> data) => StageContentRow(data);
}

class StageContentRow extends SupabaseDataRow {
  StageContentRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StageContentTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  int? get stageId => getField<int>('stage_id');
  set stageId(int? value) => setField<int>('stage_id', value);

  String? get contentThumbnail => getField<String>('content_thumbnail');
  set contentThumbnail(String? value) =>
      setField<String>('content_thumbnail', value);
}
