/// Global engine configuration & balance toggles for Swift Conquer.
///
/// These values capture high-level rules you defined:
/// - 200 units per side (400 on high-end mode)
/// - Low power slows buildings, production, and ammo reload
/// - Superweapons shut off in low power
/// - Engineers give a 10% repair burst when all 3 are active
/// - Infantry can be crushed (optionally)
/// - Spy tech stealing with forced sell at 10% value
/// - Storm mode and DLC feature flags

class EngineConfig {
  const EngineConfig._();

  // --- Unit limits ---
  static const int defaultMaxUnitsPerSide = 200;
  static const int highEndMaxUnitsPerSide = 400;

  // --- Economy & starting funds ---
  static const int defaultStartingFunds = 15000;
  static const int minStartingFunds = 2000;
  static const int maxStartingFunds = 100000;

  // --- Power / low power rules ---
  // Buildings & production slowdown under low power.
  static const double lowPowerBuildingSpeedMultiplier = 0.5;
  static const double lowPowerUnitProductionMultiplier = 0.5;
  // Aircraft & helis reload ammo slower in low power.
  static const double lowPowerAircraftReloadMultiplier = 0.6;
  // Superweapons are completely offline when low power.
  static const bool superWeaponsDisabledInLowPower = true;

  // --- Repair rules (engineers + manual repair) ---
  // Max number of engineers that can repair one building at once.
  static const int maxEngineersPerBuilding = 3;

  // When exactly 3 engineers are repairing the same building,
  // apply a temporary 10% bonus to repair effectiveness.
  static const double tripleEngineerRepairBonusPercent = 10.0;
  static const Duration tripleEngineerBonusDuration =
      Duration(seconds: 5);

  // Manual repair (wrench button) does NOT consume power.
  static const bool manualRepairUsesPower = false;
  // Manual repair and engineer repair cannot stack at same time.
  static const bool manualRepairCanStackWithEngineers = false;

  // --- Infantry crush & sabotage rules ---
  // Infantry can be crushed by tanks if this is enabled.
  static const bool infantryCanBeCrushedByTanks = true;
  // Players can toggle this per match in game settings.
  static const bool infantryCrushIsToggleablePerMatch = true;

  // When an engineer or worker is killed/squished near a building,
  // there is a small chance the building gets a persistent fault.
  static const double sabotageOnEngineerDeathChancePercent = 10.0;
  // Example: leaking pipe / electrical fault causing slow HP decay,
  // handled by higher-level systems using this chance.

  // --- Spy & tech stealing rules ---
  // Spies can infiltrate special tech buildings to steal tech.
  static const bool spyCanStealFactionTech = true;
  // Time window (seconds) where an observant player can react/notice.
  static const double spyDetectionWindowSeconds = 3.0;
  // When tech is successfully stolen, the victim must sell that
  // infiltrated building at only 10% value to deny the stolen tech.
  static const double stolenBuildingForcedSellRefundPercent = 10.0;

  // --- Storm / doomsday mode rules ---
  // Special match mode where a storm eventually wipes out bases
  // and forces relocation / mobile command center play.
  static const bool stormModeEnabledByDefault = false;
  static const Duration stormWarningTime = Duration(minutes: 12);
  static const Duration stormStrikeDuration = Duration(minutes: 1);

  // --- Anti-cheat & sandbox flags ---
  // In ranked/normal, cheaters get their base rapidly destroyed.
  static const bool antiCheatEnabled = true;

  // Special "cheaters / modders sandbox" DLC mode where people
  // who want to mod or mess around can play together without
  // affecting the legit ecosystem.
  static const bool dlcCheatersSandboxEnabled = true;

  // --- DLC / monetization feature flags ---
  static const bool dlcPremiumMapEditorEnabled = true;
  static const bool dlcBattlePassEnabled = true;
  static const bool dlcTwoVTwoModeEnabled = true;
  static const bool dlcSpectatorModeEnabled = true;
}
