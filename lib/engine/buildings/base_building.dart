/// Core base-building definition for Swift Conquer engine.
class BaseBuilding {
  final String id;
  final String type; // e.g. "power_plant", "war_factory"
  final int maxHealth;
  final int cost; // in ore/credits
  final int buildTimeSeconds; // how long it takes to build from 0% to 100%

  int _currentHealth;
  bool _isUnderConstruction;
  double _constructionProgress; // 0.0 to 1.0

  BaseBuilding({
    required this.id,
    required this.type,
    required this.maxHealth,
    required this.cost,
    required this.buildTimeSeconds,
  })  : _currentHealth = maxHealth,
        _isUnderConstruction = false,
        _constructionProgress = 0.0;

  int get currentHealth => _currentHealth;
  bool get isUnderConstruction => _isUnderConstruction;
  double get constructionProgress => _constructionProgress;

  /// Call when placed in build queue.
  void startConstruction() {
    _isUnderConstruction = true;
    _constructionProgress = 0.0;
    _currentHealth = 1; // tiny sliver while building
  }

  /// dtSeconds is the time step from the engine update loop.
  void updateConstruction(double dtSeconds) {
    if (!_isUnderConstruction || buildTimeSeconds <= 0) return;

    final delta = dtSeconds / buildTimeSeconds;
    _constructionProgress += delta;

    if (_constructionProgress >= 1.0) {
      _constructionProgress = 1.0;
      _isUnderConstruction = false;
      _currentHealth = maxHealth;
    }
  }

  void applyDamage(int amount) {
    _currentHealth -= amount;
    if (_currentHealth < 0) _currentHealth = 0;
  }

  bool get isDestroyed => _currentHealth <= 0;
}
