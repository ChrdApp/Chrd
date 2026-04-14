import '../database.dart';

class GenresTable extends SupabaseTable<GenresRow> {
  @override
  String get tableName => 'genres';

  @override
  GenresRow createRow(Map<String, dynamic> data) => GenresRow(data);
}

class GenresRow extends SupabaseDataRow {
  GenresRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GenresTable();

  int get genreId => getField<int>('genre_id')!;
  set genreId(int value) => setField<int>('genre_id', value);

  String get genreType => getField<String>('genre_type')!;
  set genreType(String value) => setField<String>('genre_type', value);

  String? get genreImage => getField<String>('genre_image');
  set genreImage(String? value) => setField<String>('genre_image', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
