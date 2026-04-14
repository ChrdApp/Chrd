// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VenueAccountCreateStruct extends BaseStruct {
  VenueAccountCreateStruct({
    String? name,
    String? description,
    String? email,
    String? mobileNo,
    String? address,
    String? services,
    String? website,
    String? venuePhoto,
    int? createdBy,
    String? instagramId,
    String? facebookId,
    String? xId,
    String? youtubeId,
    List<String>? content,
    List<int>? entertainmentId,
    List<int>? genreId,
    String? hoursOperation,
    String? agePolicy,
    String? amenities,
    String? venueCapacity,
  })  : _name = name,
        _description = description,
        _email = email,
        _mobileNo = mobileNo,
        _address = address,
        _services = services,
        _website = website,
        _venuePhoto = venuePhoto,
        _createdBy = createdBy,
        _instagramId = instagramId,
        _facebookId = facebookId,
        _xId = xId,
        _youtubeId = youtubeId,
        _content = content,
        _entertainmentId = entertainmentId,
        _genreId = genreId,
        _hoursOperation = hoursOperation,
        _agePolicy = agePolicy,
        _amenities = amenities,
        _venueCapacity = venueCapacity;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "mobile_no" field.
  String? _mobileNo;
  String get mobileNo => _mobileNo ?? '';
  set mobileNo(String? val) => _mobileNo = val;

  bool hasMobileNo() => _mobileNo != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "services" field.
  String? _services;
  String get services => _services ?? '';
  set services(String? val) => _services = val;

  bool hasServices() => _services != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  set website(String? val) => _website = val;

  bool hasWebsite() => _website != null;

  // "venue_photo" field.
  String? _venuePhoto;
  String get venuePhoto => _venuePhoto ?? '';
  set venuePhoto(String? val) => _venuePhoto = val;

  bool hasVenuePhoto() => _venuePhoto != null;

  // "created_by" field.
  int? _createdBy;
  int get createdBy => _createdBy ?? 0;
  set createdBy(int? val) => _createdBy = val;

  void incrementCreatedBy(int amount) => createdBy = createdBy + amount;

  bool hasCreatedBy() => _createdBy != null;

  // "instagram_id" field.
  String? _instagramId;
  String get instagramId => _instagramId ?? '';
  set instagramId(String? val) => _instagramId = val;

  bool hasInstagramId() => _instagramId != null;

  // "facebook_id" field.
  String? _facebookId;
  String get facebookId => _facebookId ?? '';
  set facebookId(String? val) => _facebookId = val;

  bool hasFacebookId() => _facebookId != null;

  // "x_id" field.
  String? _xId;
  String get xId => _xId ?? '';
  set xId(String? val) => _xId = val;

  bool hasXId() => _xId != null;

  // "youtube_id" field.
  String? _youtubeId;
  String get youtubeId => _youtubeId ?? '';
  set youtubeId(String? val) => _youtubeId = val;

  bool hasYoutubeId() => _youtubeId != null;

  // "content" field.
  List<String>? _content;
  List<String> get content => _content ?? const [];
  set content(List<String>? val) => _content = val;

  void updateContent(Function(List<String>) updateFn) {
    updateFn(_content ??= []);
  }

  bool hasContent() => _content != null;

  // "entertainment_id" field.
  List<int>? _entertainmentId;
  List<int> get entertainmentId => _entertainmentId ?? const [];
  set entertainmentId(List<int>? val) => _entertainmentId = val;

  void updateEntertainmentId(Function(List<int>) updateFn) {
    updateFn(_entertainmentId ??= []);
  }

  bool hasEntertainmentId() => _entertainmentId != null;

  // "genre_id" field.
  List<int>? _genreId;
  List<int> get genreId => _genreId ?? const [];
  set genreId(List<int>? val) => _genreId = val;

  void updateGenreId(Function(List<int>) updateFn) {
    updateFn(_genreId ??= []);
  }

  bool hasGenreId() => _genreId != null;

  // "hoursOperation" field.
  String? _hoursOperation;
  String get hoursOperation => _hoursOperation ?? '';
  set hoursOperation(String? val) => _hoursOperation = val;

  bool hasHoursOperation() => _hoursOperation != null;

  // "agePolicy" field.
  String? _agePolicy;
  String get agePolicy => _agePolicy ?? '';
  set agePolicy(String? val) => _agePolicy = val;

  bool hasAgePolicy() => _agePolicy != null;

  // "amenities" field.
  String? _amenities;
  String get amenities => _amenities ?? '';
  set amenities(String? val) => _amenities = val;

  bool hasAmenities() => _amenities != null;

  // "venueCapacity" field.
  String? _venueCapacity;
  String get venueCapacity => _venueCapacity ?? '';
  set venueCapacity(String? val) => _venueCapacity = val;

  bool hasVenueCapacity() => _venueCapacity != null;

  static VenueAccountCreateStruct fromMap(Map<String, dynamic> data) =>
      VenueAccountCreateStruct(
        name: data['name'] as String?,
        description: data['description'] as String?,
        email: data['email'] as String?,
        mobileNo: data['mobile_no'] as String?,
        address: data['address'] as String?,
        services: data['services'] as String?,
        website: data['website'] as String?,
        venuePhoto: data['venue_photo'] as String?,
        createdBy: castToType<int>(data['created_by']),
        instagramId: data['instagram_id'] as String?,
        facebookId: data['facebook_id'] as String?,
        xId: data['x_id'] as String?,
        youtubeId: data['youtube_id'] as String?,
        content: getDataList(data['content']),
        entertainmentId: getDataList(data['entertainment_id']),
        genreId: getDataList(data['genre_id']),
        hoursOperation: data['hoursOperation'] as String?,
        agePolicy: data['agePolicy'] as String?,
        amenities: data['amenities'] as String?,
        venueCapacity: data['venueCapacity'] as String?,
      );

  static VenueAccountCreateStruct? maybeFromMap(dynamic data) => data is Map
      ? VenueAccountCreateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'description': _description,
        'email': _email,
        'mobile_no': _mobileNo,
        'address': _address,
        'services': _services,
        'website': _website,
        'venue_photo': _venuePhoto,
        'created_by': _createdBy,
        'instagram_id': _instagramId,
        'facebook_id': _facebookId,
        'x_id': _xId,
        'youtube_id': _youtubeId,
        'content': _content,
        'entertainment_id': _entertainmentId,
        'genre_id': _genreId,
        'hoursOperation': _hoursOperation,
        'agePolicy': _agePolicy,
        'amenities': _amenities,
        'venueCapacity': _venueCapacity,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'mobile_no': serializeParam(
          _mobileNo,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'services': serializeParam(
          _services,
          ParamType.String,
        ),
        'website': serializeParam(
          _website,
          ParamType.String,
        ),
        'venue_photo': serializeParam(
          _venuePhoto,
          ParamType.String,
        ),
        'created_by': serializeParam(
          _createdBy,
          ParamType.int,
        ),
        'instagram_id': serializeParam(
          _instagramId,
          ParamType.String,
        ),
        'facebook_id': serializeParam(
          _facebookId,
          ParamType.String,
        ),
        'x_id': serializeParam(
          _xId,
          ParamType.String,
        ),
        'youtube_id': serializeParam(
          _youtubeId,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
          isList: true,
        ),
        'entertainment_id': serializeParam(
          _entertainmentId,
          ParamType.int,
          isList: true,
        ),
        'genre_id': serializeParam(
          _genreId,
          ParamType.int,
          isList: true,
        ),
        'hoursOperation': serializeParam(
          _hoursOperation,
          ParamType.String,
        ),
        'agePolicy': serializeParam(
          _agePolicy,
          ParamType.String,
        ),
        'amenities': serializeParam(
          _amenities,
          ParamType.String,
        ),
        'venueCapacity': serializeParam(
          _venueCapacity,
          ParamType.String,
        ),
      }.withoutNulls;

  static VenueAccountCreateStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      VenueAccountCreateStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        mobileNo: deserializeParam(
          data['mobile_no'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        services: deserializeParam(
          data['services'],
          ParamType.String,
          false,
        ),
        website: deserializeParam(
          data['website'],
          ParamType.String,
          false,
        ),
        venuePhoto: deserializeParam(
          data['venue_photo'],
          ParamType.String,
          false,
        ),
        createdBy: deserializeParam(
          data['created_by'],
          ParamType.int,
          false,
        ),
        instagramId: deserializeParam(
          data['instagram_id'],
          ParamType.String,
          false,
        ),
        facebookId: deserializeParam(
          data['facebook_id'],
          ParamType.String,
          false,
        ),
        xId: deserializeParam(
          data['x_id'],
          ParamType.String,
          false,
        ),
        youtubeId: deserializeParam(
          data['youtube_id'],
          ParamType.String,
          false,
        ),
        content: deserializeParam<String>(
          data['content'],
          ParamType.String,
          true,
        ),
        entertainmentId: deserializeParam<int>(
          data['entertainment_id'],
          ParamType.int,
          true,
        ),
        genreId: deserializeParam<int>(
          data['genre_id'],
          ParamType.int,
          true,
        ),
        hoursOperation: deserializeParam(
          data['hoursOperation'],
          ParamType.String,
          false,
        ),
        agePolicy: deserializeParam(
          data['agePolicy'],
          ParamType.String,
          false,
        ),
        amenities: deserializeParam(
          data['amenities'],
          ParamType.String,
          false,
        ),
        venueCapacity: deserializeParam(
          data['venueCapacity'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VenueAccountCreateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is VenueAccountCreateStruct &&
        name == other.name &&
        description == other.description &&
        email == other.email &&
        mobileNo == other.mobileNo &&
        address == other.address &&
        services == other.services &&
        website == other.website &&
        venuePhoto == other.venuePhoto &&
        createdBy == other.createdBy &&
        instagramId == other.instagramId &&
        facebookId == other.facebookId &&
        xId == other.xId &&
        youtubeId == other.youtubeId &&
        listEquality.equals(content, other.content) &&
        listEquality.equals(entertainmentId, other.entertainmentId) &&
        listEquality.equals(genreId, other.genreId) &&
        hoursOperation == other.hoursOperation &&
        agePolicy == other.agePolicy &&
        amenities == other.amenities &&
        venueCapacity == other.venueCapacity;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        description,
        email,
        mobileNo,
        address,
        services,
        website,
        venuePhoto,
        createdBy,
        instagramId,
        facebookId,
        xId,
        youtubeId,
        content,
        entertainmentId,
        genreId,
        hoursOperation,
        agePolicy,
        amenities,
        venueCapacity
      ]);
}

VenueAccountCreateStruct createVenueAccountCreateStruct({
  String? name,
  String? description,
  String? email,
  String? mobileNo,
  String? address,
  String? services,
  String? website,
  String? venuePhoto,
  int? createdBy,
  String? instagramId,
  String? facebookId,
  String? xId,
  String? youtubeId,
  String? hoursOperation,
  String? agePolicy,
  String? amenities,
  String? venueCapacity,
}) =>
    VenueAccountCreateStruct(
      name: name,
      description: description,
      email: email,
      mobileNo: mobileNo,
      address: address,
      services: services,
      website: website,
      venuePhoto: venuePhoto,
      createdBy: createdBy,
      instagramId: instagramId,
      facebookId: facebookId,
      xId: xId,
      youtubeId: youtubeId,
      hoursOperation: hoursOperation,
      agePolicy: agePolicy,
      amenities: amenities,
      venueCapacity: venueCapacity,
    );
