import '../database.dart';

class EntertainmentTable extends SupabaseTable<EntertainmentRow> {
  @override
  String get tableName => 'entertainment';

  @override
  EntertainmentRow createRow(Map<String, dynamic> data) =>
      EntertainmentRow(data);
}

class EntertainmentRow extends SupabaseDataRow {
  EntertainmentRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EntertainmentTable();

  int get entertainmentId => getField<int>('entertainment_id')!;
  set entertainmentId(int value) => setField<int>('entertainment_id', value);

  String get entertainmentType => getField<String>('entertainment_type')!;
  set entertainmentType(String value) =>
      setField<String>('entertainment_type', value);

  String? get entertainmentImage => getField<String>('entertainment_image');
  set entertainmentImage(String? value) =>
      setField<String>('entertainment_image', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
