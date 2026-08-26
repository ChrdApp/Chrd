import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_commons/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _userId = prefs.getInt('ff_userId') ?? _userId;
    });
    _safeInit(() {
      _venueId = prefs.getInt('ff_venueId') ?? _venueId;
    });
    _safeInit(() {
      _step = prefs.getInt('ff_step') ?? _step;
    });
    _safeInit(() {
      _userType = prefs.containsKey('ff_userType')
          ? deserializeEnum<Type>(prefs.getString('ff_userType'))
          : _userType;
    });
    _safeInit(() {
      _loginType = prefs.getString('ff_loginType') ?? _loginType;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_selectedVenueSwitch')) {
        try {
          final serializedData =
              prefs.getString('ff_selectedVenueSwitch') ?? '{}';
          _selectedVenueSwitch = VenueSwitchDetailStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_fanUserData')) {
        try {
          final serializedData = prefs.getString('ff_fanUserData') ?? '{}';
          _fanUserData =
              FanDataStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_FanFilter')) {
        try {
          final serializedData = prefs.getString('ff_FanFilter') ?? '{}';
          _FanFilter =
              FanFilterStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _lastHandledInviteToken = prefs.getString('ff_lastHandledInviteToken') ??
          _lastHandledInviteToken;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _vanueName = '';
  String get vanueName => _vanueName;
  set vanueName(String value) {
    _vanueName = value;
  }

  String _AdminName = '';
  String get AdminName => _AdminName;
  set AdminName(String value) {
    _AdminName = value;
  }

  String _venueProfilePic = '';
  String get venueProfilePic => _venueProfilePic;
  set venueProfilePic(String value) {
    _venueProfilePic = value;
  }

  /// List which contains server url of venue's content.
  List<String> _venueContentVenueList = [
    'https://kasnaqcqfuqnfydsjvpy.supabase.co/storage/v1/object/public/venueC/addImage.png'
  ];
  List<String> get venueContentVenueList => _venueContentVenueList;
  set venueContentVenueList(List<String> value) {
    _venueContentVenueList = value;
  }

  void addToVenueContentVenueList(String value) {
    venueContentVenueList.add(value);
  }

  void removeFromVenueContentVenueList(String value) {
    venueContentVenueList.remove(value);
  }

  void removeAtIndexFromVenueContentVenueList(int index) {
    venueContentVenueList.removeAt(index);
  }

  void updateVenueContentVenueListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    venueContentVenueList[index] = updateFn(_venueContentVenueList[index]);
  }

  void insertAtIndexInVenueContentVenueList(int index, String value) {
    venueContentVenueList.insert(index, value);
  }

  /// This app state var is containing data of venue account.
  VenueAccountCreateStruct _venueAccountCreate = VenueAccountCreateStruct();
  VenueAccountCreateStruct get venueAccountCreate => _venueAccountCreate;
  set venueAccountCreate(VenueAccountCreateStruct value) {
    _venueAccountCreate = value;
  }

  void updateVenueAccountCreateStruct(
      Function(VenueAccountCreateStruct) updateFn) {
    updateFn(_venueAccountCreate);
  }

  int _userId = 0;
  int get userId => _userId;
  set userId(int value) {
    _userId = value;
    prefs.setInt('ff_userId', value);
  }

  int _venueId = 0;
  int get venueId => _venueId;
  set venueId(int value) {
    _venueId = value;
    prefs.setInt('ff_venueId', value);
  }

  List<String> _performanceStagesContentList = [];
  List<String> get performanceStagesContentList =>
      _performanceStagesContentList;
  set performanceStagesContentList(List<String> value) {
    _performanceStagesContentList = value;
  }

  void addToPerformanceStagesContentList(String value) {
    performanceStagesContentList.add(value);
  }

  void removeFromPerformanceStagesContentList(String value) {
    performanceStagesContentList.remove(value);
  }

  void removeAtIndexFromPerformanceStagesContentList(int index) {
    performanceStagesContentList.removeAt(index);
  }

  void updatePerformanceStagesContentListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    performanceStagesContentList[index] =
        updateFn(_performanceStagesContentList[index]);
  }

  void insertAtIndexInPerformanceStagesContentList(int index, String value) {
    performanceStagesContentList.insert(index, value);
  }

  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  set startTime(DateTime? value) {
    _startTime = value;
  }

  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  set endTime(DateTime? value) {
    _endTime = value;
  }

  int _step = 0;
  int get step => _step;
  set step(int value) {
    _step = value;
    prefs.setInt('ff_step', value);
  }

  /// It's daily, weekly or none
  String _slotRepeatType = 'None';
  String get slotRepeatType => _slotRepeatType;
  set slotRepeatType(String value) {
    _slotRepeatType = value;
  }

  DateTime? _slotEndDate;
  DateTime? get slotEndDate => _slotEndDate;
  set slotEndDate(DateTime? value) {
    _slotEndDate = value;
  }

  Type? _userType = Type.Venue;
  Type? get userType => _userType;
  set userType(Type? value) {
    _userType = value;
    value != null
        ? prefs.setString('ff_userType', value.serialize())
        : prefs.remove('ff_userType');
  }

  String _accountType = '';
  String get accountType => _accountType;
  set accountType(String value) {
    _accountType = value;
  }

  List<String> _musicianAddImages = [
    'https://kasnaqcqfuqnfydsjvpy.supabase.co/storage/v1/object/public/musician/musician_add_image.png'
  ];
  List<String> get musicianAddImages => _musicianAddImages;
  set musicianAddImages(List<String> value) {
    _musicianAddImages = value;
  }

  void addToMusicianAddImages(String value) {
    musicianAddImages.add(value);
  }

  void removeFromMusicianAddImages(String value) {
    musicianAddImages.remove(value);
  }

  void removeAtIndexFromMusicianAddImages(int index) {
    musicianAddImages.removeAt(index);
  }

  void updateMusicianAddImagesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    musicianAddImages[index] = updateFn(_musicianAddImages[index]);
  }

  void insertAtIndexInMusicianAddImages(int index, String value) {
    musicianAddImages.insert(index, value);
  }

  List<String> _ProfileHighlight = [];
  List<String> get ProfileHighlight => _ProfileHighlight;
  set ProfileHighlight(List<String> value) {
    _ProfileHighlight = value;
  }

  void addToProfileHighlight(String value) {
    ProfileHighlight.add(value);
  }

  void removeFromProfileHighlight(String value) {
    ProfileHighlight.remove(value);
  }

  void removeAtIndexFromProfileHighlight(int index) {
    ProfileHighlight.removeAt(index);
  }

  void updateProfileHighlightAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ProfileHighlight[index] = updateFn(_ProfileHighlight[index]);
  }

  void insertAtIndexInProfileHighlight(int index, String value) {
    ProfileHighlight.insert(index, value);
  }

  GigOfferStruct _gigOffer = GigOfferStruct();
  GigOfferStruct get gigOffer => _gigOffer;
  set gigOffer(GigOfferStruct value) {
    _gigOffer = value;
  }

  void updateGigOfferStruct(Function(GigOfferStruct) updateFn) {
    updateFn(_gigOffer);
  }

  dynamic _json = jsonDecode(
      '[{\"sender\":\"venue\",\"text\":\"Hey! We\'ve been following your shows and would love to have you DJ for us! How much money would you want for each show?\",\"timestamp\":\"9:41am\",\"date\":\"Oct 23rd, 2025\",\"isProposal\":true},{\"sender\":\"musician\",\"text\":\"Hi there! I would love to perform. I am not available Wednesday, Nov 26th. I am still interested in doing the other 3 shows for \$400 each.\",\"timestamp\":\"10:54am\"}]');
  dynamic get json => _json;
  set json(dynamic value) {
    _json = value;
  }

  String _tempPhoneNumber = '';
  String get tempPhoneNumber => _tempPhoneNumber;
  set tempPhoneNumber(String value) {
    _tempPhoneNumber = value;
  }

  String _selectedCalendarDate = '';
  String get selectedCalendarDate => _selectedCalendarDate;
  set selectedCalendarDate(String value) {
    _selectedCalendarDate = value;
  }

  String _filteredVenueStatus = '';
  String get filteredVenueStatus => _filteredVenueStatus;
  set filteredVenueStatus(String value) {
    _filteredVenueStatus = value;
  }

  List<String> _FilteredVenueIds = [];
  List<String> get FilteredVenueIds => _FilteredVenueIds;
  set FilteredVenueIds(List<String> value) {
    _FilteredVenueIds = value;
  }

  void addToFilteredVenueIds(String value) {
    FilteredVenueIds.add(value);
  }

  void removeFromFilteredVenueIds(String value) {
    FilteredVenueIds.remove(value);
  }

  void removeAtIndexFromFilteredVenueIds(int index) {
    FilteredVenueIds.removeAt(index);
  }

  void updateFilteredVenueIdsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    FilteredVenueIds[index] = updateFn(_FilteredVenueIds[index]);
  }

  void insertAtIndexInFilteredVenueIds(int index, String value) {
    FilteredVenueIds.insert(index, value);
  }

  String _loginType = '';
  String get loginType => _loginType;
  set loginType(String value) {
    _loginType = value;
    prefs.setString('ff_loginType', value);
  }

  bool _isDataUploading = false;
  bool get isDataUploading => _isDataUploading;
  set isDataUploading(bool value) {
    _isDataUploading = value;
  }

  List<ContentListStruct> _contentList = [];
  List<ContentListStruct> get contentList => _contentList;
  set contentList(List<ContentListStruct> value) {
    _contentList = value;
  }

  void addToContentList(ContentListStruct value) {
    contentList.add(value);
  }

  void removeFromContentList(ContentListStruct value) {
    contentList.remove(value);
  }

  void removeAtIndexFromContentList(int index) {
    contentList.removeAt(index);
  }

  void updateContentListAtIndex(
    int index,
    ContentListStruct Function(ContentListStruct) updateFn,
  ) {
    contentList[index] = updateFn(_contentList[index]);
  }

  void insertAtIndexInContentList(int index, ContentListStruct value) {
    contentList.insert(index, value);
  }

  VenueSwitchDetailStruct _selectedVenueSwitch = VenueSwitchDetailStruct();
  VenueSwitchDetailStruct get selectedVenueSwitch => _selectedVenueSwitch;
  set selectedVenueSwitch(VenueSwitchDetailStruct value) {
    _selectedVenueSwitch = value;
    prefs.setString('ff_selectedVenueSwitch', value.serialize());
  }

  void updateSelectedVenueSwitchStruct(
      Function(VenueSwitchDetailStruct) updateFn) {
    updateFn(_selectedVenueSwitch);
    prefs.setString('ff_selectedVenueSwitch', _selectedVenueSwitch.serialize());
  }

  int _selectedMsgId = 0;
  int get selectedMsgId => _selectedMsgId;
  set selectedMsgId(int value) {
    _selectedMsgId = value;
  }

  FanDataStruct _fanUserData = FanDataStruct();
  FanDataStruct get fanUserData => _fanUserData;
  set fanUserData(FanDataStruct value) {
    _fanUserData = value;
    prefs.setString('ff_fanUserData', value.serialize());
  }

  void updateFanUserDataStruct(Function(FanDataStruct) updateFn) {
    updateFn(_fanUserData);
    prefs.setString('ff_fanUserData', _fanUserData.serialize());
  }

  List<ContentListStruct> _performanceStageContent = [];
  List<ContentListStruct> get performanceStageContent =>
      _performanceStageContent;
  set performanceStageContent(List<ContentListStruct> value) {
    _performanceStageContent = value;
  }

  void addToPerformanceStageContent(ContentListStruct value) {
    performanceStageContent.add(value);
  }

  void removeFromPerformanceStageContent(ContentListStruct value) {
    performanceStageContent.remove(value);
  }

  void removeAtIndexFromPerformanceStageContent(int index) {
    performanceStageContent.removeAt(index);
  }

  void updatePerformanceStageContentAtIndex(
    int index,
    ContentListStruct Function(ContentListStruct) updateFn,
  ) {
    performanceStageContent[index] = updateFn(_performanceStageContent[index]);
  }

  void insertAtIndexInPerformanceStageContent(
      int index, ContentListStruct value) {
    performanceStageContent.insert(index, value);
  }

  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  set errorMessage(String value) {
    _errorMessage = value;
  }

  FanFilterStruct _FanFilter = FanFilterStruct();
  FanFilterStruct get FanFilter => _FanFilter;
  set FanFilter(FanFilterStruct value) {
    _FanFilter = value;
    prefs.setString('ff_FanFilter', value.serialize());
  }

  void updateFanFilterStruct(Function(FanFilterStruct) updateFn) {
    updateFn(_FanFilter);
    prefs.setString('ff_FanFilter', _FanFilter.serialize());
  }

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
  }

  String _firstName = '';
  String get firstName => _firstName;
  set firstName(String value) {
    _firstName = value;
  }

  String _lastName = '';
  String get lastName => _lastName;
  set lastName(String value) {
    _lastName = value;
  }

  String _pendingInviteToken = '';
  String get pendingInviteToken => _pendingInviteToken;
  set pendingInviteToken(String value) {
    _pendingInviteToken = value;
  }

  int _pendingInviteId = 0;
  int get pendingInviteId => _pendingInviteId;
  set pendingInviteId(int value) {
    _pendingInviteId = value;
  }

  String _pendingInviteRole = '';
  String get pendingInviteRole => _pendingInviteRole;
  set pendingInviteRole(String value) {
    _pendingInviteRole = value;
  }

  String _pendingInviteType = '';
  String get pendingInviteType => _pendingInviteType;
  set pendingInviteType(String value) {
    _pendingInviteType = value;
  }

  int _pendingVenueId = 0;
  int get pendingVenueId => _pendingVenueId;
  set pendingVenueId(int value) {
    _pendingVenueId = value;
  }

  int _pendingSlotId = 0;
  int get pendingSlotId => _pendingSlotId;
  set pendingSlotId(int value) {
    _pendingSlotId = value;
  }

  int _pendingVenueOwnerId = 0;
  int get pendingVenueOwnerId => _pendingVenueOwnerId;
  set pendingVenueOwnerId(int value) {
    _pendingVenueOwnerId = value;
  }

  String _inviteConfirmToken = '';
  String get inviteConfirmToken => _inviteConfirmToken;
  set inviteConfirmToken(String value) {
    _inviteConfirmToken = value;
  }

  String _inviteConfirmInviterName = '';
  String get inviteConfirmInviterName => _inviteConfirmInviterName;
  set inviteConfirmInviterName(String value) {
    _inviteConfirmInviterName = value;
  }

  String _lastHandledInviteToken = '';
  String get lastHandledInviteToken => _lastHandledInviteToken;
  set lastHandledInviteToken(String value) {
    _lastHandledInviteToken = value;
    prefs.setString('ff_lastHandledInviteToken', value);
  }

  final _genreQueryResponseManager = FutureRequestManager<List<GenresRow>>();
  Future<List<GenresRow>> genreQueryResponse({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<GenresRow>> Function() requestFn,
  }) =>
      _genreQueryResponseManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGenreQueryResponseCache() => _genreQueryResponseManager.clear();
  void clearGenreQueryResponseCacheKey(String? uniqueKey) =>
      _genreQueryResponseManager.clearRequest(uniqueKey);

  final _entertainmentMultiselectMusicianProfilePageManager =
      FutureRequestManager<List<EntertainmentRow>>();
  Future<List<EntertainmentRow>> entertainmentMultiselectMusicianProfilePage({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<EntertainmentRow>> Function() requestFn,
  }) =>
      _entertainmentMultiselectMusicianProfilePageManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearEntertainmentMultiselectMusicianProfilePageCache() =>
      _entertainmentMultiselectMusicianProfilePageManager.clear();
  void clearEntertainmentMultiselectMusicianProfilePageCacheKey(
          String? uniqueKey) =>
      _entertainmentMultiselectMusicianProfilePageManager
          .clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
