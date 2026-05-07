import '../database.dart';

class GigOffersTable extends SupabaseTable<GigOffersRow> {
  @override
  String get tableName => 'gig_offers';

  @override
  GigOffersRow createRow(Map<String, dynamic> data) => GigOffersRow(data);
}

class GigOffersRow extends SupabaseDataRow {
  GigOffersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GigOffersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get musicianId => getField<int>('musician_id');
  set musicianId(int? value) => setField<int>('musician_id', value);

  int? get venueId => getField<int>('venue_id');
  set venueId(int? value) => setField<int>('venue_id', value);

  String? get dayOfWeek => getField<String>('day_of_week');
  set dayOfWeek(String? value) => setField<String>('day_of_week', value);

  int? get perfromanceStage => getField<int>('perfromance_stage');
  set perfromanceStage(int? value) => setField<int>('perfromance_stage', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  DateTime? get showDateTime => getField<DateTime>('show_date_time');
  set showDateTime(DateTime? value) =>
      setField<DateTime>('show_date_time', value);
}
