import '../database.dart';

class SocialMediaTable extends SupabaseTable<SocialMediaRow> {
  @override
  String get tableName => 'social_media';

  @override
  SocialMediaRow createRow(Map<String, dynamic> data) => SocialMediaRow(data);
}

class SocialMediaRow extends SupabaseDataRow {
  SocialMediaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SocialMediaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get instagramId => getField<String>('instagram_id');
  set instagramId(String? value) => setField<String>('instagram_id', value);

  String? get youtubeId => getField<String>('youtube_id');
  set youtubeId(String? value) => setField<String>('youtube_id', value);

  String? get xId => getField<String>('x_id');
  set xId(String? value) => setField<String>('x_id', value);

  String? get facebookId => getField<String>('facebook_id');
  set facebookId(String? value) => setField<String>('facebook_id', value);

  int? get createdBy => getField<int>('created_by');
  set createdBy(int? value) => setField<int>('created_by', value);
}
