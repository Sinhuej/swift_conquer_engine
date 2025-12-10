import 'base_building.dart';

/// Tracks global power state for a player.
class PowerSystem {
  double totalOutput = 0;
  double totalUsage = 0;
  bool isLowPower = false;

  void registerBuilding(BaseBuilding building) {
    totalOutput += building.powerOutput;
    totalUsage += building.powerUsage;
    _recalc();
  }

  void unregisterBuilding(BaseBuilding building) {
    totalOutput -= building.powerOutput;
    totalUsage -= building.powerUsage;
    _recalc();
  }

  void recalculate(Iterable<BaseBuilding> buildings) {
    totalOutput = 0;
    totalUsage = 0;
    for (final b in buildings) {
      totalOutput += b.powerOutput;
      totalUsage += b.powerUsage;
    }
    _recalc();
  }

  void _recalc() {
    isLowPower = totalOutput < totalUsage;
  }
}
