import '../database.dart';

class GigInvitesTable extends SupabaseTable<GigInvitesRow> {
  @override
  String get tableName => 'gig_invites';

  @override
  GigInvitesRow createRow(Map<String, dynamic> data) => GigInvitesRow(data);
}

class GigInvitesRow extends SupabaseDataRow {
  GigInvitesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GigInvitesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get inviteToken => getField<String>('invite_token');
  set inviteToken(String? value) => setField<String>('invite_token', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String get inviteType => getField<String>('invite_type')!;
  set inviteType(String value) => setField<String>('invite_type', value);

  int get inviterUserId => getField<int>('inviter_user_id')!;
  set inviterUserId(int value) => setField<int>('inviter_user_id', value);

  String get inviterRole => getField<String>('inviter_role')!;
  set inviterRole(String value) => setField<String>('inviter_role', value);

  String get inviteeRole => getField<String>('invitee_role')!;
  set inviteeRole(String value) => setField<String>('invitee_role', value);

  String get inviteePhone => getField<String>('invitee_phone')!;
  set inviteePhone(String value) => setField<String>('invitee_phone', value);

  String? get inviteeCountryCode => getField<String>('invitee_country_code');
  set inviteeCountryCode(String? value) =>
      setField<String>('invitee_country_code', value);

  String? get inviteeNationalNo => getField<String>('invitee_national_no');
  set inviteeNationalNo(String? value) =>
      setField<String>('invitee_national_no', value);

  String? get inviteeName => getField<String>('invitee_name');
  set inviteeName(String? value) => setField<String>('invitee_name', value);

  int? get inviteeUserId => getField<int>('invitee_user_id');
  set inviteeUserId(int? value) => setField<int>('invitee_user_id', value);

  int? get venueId => getField<int>('venue_id');
  set venueId(int? value) => setField<int>('venue_id', value);

  int? get slotId => getField<int>('slot_id');
  set slotId(int? value) => setField<int>('slot_id', value);

  String? get slotGroupId => getField<String>('slot_group_id');
  set slotGroupId(String? value) => setField<String>('slot_group_id', value);

  DateTime? get proposedStartDate => getField<DateTime>('proposed_start_date');
  set proposedStartDate(DateTime? value) =>
      setField<DateTime>('proposed_start_date', value);

  PostgresTime? get proposedStartTime =>
      getField<PostgresTime>('proposed_start_time');
  set proposedStartTime(PostgresTime? value) =>
      setField<PostgresTime>('proposed_start_time', value);

  PostgresTime? get proposedEndTime =>
      getField<PostgresTime>('proposed_end_time');
  set proposedEndTime(PostgresTime? value) =>
      setField<PostgresTime>('proposed_end_time', value);

  DateTime? get proposedEndDate => getField<DateTime>('proposed_end_date');
  set proposedEndDate(DateTime? value) =>
      setField<DateTime>('proposed_end_date', value);

  String? get proposedTimeZone => getField<String>('proposed_time_zone');
  set proposedTimeZone(String? value) =>
      setField<String>('proposed_time_zone', value);

  String? get proposedRepeatType => getField<String>('proposed_repeat_type');
  set proposedRepeatType(String? value) =>
      setField<String>('proposed_repeat_type', value);

  double? get proposedPrice => getField<double>('proposed_price');
  set proposedPrice(double? value) => setField<double>('proposed_price', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  int? get gigId => getField<int>('gig_id');
  set gigId(int? value) => setField<int>('gig_id', value);

  int? get gigThreadId => getField<int>('gig_thread_id');
  set gigThreadId(int? value) => setField<int>('gig_thread_id', value);

  int? get gigContractId => getField<int>('gig_contract_id');
  set gigContractId(int? value) => setField<int>('gig_contract_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get claimedVia => getField<String>('claimed_via');
  set claimedVia(String? value) => setField<String>('claimed_via', value);

  String? get matchedVia => getField<String>('matched_via');
  set matchedVia(String? value) => setField<String>('matched_via', value);

  DateTime? get claimedAt => getField<DateTime>('claimed_at');
  set claimedAt(DateTime? value) => setField<DateTime>('claimed_at', value);

  DateTime? get inviterNotifiedAt => getField<DateTime>('inviter_notified_at');
  set inviterNotifiedAt(DateTime? value) =>
      setField<DateTime>('inviter_notified_at', value);

  DateTime? get expiresAt => getField<DateTime>('expires_at');
  set expiresAt(DateTime? value) => setField<DateTime>('expires_at', value);

  String? get failureReason => getField<String>('failure_reason');
  set failureReason(String? value) => setField<String>('failure_reason', value);

  String? get smsStatus => getField<String>('sms_status');
  set smsStatus(String? value) => setField<String>('sms_status', value);

  String? get smsProviderSid => getField<String>('sms_provider_sid');
  set smsProviderSid(String? value) =>
      setField<String>('sms_provider_sid', value);

  String? get smsError => getField<String>('sms_error');
  set smsError(String? value) => setField<String>('sms_error', value);

  DateTime? get smsSentAt => getField<DateTime>('sms_sent_at');
  set smsSentAt(DateTime? value) => setField<DateTime>('sms_sent_at', value);

  String? get branchUrl => getField<String>('branch_url');
  set branchUrl(String? value) => setField<String>('branch_url', value);

  int? get reminderCount => getField<int>('reminder_count');
  set reminderCount(int? value) => setField<int>('reminder_count', value);

  DateTime? get lastReminderAt => getField<DateTime>('last_reminder_at');
  set lastReminderAt(DateTime? value) =>
      setField<DateTime>('last_reminder_at', value);

  bool? get isDeleted => getField<bool>('is_deleted');
  set isDeleted(bool? value) => setField<bool>('is_deleted', value);

  DateTime? get deletedAt => getField<DateTime>('deleted_at');
  set deletedAt(DateTime? value) => setField<DateTime>('deleted_at', value);

  int? get deletedBy => getField<int>('deleted_by');
  set deletedBy(int? value) => setField<int>('deleted_by', value);
}
