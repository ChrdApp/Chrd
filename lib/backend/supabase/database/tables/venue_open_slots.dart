import '../database.dart';

class VenueOpenSlotsTable extends SupabaseTable<VenueOpenSlotsRow> {
  @override
  String get tableName => 'venue_open_slots';

  @override
  VenueOpenSlotsRow createRow(Map<String, dynamic> data) =>
      VenueOpenSlotsRow(data);
}

class VenueOpenSlotsRow extends SupabaseDataRow {
  VenueOpenSlotsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VenueOpenSlotsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get timeZone => getField<String>('time_zone');
  set timeZone(String? value) => setField<String>('time_zone', value);

  PostgresTime? get startTime => getField<PostgresTime>('start_time');
  set startTime(PostgresTime? value) =>
      setField<PostgresTime>('start_time', value);

  PostgresTime? get endTime => getField<PostgresTime>('end_time');
  set endTime(PostgresTime? value) => setField<PostgresTime>('end_time', value);

  DateTime? get startDate => getField<DateTime>('start_date');
  set startDate(DateTime? value) => setField<DateTime>('start_date', value);

  PostgresTime? get loadTime => getField<PostgresTime>('load_time');
  set loadTime(PostgresTime? value) =>
      setField<PostgresTime>('load_time', value);

  String? get loadDuration => getField<String>('load_duration');
  set loadDuration(String? value) => setField<String>('load_duration', value);

  int? get stageId => getField<int>('stage_id');
  set stageId(int? value) => setField<int>('stage_id', value);

  int? get venueId => getField<int>('venue_id');
  set venueId(int? value) => setField<int>('venue_id', value);

  bool? get isBooked => getField<bool>('is_booked');
  set isBooked(bool? value) => setField<bool>('is_booked', value);

  int? get musicianId => getField<int>('musician_id');
  set musicianId(int? value) => setField<int>('musician_id', value);

  int? get createdBy => getField<int>('created_by');
  set createdBy(int? value) => setField<int>('created_by', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  DateTime? get endDate => getField<DateTime>('end_date');
  set endDate(DateTime? value) => setField<DateTime>('end_date', value);

  bool? get backedOut => getField<bool>('backed_out');
  set backedOut(bool? value) => setField<bool>('backed_out', value);

  String? get repeatType => getField<String>('repeat_type');
  set repeatType(String? value) => setField<String>('repeat_type', value);

  String? get groupUuid => getField<String>('group_uuid');
  set groupUuid(String? value) => setField<String>('group_uuid', value);

  String? get day => getField<String>('day');
  set day(String? value) => setField<String>('day', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);
}
