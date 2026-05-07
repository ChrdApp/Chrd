import '../database.dart';

class GigContractsTable extends SupabaseTable<GigContractsRow> {
  @override
  String get tableName => 'gig_contracts';

  @override
  GigContractsRow createRow(Map<String, dynamic> data) => GigContractsRow(data);
}

class GigContractsRow extends SupabaseDataRow {
  GigContractsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GigContractsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get gigThreadId => getField<int>('gig_thread_id');
  set gigThreadId(int? value) => setField<int>('gig_thread_id', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  int? get venueOwnerId => getField<int>('venue_owner_id');
  set venueOwnerId(int? value) => setField<int>('venue_owner_id', value);

  int? get musicianId => getField<int>('musician_id');
  set musicianId(int? value) => setField<int>('musician_id', value);

  String? get reason => getField<String>('reason');
  set reason(String? value) => setField<String>('reason', value);

  String? get contractStatus => getField<String>('contract_status');
  set contractStatus(String? value) =>
      setField<String>('contract_status', value);

  DateTime? get acceptedAt => getField<DateTime>('accepted_at');
  set acceptedAt(DateTime? value) => setField<DateTime>('accepted_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get slotGroupId => getField<String>('slot_group_id');
  set slotGroupId(String? value) => setField<String>('slot_group_id', value);
}
