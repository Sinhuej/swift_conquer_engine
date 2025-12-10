/// Basic unit classification.
enum UnitClass {
  infantry,
  engineer,
  spy,
  tank,
  artillery,
  aircraft,
  helicopter,
  naval,
}

/// Static definition of a unit type: costs, build time, HP, etc.
class UnitDef {
  final String id;
  final String displayName;
  final UnitClass unitClass;
  final int cost;
  final Duration buildTime;
  final int maxHp;

  /// True if this unit can capture / infiltrate buildings.
  final bool canCaptureBuildings;

  /// True if this unit can repair friendly buildings.
  final bool canRepairBuildings;

  /// True if this unit can be crushed by tanks.
  final bool canBeCrushed;

  /// If true, production/build time is slowed in low power.
  final bool productionSlowedInLowPower;

  /// If true, ammo reload is slowed in low power
  /// (used for air / heli units).
  final bool ammoReloadSlowedInLowPower;

  const UnitDef({
    required this.id,
    required this.displayName,
    required this.unitClass,
    required this.cost,
    required this.buildTime,
    required this.maxHp,
    this.canCaptureBuildings = false,
    this.canRepairBuildings = false,
    this.canBeCrushed = true,
    this.productionSlowedInLowPower = true,
    this.ammoReloadSlowedInLowPower = false,
  });
}

/// Central registry of baseline unit definitions.
/// Faction-specific variants can wrap or override these stats.
class UnitData {
  static const Map<String, UnitDef> defs = {
    // --- Core infantry ---
    'rifle_infantry': UnitDef(
      id: 'rifle_infantry',
      displayName: 'Rifle Infantry',
      unitClass: UnitClass.infantry,
      cost: 100,
      buildTime: Duration(seconds: 4),
      maxHp: 100,
      canBeCrushed: true,
    ),
    'grenadier': UnitDef(
      id: 'grenadier',
      displayName: 'Grenadier',
      unitClass: UnitClass.infantry,
      cost: 150,
      buildTime: Duration(seconds: 5),
      maxHp: 110,
      canBeCrushed: true,
    ),
    'rocket_soldier': UnitDef(
      id: 'rocket_soldier',
      displayName: 'Rocket Soldier',
      unitClass: UnitClass.infantry,
      cost: 300,
      buildTime: Duration(seconds: 7),
      maxHp: 120,
      canBeCrushed: true,
    ),

    // --- Engineer & Spy ---
    'engineer': UnitDef(
      id: 'engineer',
      displayName: 'Engineer',
      unitClass: UnitClass.engineer,
      cost: 500,
      buildTime: Duration(seconds: 10),
      maxHp: 80,
      canCaptureBuildings: true,
      canRepairBuildings: true,
      canBeCrushed: true,
      productionSlowedInLowPower: true,
    ),
    'spy': UnitDef(
      id: 'spy',
      displayName: 'Spy',
      unitClass: UnitClass.spy,
      cost: 800,
      buildTime: Duration(seconds: 12),
      maxHp: 80,
      canCaptureBuildings: false,
      canRepairBuildings: false,
      canBeCrushed: true,
      productionSlowedInLowPower: true,
    ),

    // --- Tanks (baseline; each faction will later get unique skins/stats) ---
    'main_battle_tank': UnitDef(
      id: 'main_battle_tank',
      displayName: 'Main Battle Tank',
      unitClass: UnitClass.tank,
      cost: 900,
      buildTime: Duration(seconds: 18),
      maxHp: 700,
      canBeCrushed: false,
    ),
    'heavy_tank': UnitDef(
      id: 'heavy_tank',
      displayName: 'Heavy Tank',
      unitClass: UnitClass.tank,
      cost: 1400,
      buildTime: Duration(seconds: 24),
      maxHp: 950,
      canBeCrushed: false,
    ),
    'light_tank': UnitDef(
      id: 'light_tank',
      displayName: 'Light Tank',
      unitClass: UnitClass.tank,
      cost: 700,
      buildTime: Duration(seconds: 14),
      maxHp: 550,
      canBeCrushed: false,
    ),

    // --- Air & heli ---
    'attack_helicopter': UnitDef(
      id: 'attack_helicopter',
      displayName: 'Attack Helicopter',
      unitClass: UnitClass.helicopter,
      cost: 1200,
      buildTime: Duration(seconds: 22),
      maxHp: 600,
      canBeCrushed: false,
      ammoReloadSlowedInLowPower: true,
    ),
    'fighter_jet': UnitDef(
      id: 'fighter_jet',
      displayName: 'Fighter Jet',
      unitClass: UnitClass.aircraft,
      cost: 1400,
      buildTime: Duration(seconds: 24),
      maxHp: 650,
      canBeCrushed: false,
      ammoReloadSlowedInLowPower: true,
    ),

    // --- Naval baseline ---
    'patrol_boat': UnitDef(
      id: 'patrol_boat',
      displayName: 'Patrol Boat',
      unitClass: UnitClass.naval,
      cost: 800,
      buildTime: Duration(seconds: 18),
      maxHp: 600,
      canBeCrushed: false,
    ),
  };
}
