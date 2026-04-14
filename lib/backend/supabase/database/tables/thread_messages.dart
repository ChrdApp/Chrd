import '../database.dart';

class ThreadMessagesTable extends SupabaseTable<ThreadMessagesRow> {
  @override
  String get tableName => 'thread_messages';

  @override
  ThreadMessagesRow createRow(Map<String, dynamic> data) =>
      ThreadMessagesRow(data);
}

class ThreadMessagesRow extends SupabaseDataRow {
  ThreadMessagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ThreadMessagesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get threadId => getField<int>('thread_id');
  set threadId(int? value) => setField<int>('thread_id', value);

  int? get senderId => getField<int>('sender_id');
  set senderId(int? value) => setField<int>('sender_id', value);

  String? get messageType => getField<String>('message_type');
  set messageType(String? value) => setField<String>('message_type', value);

  String? get messageContent => getField<String>('message_content');
  set messageContent(String? value) =>
      setField<String>('message_content', value);

  String? get alternateMessage => getField<String>('alternate_message');
  set alternateMessage(String? value) =>
      setField<String>('alternate_message', value);
}
