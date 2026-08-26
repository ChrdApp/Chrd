import '../database.dart';

class InviteEventsTable extends SupabaseTable<InviteEventsRow> {
  @override
  String get tableName => 'invite_events';

  @override
  InviteEventsRow createRow(Map<String, dynamic> data) => InviteEventsRow(data);
}

class InviteEventsRow extends SupabaseDataRow {
  InviteEventsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => InviteEventsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int get inviteId => getField<int>('invite_id')!;
  set inviteId(int value) => setField<int>('invite_id', value);

  String get eventType => getField<String>('event_type')!;
  set eventType(String value) => setField<String>('event_type', value);

  int? get actorUserId => getField<int>('actor_user_id');
  set actorUserId(int? value) => setField<int>('actor_user_id', value);

  dynamic? get payload => getField<dynamic>('payload');
  set payload(dynamic? value) => setField<dynamic>('payload', value);
}
