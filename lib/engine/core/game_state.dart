import '../units/base_unit.dart';
import '../buildings/base_building.dart';
import '../resources/economy.dart';
import '../buildings/power_system.dart';
import '../combat/combat_system.dart';
import '../resources/resource_node.dart';
import '../core/event_bus.dart';

/// Authoritative simulation state for a single match.
class GameState {
  final Map<String, BaseUnit> units = {};
  final Map<String, BaseBuilding> buildings = {};
  final Map<String, ResourceNode> resources = {};

  final Economy economy = Economy();
  final PowerSystem powerSystem = PowerSystem();
  final CombatSystem combatSystem = CombatSystem();

  double simulationTime = 0.0;

  bool get isLowPower => powerSystem.isLowPower;

  void addUnit(BaseUnit unit) {
    units[unit.id] = unit;
  }

  void addBuilding(BaseBuilding building) {
    buildings[building.id] = building;
    powerSystem.registerBuilding(building);
  }

  void removeUnit(String id) {
    units.remove(id);
  }

  void removeBuilding(String id) {
    final b = buildings.remove(id);
    if (b != null) {
      powerSystem.unregisterBuilding(b);
    }
  }

  /// Called every frame (dtSeconds ~ 1/30 – 1/60).
  void update(double dtSeconds, EventBus bus) {
    simulationTime += dtSeconds;

    // Update buildings (construction, production, damage over time, etc.)
    for (final building in buildings.values.toList()) {
      building.update(dtSeconds, this, bus);
    }

    // Update units (movement, firing, etc.)
    for (final unit in units.values.toList()) {
      unit.update(dtSeconds, this, bus);
    }

    // Recalculate power state
    final wasLowPower = powerSystem.isLowPower;
    powerSystem.recalculate(buildings.values);

    if (wasLowPower != powerSystem.isLowPower) {
      bus.emit(PowerStateChangedEvent(powerSystem.isLowPower));
    }

    // Resolve combat (projectiles, hits)
    combatSystem.update(dtSeconds, this, bus);
  }
}
