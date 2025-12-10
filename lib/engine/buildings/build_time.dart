// Defines base and modified build times for units/buildings
class BuildTime {
  final double baseSeconds;
  double get lowPowerMultiplier => 1.4; // 40% slower
  double get damagedMultiplier => 1.25; // 25% slower
  double engineerBoost(int engineers) {
    return engineers == 3 ? 0.90 : 1.0; // 10% faster when 3 engineers
  }

  BuildTime(this.baseSeconds);

  double computeTime({bool lowPower = false, bool damaged = false, int engineers = 0}) {
    double t = baseSeconds;
    if (lowPower) t *= lowPowerMultiplier;
    if (damaged) t *= damagedMultiplier;
    t *= engineerBoost(engineers);
    return t;
  }
}
