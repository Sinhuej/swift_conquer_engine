/// Swift Conquer – Scenario Definitions
///
/// A Scenario describes the starting conditions for a match:
/// - Map size
/// - Starting money
/// - Max units per side
/// - Storm mode / time limit
/// - Player starting positions & factions
///
/// The UI / game layer can present these as "Skirmish templates"
/// or "Special Modes" (e.g. Storm Mode, High-End 400-unit mode).

class PlayerStartConfig {
  /// 0-based player index (0..3 for 1v1, 2v2, etc.).
  final int playerIndex;

  /// Faction identifier (must exist in the faction registry).
  final String factionId;

  /// Starting tile coordinates for the Command Center / MCV spawn.
  final int startX;
  final int startY;

  /// Whether this player is controlled by AI.
  final bool isAi;

  /// Optional override for starting funds for this player.
  final int? startingFundsOverride;

  const PlayerStartConfig({
    required this.playerIndex,
    required this.factionId,
    required this.startX,
    required this.startY,
    this.isAi = false,
    this.startingFundsOverride,
  });
}

class ScenarioOptions {
  /// Base starting funds for players (can be overridden per player).
  final int startingFunds;

  /// Global maximum units per side for this scenario.
  final int maxUnitsPerSide;

  /// If true, "high-end device" override may increase max units.
  final bool allowHighEndUnitCap;

  /// Optional high-end cap (e.g. 400 units per side).
  final int? highEndMaxUnitsPerSide;

  /// If true, storm mode is enabled (bases must move or be destroyed).
  final bool stormModeEnabled;

  /// Time (in seconds) at which the storm event triggers.
  final int? stormTriggerTimeSeconds;

  /// If true, this scenario uses "Cheaters DLC" rules (mod-friendly mode).
  final bool cheaterDlcMode;

  const ScenarioOptions({
    required this.startingFunds,
    required this.maxUnitsPerSide,
    this.allowHighEndUnitCap = false,
    this.highEndMaxUnitsPerSide,
    this.stormModeEnabled = false,
    this.stormTriggerTimeSeconds,
    this.cheaterDlcMode = false,
  });
}

abstract class Scenario {
  /// Unique ID used internally (e.g. "demo_swift_conquer").
  String get id;

  /// User-facing name shown in menus.
  String get displayName;

  /// Short description for the mode selection screen.
  String get description;

  /// Map width in tiles.
  int get mapWidth;

  /// Map height in tiles.
  int get mapHeight;

  /// Scenario-wide rules & limits.
  ScenarioOptions get options;

  /// Player starting configurations (factions, positions, AI flags).
  List<PlayerStartConfig> get playerStarts;

  /// Optional: pre-seeded ore fields / resources / tech.
  ///
  /// For now this is just a hook; the game layer or map generator
  /// can plug into this later.
  Map<String, Object?> get metadata => const {};
}
