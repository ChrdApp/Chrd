import '../database.dart';

class VenuesTable extends SupabaseTable<VenuesRow> {
  @override
  String get tableName => 'venues';

  @override
  VenuesRow createRow(Map<String, dynamic> data) => VenuesRow(data);
}

class VenuesRow extends SupabaseDataRow {
  VenuesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VenuesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get services => getField<String>('services');
  set services(String? value) => setField<String>('services', value);

  String? get website => getField<String>('website');
  set website(String? value) => setField<String>('website', value);

  String? get venuePhoto => getField<String>('venue_photo');
  set venuePhoto(String? value) => setField<String>('venue_photo', value);

  int get createdBy => getField<int>('created_by')!;
  set createdBy(int value) => setField<int>('created_by', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get instagramId => getField<String>('instagram_id');
  set instagramId(String? value) => setField<String>('instagram_id', value);

  String? get facebookId => getField<String>('facebook_id');
  set facebookId(String? value) => setField<String>('facebook_id', value);

  String? get xId => getField<String>('x_id');
  set xId(String? value) => setField<String>('x_id', value);

  String? get youtubeId => getField<String>('youtube_id');
  set youtubeId(String? value) => setField<String>('youtube_id', value);

  List<String> get content => getListField<String>('content');
  set content(List<String>? value) => setListField<String>('content', value);

  List<int> get entertainmentId => getListField<int>('entertainment_id');
  set entertainmentId(List<int>? value) =>
      setListField<int>('entertainment_id', value);

  List<int> get genreId => getListField<int>('genre_id');
  set genreId(List<int>? value) => setListField<int>('genre_id', value);

  String? get agePolicy => getField<String>('age_policy');
  set agePolicy(String? value) => setField<String>('age_policy', value);

  String? get hoursOperation => getField<String>('hours_operation');
  set hoursOperation(String? value) =>
      setField<String>('hours_operation', value);

  String? get amenities => getField<String>('amenities');
  set amenities(String? value) => setField<String>('amenities', value);

  String? get venueCapacity => getField<String>('venue_capacity');
  set venueCapacity(String? value) => setField<String>('venue_capacity', value);
}
