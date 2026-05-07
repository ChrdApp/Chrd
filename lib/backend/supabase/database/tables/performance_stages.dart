import '../database.dart';

class PerformanceStagesTable extends SupabaseTable<PerformanceStagesRow> {
  @override
  String get tableName => 'performance_stages';

  @override
  PerformanceStagesRow createRow(Map<String, dynamic> data) =>
      PerformanceStagesRow(data);
}

class PerformanceStagesRow extends SupabaseDataRow {
  PerformanceStagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PerformanceStagesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int get venueId => getField<int>('venue_id')!;
  set venueId(int value) => setField<int>('venue_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  List<String> get content => getListField<String>('content');
  set content(List<String>? value) => setListField<String>('content', value);
}
