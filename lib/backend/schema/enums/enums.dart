import 'package:collection/collection.dart';

enum Type {
  Venue,
  Musician,
  Fan,
}

enum WhichScreenMusicianNavBar {
  home,
  discover,
  planner,
  gigThreads,
  profile,
}

enum GigStatus {
  Open,
  Booked,
  Cancelled,
  Declined,
}

enum LoginType {
  Phone,
  Google,
  Apple,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Type):
      return Type.values.deserialize(value) as T?;
    case (WhichScreenMusicianNavBar):
      return WhichScreenMusicianNavBar.values.deserialize(value) as T?;
    case (GigStatus):
      return GigStatus.values.deserialize(value) as T?;
    case (LoginType):
      return LoginType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
