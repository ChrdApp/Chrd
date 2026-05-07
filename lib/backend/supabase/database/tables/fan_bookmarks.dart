import '../database.dart';

class FanBookmarksTable extends SupabaseTable<FanBookmarksRow> {
  @override
  String get tableName => 'fan_bookmarks';

  @override
  FanBookmarksRow createRow(Map<String, dynamic> data) => FanBookmarksRow(data);
}

class FanBookmarksRow extends SupabaseDataRow {
  FanBookmarksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FanBookmarksTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int get fanId => getField<int>('fan_id')!;
  set fanId(int value) => setField<int>('fan_id', value);

  String get groupUuid => getField<String>('group_uuid')!;
  set groupUuid(String value) => setField<String>('group_uuid', value);
}
