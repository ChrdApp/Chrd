import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  String? get permission => getField<String>('permission');
  set permission(String? value) => setField<String>('permission', value);

  String? get userType => getField<String>('user_type');
  set userType(String? value) => setField<String>('user_type', value);

  String? get countryCode => getField<String>('country_code');
  set countryCode(String? value) => setField<String>('country_code', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get authId => getField<String>('auth_id');
  set authId(String? value) => setField<String>('auth_id', value);

  int? get step => getField<int>('step');
  set step(int? value) => setField<int>('step', value);

  List<int> get entertainmentId => getListField<int>('entertainment_id');
  set entertainmentId(List<int>? value) =>
      setListField<int>('entertainment_id', value);

  List<int> get genreId => getListField<int>('genre_id');
  set genreId(List<int>? value) => setListField<int>('genre_id', value);

  String? get musicianStatement => getField<String>('musician_statement');
  set musicianStatement(String? value) =>
      setField<String>('musician_statement', value);

  String? get profilePhoto => getField<String>('profile_photo');
  set profilePhoto(String? value) => setField<String>('profile_photo', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  String? get phoneNorm => getField<String>('phone_norm');
  set phoneNorm(String? value) => setField<String>('phone_norm', value);
}
