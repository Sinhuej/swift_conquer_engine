import '../core/game_state.dart';
import '../core/event_bus.dart';

class UnitPosition {
  double x;
  double y;
  UnitPosition(this.x, this.y);
}

/// Base class for all units (tanks, infantry, aircraft).
class BaseUnit {
  final String id;
  final String ownerId; // player / faction id
  final String typeId;  // e.g. "UEA_TANK_1"

  final double maxHitPoints;
  double hitPoints;

  final double moveSpeed;        // tiles per second or world units / sec
  final double buildTimeSeconds; // how long this unit takes to build
  final double cost;             // credit cost

  UnitPosition position;
  bool isSelected = false;
  bool isAlive = true;

  BaseUnit({
    required this.id,
    required this.ownerId,
    required this.typeId,
    required this.maxHitPoints,
    required this.moveSpeed,
    required this.buildTimeSeconds,
    required this.cost,
    required this.position,
  }) : hitPoints = maxHitPoints;

  void applyDamage(double amount) {
    if (!isAlive) return;
    hitPoints -= amount;
    if (hitPoints <= 0) {
      hitPoints = 0;
      isAlive = false;
    }
  }

  void heal(double amount) {
    if (!isAlive) return;
    hitPoints = (hitPoints + amount).clamp(0, maxHitPoints);
  }

  /// Called each tick. Override in subclasses for custom behavior.
  void update(double dtSeconds, GameState state, EventBus bus) {
    // Movement / firing logic will be layered on top later.
  }
}
