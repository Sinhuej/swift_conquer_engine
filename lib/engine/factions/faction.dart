/// Base faction definition for Swift Conquer.
///
/// Each faction has:
/// - unique tanks
/// - unique infantry (beyond basic rifle/rocket/grenade)
/// - spy unit
/// - color palette
/// - bonuses
/// - penalties
/// - tech unlocks
/// - build style

class Faction {
  final String id;
  final String displayName;
  final String description;

  final List<String> startingUnits;
  final List<String> startingBuildings;

  final Map<String, double> bonuses;
  final Map<String, double> penalties;

  final List<String> techTree;
  final List<int> colorPalette; // RGB hex ints

  const Faction({
    required this.id,
    required this.displayName,
    required this.description,
    required this.startingUnits,
    required this.startingBuildings,
    required this.bonuses,
    required this.penalties,
    required this.techTree,
    required this.colorPalette,
  });
}
