/// Swift Conquer - Core game rules configuration.
///
/// This file defines the high-level knobs that control how a match
/// of Swift Conquer behaves: unit caps, engineer behavior, low power
/// penalties, storm mode, spectator limits, etc.

class GameRules {
  /// Max active units per side for normal devices.
  final int maxUnitsPerSide;

  /// Max active units per side for "high-end device" mode.
  final int maxUnitsPerSideHighEnd;

  /// Starting credits for a standard match.
  final int startingFunds;

  /// Whether players can customize starting funds in lobby.
  final bool allowCustomStartingFunds;

  /// Whether ore silos are required to store overflow resources.
  final bool useSilos;

  /// Max number of engineers that can repair a single building at once.
  final int maxEngineersPerBuilding;

  /// Whether 3 engineers at once grants a temporary repair speed bonus.
  final bool engineersGrantTeamBonus;

  /// Percentage bonus to repair speed when the maximum engineers are assigned.
  final double engineerMaxTeamBonusPercent;

  /// Duration (in seconds) of the engineer team bonus.
  final int engineerBonusDurationSeconds;

  /// Whether manual "wrench" repair is allowed.
  final bool allowManualRepair;

  /// Whether manual repair consumes power.
  final bool manualRepairConsumesPower;

  /// Whether infantry can be crushed by vehicles (if option enabled by host).
  final bool infantryCrushEnabled;

  /// Whether infantry crush is a lobby option (host toggle).
  final bool infantryCrushIsLobbyOption;

  /// Whether low power slows production of buildings & units.
  final bool lowPowerSlowsProduction;

  /// Whether low power slows special weapons (charge/ready state).
  final bool lowPowerStopsSuperWeapons;

  /// Whether low power slows aircraft reload only (not movement).
  final bool lowPowerSlowsAircraftReload;

  /// Whether tanks & aircraft continue to move and fire at full speed
  /// even in low power (only reload/build/production is affected).
  final bool combatSpeedUnaffectedByLowPower;

  /// Whether storm mode is enabled for this match.
  final bool stormModeEnabled;

  /// Time in seconds before the first global storm event hits.
  final int stormFirstStrikeSeconds;

  /// Time in seconds between subsequent storms (if storm mode enabled).
  final int stormIntervalSeconds;

  /// Whether storms force players to relocate (e.g. wipe or heavily damage bases).
  final bool stormDestroysBases;

  /// Whether spectator mode is allowed.
  final bool spectatorsAllowed;

  /// Maximum number of spectators in a single match.
  final int maxSpectators;

  /// Whether AI players are allowed to fill empty slots.
  final bool allowAiPlayers;

  /// Whether 2v2 (or team modes) require Battle Pass / DLC.
  final bool teamModesRequireBattlePass;

  const GameRules({
    required this.maxUnitsPerSide,
    required this.maxUnitsPerSideHighEnd,
    required this.startingFunds,
    required this.allowCustomStartingFunds,
    required this.useSilos,
    required this.maxEngineersPerBuilding,
    required this.engineersGrantTeamBonus,
    required this.engineerMaxTeamBonusPercent,
    required this.engineerBonusDurationSeconds,
    required this.allowManualRepair,
    required this.manualRepairConsumesPower,
    required this.infantryCrushEnabled,
    required this.infantryCrushIsLobbyOption,
    required this.lowPowerSlowsProduction,
    required this.lowPowerStopsSuperWeapons,
    required this.lowPowerSlowsAircraftReload,
    required this.combatSpeedUnaffectedByLowPower,
    required this.stormModeEnabled,
    required this.stormFirstStrikeSeconds,
    required this.stormIntervalSeconds,
    required this.stormDestroysBases,
    required this.spectatorsAllowed,
    required this.maxSpectators,
    required this.allowAiPlayers,
    required this.teamModesRequireBattlePass,
  });

  /// Default "standard" Swift Conquer rules.
  ///
  /// These match your current design:
  /// - 200 units per side, 400 with high-end mode.
  /// - Starting funds = 15000.
  /// - Silos store ore overflow.
  /// - Up to 3 engineers per building.
  /// - 3 engineers together grant a 10% repair speed bonus for 5 seconds.
  /// - Manual repair does NOT drain power.
  /// - Low power slows production & reloads, but not unit movement/fire.
  /// - Superweapons shut off in low power.
  /// - Storm mode is OFF by default (lobby option).
  /// - Up to 5 spectators.
  factory GameRules.standard() {
    return const GameRules(
      maxUnitsPerSide: 200,
      maxUnitsPerSideHighEnd: 400,
      startingFunds: 15000,
      allowCustomStartingFunds: true,
      useSilos: true,
      maxEngineersPerBuilding: 3,
      engineersGrantTeamBonus: true,
      engineerMaxTeamBonusPercent: 10.0,
      engineerBonusDurationSeconds: 5,
      allowManualRepair: true,
      manualRepairConsumesPower: false,
      infantryCrushEnabled: true,
      infantryCrushIsLobbyOption: true,
      lowPowerSlowsProduction: true,
      lowPowerStopsSuperWeapons: true,
      lowPowerSlowsAircraftReload: true,
      combatSpeedUnaffectedByLowPower: true,
      stormModeEnabled: false,
      stormFirstStrikeSeconds: 900, // 15 minutes default
      stormIntervalSeconds: 600,    // 10 minutes between storms
      stormDestroysBases: true,
      spectatorsAllowed: true,
      maxSpectators: 5,
      allowAiPlayers: true,
      teamModesRequireBattlePass: true,
    );
  }

  GameRules copyWith({
    int? maxUnitsPerSide,
    int? maxUnitsPerSideHighEnd,
    int? startingFunds,
    bool? allowCustomStartingFunds,
    bool? useSilos,
    int? maxEngineersPerBuilding,
    bool? engineersGrantTeamBonus,
    double? engineerMaxTeamBonusPercent,
    int? engineerBonusDurationSeconds,
    bool? allowManualRepair,
    bool? manualRepairConsumesPower,
    bool? infantryCrushEnabled,
    bool? infantryCrushIsLobbyOption,
    bool? lowPowerSlowsProduction,
    bool? lowPowerStopsSuperWeapons,
    bool? lowPowerSlowsAircraftReload,
    bool? combatSpeedUnaffectedByLowPower,
    bool? stormModeEnabled,
    int? stormFirstStrikeSeconds,
    int? stormIntervalSeconds,
    bool? stormDestroysBases,
    bool? spectatorsAllowed,
    int? maxSpectators,
    bool? allowAiPlayers,
    bool? teamModesRequireBattlePass,
  }) {
    return GameRules(
      maxUnitsPerSide: maxUnitsPerSide ?? this.maxUnitsPerSide,
      maxUnitsPerSideHighEnd:
          maxUnitsPerSideHighEnd ?? this.maxUnitsPerSideHighEnd,
      startingFunds: startingFunds ?? this.startingFunds,
      allowCustomStartingFunds:
          allowCustomStartingFunds ?? this.allowCustomStartingFunds,
      useSilos: useSilos ?? this.useSilos,
      maxEngineersPerBuilding:
          maxEngineersPerBuilding ?? this.maxEngineersPerBuilding,
      engineersGrantTeamBonus:
          engineersGrantTeamBonus ?? this.engineersGrantTeamBonus,
      engineerMaxTeamBonusPercent:
          engineerMaxTeamBonusPercent ?? this.engineerMaxTeamBonusPercent,
      engineerBonusDurationSeconds:
          engineerBonusDurationSeconds ?? this.engineerBonusDurationSeconds,
      allowManualRepair: allowManualRepair ?? this.allowManualRepair,
      manualRepairConsumesPower:
          manualRepairConsumesPower ?? this.manualRepairConsumesPower,
      infantryCrushEnabled:
          infantryCrushEnabled ?? this.infantryCrushEnabled,
      infantryCrushIsLobbyOption:
          infantryCrushIsLobbyOption ?? this.infantryCrushIsLobbyOption,
      lowPowerSlowsProduction:
          lowPowerSlowsProduction ?? this.lowPowerSlowsProduction,
      lowPowerStopsSuperWeapons:
          lowPowerStopsSuperWeapons ?? this.lowPowerStopsSuperWeapons,
      lowPowerSlowsAircraftReload:
          lowPowerSlowsAircraftReload ?? this.lowPowerSlowsAircraftReload,
      combatSpeedUnaffectedByLowPower:
          combatSpeedUnaffectedByLowPower ??
              this.combatSpeedUnaffectedByLowPower,
      stormModeEnabled: stormModeEnabled ?? this.stormModeEnabled,
      stormFirstStrikeSeconds:
          stormFirstStrikeSeconds ?? this.stormFirstStrikeSeconds,
      stormIntervalSeconds:
          stormIntervalSeconds ?? this.stormIntervalSeconds,
      stormDestroysBases: stormDestroysBases ?? this.stormDestroysBases,
      spectatorsAllowed: spectatorsAllowed ?? this.spectatorsAllowed,
      maxSpectators: maxSpectators ?? this.maxSpectators,
      allowAiPlayers: allowAiPlayers ?? this.allowAiPlayers,
      teamModesRequireBattlePass:
          teamModesRequireBattlePass ?? this.teamModesRequireBattlePass,
    );
  }
}
