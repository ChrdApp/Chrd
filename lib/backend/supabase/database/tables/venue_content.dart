import '../database.dart';

class VenueContentTable extends SupabaseTable<VenueContentRow> {
  @override
  String get tableName => 'venue_content';

  @override
  VenueContentRow createRow(Map<String, dynamic> data) => VenueContentRow(data);
}

class VenueContentRow extends SupabaseDataRow {
  VenueContentRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VenueContentTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  int? get venueId => getField<int>('venue_id');
  set venueId(int? value) => setField<int>('venue_id', value);

  String? get venueThumbnail => getField<String>('venue_thumbnail');
  set venueThumbnail(String? value) =>
      setField<String>('venue_thumbnail', value);
}
