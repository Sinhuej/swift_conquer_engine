import 'base_unit.dart';

/// Very simple movement helper. Real A* pathfinding will plug into this later.
class MovementController {
  final BaseUnit unit;

  double? _targetX;
  double? _targetY;

  MovementController(this.unit);

  void moveTo(double x, double y) {
    _targetX = x;
    _targetY = y;
  }

  bool get hasTarget => _targetX != null && _targetY != null;

  void clearTarget() {
    _targetX = null;
    _targetY = null;
  }

  void update(double dtSeconds) {
    if (!hasTarget || !unit.isAlive) return;

    final tx = _targetX!;
    final ty = _targetY!;
    final dx = tx - unit.position.x;
    final dy = ty - unit.position.y;
    final distSq = dx * dx + dy * dy;

    if (distSq < 0.0001) {
      unit.position.x = tx;
      unit.position.y = ty;
      clearTarget();
      return;
    }

    final dist = distSq.sqrt();
    final maxStep = unit.moveSpeed * dtSeconds;
    if (dist <= maxStep) {
      unit.position.x = tx;
      unit.position.y = ty;
      clearTarget();
      return;
    }

    final nx = dx / dist;
    final ny = dy / dist;
    unit.position.x += nx * maxStep;
    unit.position.y += ny * maxStep;
  }
}

extension on double {
  double sqrt() => Math.sqrt(this);
}

/// Tiny math helper since we don't want to pull dart:math everywhere.
class Math {
  static double sqrt(double v) {
    // Basic Newton–Raphson iteration – accurate enough here.
    if (v <= 0) return 0;
    double x = v;
    for (int i = 0; i < 6; i++) {
      x = 0.5 * (x + v / x);
    }
    return x;
  }
}
