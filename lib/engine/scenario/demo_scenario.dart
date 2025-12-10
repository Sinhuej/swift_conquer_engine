/// Swift Conquer – Demo Scenario
///
/// This provides a "default skirmish" configuration that matches
/// your design:
/// - 6+ factions supported
/// - 200 units per side base cap
/// - Optional 400 units per side for high-end mode
/// - Starting funds 15000 (customizable later)
/// - Storm mode optional, can be toggled via game rules / DLC flags.

import 'scenario.dart';

class DemoSwiftConquerScenario extends Scenario {
  @override
  String get id => 'demo_swift_conquer';

  @override
  String get displayName => 'Swift Conquer – Demo Skirmish';

  @override
  String get description =>
      'Standard 1v1 / 2v2-capable layout with customizable funds, '
      'storm mode option, and high-end unit caps.';

  @override
  int get mapWidth => 128;

  @override
  int get mapHeight => 128;

  @override
  ScenarioOptions get options => const ScenarioOptions(
        startingFunds: 15000,
        maxUnitsPerSide: 200,
        allowHighEndUnitCap: true,
        highEndMaxUnitsPerSide: 400,
        stormModeEnabled: false,
        stormTriggerTimeSeconds: null,
        cheaterDlcMode: false,
      );

  /// Example player layout:
  /// - Player 0: Faction "gold_alliance" (top-left)
  /// - Player 1: Faction "iron_dominion" (bottom-right)
  /// (Later you can expand this to support 2v2 and more factions.)
  @override
  List<PlayerStartConfig> get playerStarts => const [
        PlayerStartConfig(
          playerIndex: 0,
          factionId: 'gold_alliance',
          startX: 16,
          startY: 16,
          isAi: false,
        ),
        PlayerStartConfig(
          playerIndex: 1,
          factionId: 'iron_dominion',
          startX: 112,
          startY: 112,
          isAi: true,
        ),
      ];

  @override
  Map<String, Object?> get metadata => const {
        'recommendedMode': '1v1',
        'supports2v2': true,
        'descriptionTag': 'standard_skirmish',
      };
}
