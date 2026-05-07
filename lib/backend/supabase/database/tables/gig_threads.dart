import '../database.dart';

class GigThreadsTable extends SupabaseTable<GigThreadsRow> {
  @override
  String get tableName => 'gig_threads';

  @override
  GigThreadsRow createRow(Map<String, dynamic> data) => GigThreadsRow(data);
}

class GigThreadsRow extends SupabaseDataRow {
  GigThreadsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GigThreadsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get gigId => getField<int>('gig_id');
  set gigId(int? value) => setField<int>('gig_id', value);

  int? get receiverId => getField<int>('receiver_id');
  set receiverId(int? value) => setField<int>('receiver_id', value);

  String? get gigType => getField<String>('gig_type');
  set gigType(String? value) => setField<String>('gig_type', value);

  String? get gigStatus => getField<String>('gig_status');
  set gigStatus(String? value) => setField<String>('gig_status', value);

  DateTime? get gigStartDate => getField<DateTime>('gig_start_date');
  set gigStartDate(DateTime? value) =>
      setField<DateTime>('gig_start_date', value);

  bool? get hasAnyMessageUnread => getField<bool>('has_any_message_unread');
  set hasAnyMessageUnread(bool? value) =>
      setField<bool>('has_any_message_unread', value);

  String? get lastMessageContent => getField<String>('last_message_content');
  set lastMessageContent(String? value) =>
      setField<String>('last_message_content', value);

  DateTime? get lastMessageAt => getField<DateTime>('last_message_at');
  set lastMessageAt(DateTime? value) =>
      setField<DateTime>('last_message_at', value);

  int? get lastMessageSenderId => getField<int>('last_message_sender_id');
  set lastMessageSenderId(int? value) =>
      setField<int>('last_message_sender_id', value);

  DateTime? get venueLastReadAt => getField<DateTime>('venue_last_read_at');
  set venueLastReadAt(DateTime? value) =>
      setField<DateTime>('venue_last_read_at', value);

  DateTime? get musicianLastReadAt =>
      getField<DateTime>('musician_last_read_at');
  set musicianLastReadAt(DateTime? value) =>
      setField<DateTime>('musician_last_read_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  bool? get isGeneralMessage => getField<bool>('is_general_message');
  set isGeneralMessage(bool? value) =>
      setField<bool>('is_general_message', value);

  String? get slotGroupId => getField<String>('slot_group_id');
  set slotGroupId(String? value) => setField<String>('slot_group_id', value);
}
