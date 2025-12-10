/// Simple credit / ore economy for a single player.
class Economy {
  double credits = 15000; // default starting funds – customizable later.

  bool canAfford(double cost) => credits >= cost;

  bool trySpend(double cost) {
    if (!canAfford(cost)) return false;
    credits -= cost;
    return true;
  }

  void addIncome(double amount) {
    credits += amount;
  }
}
