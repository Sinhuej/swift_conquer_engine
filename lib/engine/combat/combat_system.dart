import '../core/game_state.dart';
import '../core/event_bus.dart';
import 'projectile.dart';

/// Very simple combat system that instantly applies projectile damage.
/// Later this can be upgraded to travel time, AoE, armor, etc.
class CombatSystem {
  final List<Projectile> _projectiles = [];

  void spawnProjectile(Projectile p) {
    _projectiles.add(p);
  }

  void update(double dtSeconds, GameState state, EventBus bus) {
    if (_projectiles.isEmpty) return;

    for (final p in _projectiles.toList()) {
      final targetUnit = state.units[p.targetUnitId];
      if (targetUnit != null && targetUnit.isAlive) {
        targetUnit.applyDamage(p.damage);
      }
      _projectiles.remove(p);
    }
  }
}
