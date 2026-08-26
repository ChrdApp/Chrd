import 'package:collection/collection.dart';
import 'package:ff_commons/flutter_flow/enums.dart';
export 'package:ff_commons/flutter_flow/enums.dart';

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
