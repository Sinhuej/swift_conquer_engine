import '../core/game_state.dart';
import '../core/event_bus.dart';

/// Base class for all buildings (command center, refinery, war factory, etc.).
class BaseBuilding {
  final String id;
  final String ownerId;
  final String typeId; // e.g. "UEA_REFINERY"

  final double maxHitPoints;
  double hitPoints;

  final double powerOutput; // positive for generators
  final double powerUsage;  // positive for consumers

  final double buildTimeSeconds; // how long to construct
  final double cost;             // credit cost

  double _constructionProgress = 1.0; // 0–1, 1 = built

  bool get isConstructed => _constructionProgress >= 1.0;
  bool get isAlive => hitPoints > 0;

  BaseBuilding({
    required this.id,
    required this.ownerId,
    required this.typeId,
    required this.maxHitPoints,
    required this.powerOutput,
    required this.powerUsage,
    required this.buildTimeSeconds,
    required this.cost,
  }) : hitPoints = maxHitPoints;

  /// For under-construction buildings.
  void advanceConstruction(double dtSeconds) {
    if (isConstructed) return;
    if (buildTimeSeconds <= 0) {
      _constructionProgress = 1.0;
      return;
    }
    _constructionProgress += dtSeconds / buildTimeSeconds;
    if (_constructionProgress > 1.0) _constructionProgress = 1.0;
  }

  void applyDamage(double amount) {
    if (!isAlive) return;
    hitPoints -= amount;
    if (hitPoints < 0) hitPoints = 0;
  }

  void heal(double amount) {
    if (!isAlive) return;
    hitPoints = (hitPoints + amount).clamp(0, maxHitPoints);
  }

  /// Override to implement building-specific behavior each tick.
  void update(double dtSeconds, GameState state, EventBus bus) {
    advanceConstruction(dtSeconds);
  }
}
