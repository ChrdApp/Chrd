import '../database.dart';

class HighlightsTable extends SupabaseTable<HighlightsRow> {
  @override
  String get tableName => 'highlights';

  @override
  HighlightsRow createRow(Map<String, dynamic> data) => HighlightsRow(data);
}

class HighlightsRow extends SupabaseDataRow {
  HighlightsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HighlightsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get highlightVideo => getField<String>('highlight_video');
  set highlightVideo(String? value) =>
      setField<String>('highlight_video', value);

  String? get highlightImage => getField<String>('highlight_image');
  set highlightImage(String? value) =>
      setField<String>('highlight_image', value);

  int? get createdBy => getField<int>('created_by');
  set createdBy(int? value) => setField<int>('created_by', value);

  String? get highlightName => getField<String>('highlight_name');
  set highlightName(String? value) => setField<String>('highlight_name', value);

  String? get thumbnnailImage => getField<String>('thumbnnail_image');
  set thumbnnailImage(String? value) =>
      setField<String>('thumbnnail_image', value);
}
