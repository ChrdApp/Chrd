// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DiscoverGigsCombineModelStruct extends BaseStruct {
  DiscoverGigsCombineModelStruct({
    List<LastMinuteGigModelStruct>? lastMinuteGigs,
    List<RecurringGigsModelStruct>? recurringGigs,
    List<OnetimeGigsModelStruct>? onetimeGigs,
  })  : _lastMinuteGigs = lastMinuteGigs,
        _recurringGigs = recurringGigs,
        _onetimeGigs = onetimeGigs;

  // "lastMinuteGigs" field.
  List<LastMinuteGigModelStruct>? _lastMinuteGigs;
  List<LastMinuteGigModelStruct> get lastMinuteGigs =>
      _lastMinuteGigs ?? const [];
  set lastMinuteGigs(List<LastMinuteGigModelStruct>? val) =>
      _lastMinuteGigs = val;

  void updateLastMinuteGigs(Function(List<LastMinuteGigModelStruct>) updateFn) {
    updateFn(_lastMinuteGigs ??= []);
  }

  bool hasLastMinuteGigs() => _lastMinuteGigs != null;

  // "recurringGigs" field.
  List<RecurringGigsModelStruct>? _recurringGigs;
  List<RecurringGigsModelStruct> get recurringGigs =>
      _recurringGigs ?? const [];
  set recurringGigs(List<RecurringGigsModelStruct>? val) =>
      _recurringGigs = val;

  void updateRecurringGigs(Function(List<RecurringGigsModelStruct>) updateFn) {
    updateFn(_recurringGigs ??= []);
  }

  bool hasRecurringGigs() => _recurringGigs != null;

  // "onetimeGigs" field.
  List<OnetimeGigsModelStruct>? _onetimeGigs;
  List<OnetimeGigsModelStruct> get onetimeGigs => _onetimeGigs ?? const [];
  set onetimeGigs(List<OnetimeGigsModelStruct>? val) => _onetimeGigs = val;

  void updateOnetimeGigs(Function(List<OnetimeGigsModelStruct>) updateFn) {
    updateFn(_onetimeGigs ??= []);
  }

  bool hasOnetimeGigs() => _onetimeGigs != null;

  static DiscoverGigsCombineModelStruct fromMap(Map<String, dynamic> data) =>
      DiscoverGigsCombineModelStruct(
        lastMinuteGigs: getStructList(
          data['lastMinuteGigs'],
          LastMinuteGigModelStruct.fromMap,
        ),
        recurringGigs: getStructList(
          data['recurringGigs'],
          RecurringGigsModelStruct.fromMap,
        ),
        onetimeGigs: getStructList(
          data['onetimeGigs'],
          OnetimeGigsModelStruct.fromMap,
        ),
      );

  static DiscoverGigsCombineModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? DiscoverGigsCombineModelStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'lastMinuteGigs': _lastMinuteGigs?.map((e) => e.toMap()).toList(),
        'recurringGigs': _recurringGigs?.map((e) => e.toMap()).toList(),
        'onetimeGigs': _onetimeGigs?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lastMinuteGigs': serializeParam(
          _lastMinuteGigs,
          ParamType.DataStruct,
          isList: true,
        ),
        'recurringGigs': serializeParam(
          _recurringGigs,
          ParamType.DataStruct,
          isList: true,
        ),
        'onetimeGigs': serializeParam(
          _onetimeGigs,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static DiscoverGigsCombineModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DiscoverGigsCombineModelStruct(
        lastMinuteGigs: deserializeStructParam<LastMinuteGigModelStruct>(
          data['lastMinuteGigs'],
          ParamType.DataStruct,
          true,
          structBuilder: LastMinuteGigModelStruct.fromSerializableMap,
        ),
        recurringGigs: deserializeStructParam<RecurringGigsModelStruct>(
          data['recurringGigs'],
          ParamType.DataStruct,
          true,
          structBuilder: RecurringGigsModelStruct.fromSerializableMap,
        ),
        onetimeGigs: deserializeStructParam<OnetimeGigsModelStruct>(
          data['onetimeGigs'],
          ParamType.DataStruct,
          true,
          structBuilder: OnetimeGigsModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DiscoverGigsCombineModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DiscoverGigsCombineModelStruct &&
        listEquality.equals(lastMinuteGigs, other.lastMinuteGigs) &&
        listEquality.equals(recurringGigs, other.recurringGigs) &&
        listEquality.equals(onetimeGigs, other.onetimeGigs);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([lastMinuteGigs, recurringGigs, onetimeGigs]);
}

DiscoverGigsCombineModelStruct createDiscoverGigsCombineModelStruct() =>
    DiscoverGigsCombineModelStruct();
