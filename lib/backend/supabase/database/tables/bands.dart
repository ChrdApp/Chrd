import '../database.dart';

class BandsTable extends SupabaseTable<BandsRow> {
  @override
  String get tableName => 'bands';

  @override
  BandsRow createRow(Map<String, dynamic> data) => BandsRow(data);
}

class BandsRow extends SupabaseDataRow {
  BandsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BandsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get bandName => getField<String>('band_name');
  set bandName(String? value) => setField<String>('band_name', value);

  String? get bandDescription => getField<String>('band_description');
  set bandDescription(String? value) =>
      setField<String>('band_description', value);

  String? get bandImage => getField<String>('band_image');
  set bandImage(String? value) => setField<String>('band_image', value);

  int? get createdBy => getField<int>('created_by');
  set createdBy(int? value) => setField<int>('created_by', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
