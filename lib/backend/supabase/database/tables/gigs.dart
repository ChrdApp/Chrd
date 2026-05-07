import '../database.dart';

class GigsTable extends SupabaseTable<GigsRow> {
  @override
  String get tableName => 'gigs';

  @override
  GigsRow createRow(Map<String, dynamic> data) => GigsRow(data);
}

class GigsRow extends SupabaseDataRow {
  GigsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GigsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get venueId => getField<int>('venue_id');
  set venueId(int? value) => setField<int>('venue_id', value);

  int? get musicianId => getField<int>('musician_id');
  set musicianId(int? value) => setField<int>('musician_id', value);

  String? get lastMessageContent => getField<String>('last_message_content');
  set lastMessageContent(String? value) =>
      setField<String>('last_message_content', value);

  bool? get hasAnyThreadMessageUnread =>
      getField<bool>('has_any_thread_message_unread');
  set hasAnyThreadMessageUnread(bool? value) =>
      setField<bool>('has_any_thread_message_unread', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  bool? get hasAnyThreadMessageUnreadMusician =>
      getField<bool>('has_any_thread_message_unread_musician');
  set hasAnyThreadMessageUnreadMusician(bool? value) =>
      setField<bool>('has_any_thread_message_unread_musician', value);
}
