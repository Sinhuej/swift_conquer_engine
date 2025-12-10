// Registry of build times for all units
import '../buildings/build_time.dart';

class UnitBuildTimeRegistry {
  static final buildTimes = {
    'rifle_infantry': BuildTime(5.0),
    'rocket_soldier': BuildTime(7.0),
    'grenadier': BuildTime(8.0),
    'light_tank': BuildTime(15.0),
    'medium_tank': BuildTime(20.0),
    'heavy_tank': BuildTime(25.0),
    'heli_gunship': BuildTime(18.0),
    'fighter_jet': BuildTime(22.0),
  };
}
