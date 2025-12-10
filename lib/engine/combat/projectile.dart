import '../core/game_state.dart';

class Projectile {
  final String id;
  final String ownerId;
  final String sourceUnitId;
  final String targetUnitId;
  final double damage;

  Projectile({
    required this.id,
    required this.ownerId,
    required this.sourceUnitId,
    required this.targetUnitId,
    required this.damage,
  });
}
