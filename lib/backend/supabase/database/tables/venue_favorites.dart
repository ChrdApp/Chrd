import '../database.dart';

class VenueFavoritesTable extends SupabaseTable<VenueFavoritesRow> {
  @override
  String get tableName => 'venue_favorites';

  @override
  VenueFavoritesRow createRow(Map<String, dynamic> data) =>
      VenueFavoritesRow(data);
}

class VenueFavoritesRow extends SupabaseDataRow {
  VenueFavoritesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VenueFavoritesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get createdBy => getField<int>('created_by');
  set createdBy(int? value) => setField<int>('created_by', value);

  int? get musicianId => getField<int>('musician_id');
  set musicianId(int? value) => setField<int>('musician_id', value);
}
