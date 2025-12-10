/// Core base unit definition for Swift Conquer engine.
class BaseUnit {
  final String id;
  final String type; // e.g. "tank", "rifleman", "chopper"
  final int maxHealth;
  final int cost; // in ore/credits
  final int buildTimeSeconds;

  int _currentHealth;

  BaseUnit({
    required this.id,
    required this.type,
    required this.maxHealth,
    required this.cost,
    required this.buildTimeSeconds,
  }) : _currentHealth = maxHealth;

  int get currentHealth => _currentHealth;

  void applyDamage(int amount) {
    _currentHealth -= amount;
    if (_currentHealth < 0) _currentHealth = 0;
  }

  bool get isDestroyed => _currentHealth <= 0;
}
