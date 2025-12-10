import '../core/engine_config.dart';

/// Types of buildings in Swift Conquer.
enum BuildingType {
  commandCenter,
  powerPlant,
  refinery,
  oreSilo,
  barracks,
  warFactory,
  airfield,
  navalYard,
  techCenter,
  radar,
  turret,
  aaTurret,
  superWeapon,
  mobileCommandCenter,
}

/// Static definition of a building: costs, build time, HP, power, etc.
class BuildingDef {
  final BuildingType type;
  final String id;
  final String displayName;
  final int baseCost;
  final Duration buildTime;
  final int maxHp;

  /// Power consumed by this building (positive for usage).
  final int powerUsage;

  /// Power produced by this building (positive for output).
  final int powerOutput;

  /// If true, production/behavior is slowed in low power.
  final bool affectedByLowPower;

  /// If true, completely shuts off in low power
  /// (e.g., superweapons, radar).
  final bool shutsDownInLowPower;

  /// Indicates this is a production building (war factory, barracks, etc.)
  final bool isProductionBuilding;

  /// Indicates this is a superweapon building.
  final bool isSuperWeapon;

  const BuildingDef({
    required this.type,
    required this.id,
    required this.displayName,
    required this.baseCost,
    required this.buildTime,
    required this.maxHp,
    this.powerUsage = 0,
    this.powerOutput = 0,
    this.affectedByLowPower = true,
    this.shutsDownInLowPower = false,
    this.isProductionBuilding = false,
    this.isSuperWeapon = false,
  });
}

/// Central registry of building definitions.
/// These are baseline values; faction-specific modifiers can be
/// applied on top of these stats.
class BuildingData {
  static const Map<BuildingType, BuildingDef> defs = {
    BuildingType.commandCenter: BuildingDef(
      type: BuildingType.commandCenter,
      id: 'command_center',
      displayName: 'Command Center',
      baseCost: 2500,
      buildTime: Duration(seconds: 40),
      maxHp: 5000,
      powerUsage: 0,
      powerOutput: 0,
      affectedByLowPower: false,
    ),
    BuildingType.powerPlant: BuildingDef(
      type: BuildingType.powerPlant,
      id: 'power_plant',
      displayName: 'Power Plant',
      baseCost: 800,
      buildTime: Duration(seconds: 20),
      maxHp: 1800,
      powerUsage: 0,
      powerOutput: 200,
      affectedByLowPower: false,
    ),
    BuildingType.refinery: BuildingDef(
      type: BuildingType.refinery,
      id: 'refinery',
      displayName: 'Ore Refinery',
      baseCost: 2000,
      buildTime: Duration(seconds: 35),
      maxHp: 3000,
      powerUsage: 60,
      powerOutput: 0,
      affectedByLowPower: true,
    ),
    BuildingType.oreSilo: BuildingDef(
      type: BuildingType.oreSilo,
      id: 'ore_silo',
      displayName: 'Ore Silo',
      baseCost: 600,
      buildTime: Duration(seconds: 18),
      maxHp: 1500,
      powerUsage: 10,
      powerOutput: 0,
      affectedByLowPower: false,
    ),
    BuildingType.barracks: BuildingDef(
      type: BuildingType.barracks,
      id: 'barracks',
      displayName: 'Barracks',
      baseCost: 600,
      buildTime: Duration(seconds: 18),
      maxHp: 1800,
      powerUsage: 20,
      powerOutput: 0,
      affectedByLowPower: true,
      isProductionBuilding: true,
    ),
    BuildingType.warFactory: BuildingDef(
      type: BuildingType.warFactory,
      id: 'war_factory',
      displayName: 'War Factory',
      baseCost: 2000,
      buildTime: Duration(seconds: 35),
      maxHp: 3500,
      powerUsage: 40,
      powerOutput: 0,
      affectedByLowPower: true,
      isProductionBuilding: true,
    ),
    BuildingType.airfield: BuildingDef(
      type: BuildingType.airfield,
      id: 'airfield',
      displayName: 'Airfield',
      baseCost: 1600,
      buildTime: Duration(seconds: 30),
      maxHp: 2500,
      powerUsage: 40,
      powerOutput: 0,
      affectedByLowPower: true,
      isProductionBuilding: true,
    ),
    BuildingType.navalYard: BuildingDef(
      type: BuildingType.navalYard,
      id: 'naval_yard',
      displayName: 'Naval Yard',
      baseCost: 1800,
      buildTime: Duration(seconds: 32),
      maxHp: 2800,
      powerUsage: 40,
      powerOutput: 0,
      affectedByLowPower: true,
      isProductionBuilding: true,
    ),
    BuildingType.techCenter: BuildingDef(
      type: BuildingType.techCenter,
      id: 'tech_center',
      displayName: 'Tech Center',
      baseCost: 2500,
      buildTime: Duration(seconds: 40),
      maxHp: 2500,
      powerUsage: 60,
      powerOutput: 0,
      affectedByLowPower: true,
    ),
    BuildingType.radar: BuildingDef(
      type: BuildingType.radar,
      id: 'radar',
      displayName: 'Radar Array',
      baseCost: 1200,
      buildTime: Duration(seconds: 25),
      maxHp: 2000,
      powerUsage: 40,
      powerOutput: 0,
      affectedByLowPower: true,
      shutsDownInLowPower: true,
    ),
    BuildingType.turret: BuildingDef(
      type: BuildingType.turret,
      id: 'turret',
      displayName: 'Defense Turret',
      baseCost: 800,
      buildTime: Duration(seconds: 18),
      maxHp: 1600,
      powerUsage: 15,
      powerOutput: 0,
      affectedByLowPower: true,
    ),
    BuildingType.aaTurret: BuildingDef(
      type: BuildingType.aaTurret,
      id: 'aa_turret',
      displayName: 'AA Turret',
      baseCost: 900,
      buildTime: Duration(seconds: 20),
      maxHp: 1500,
      powerUsage: 20,
      powerOutput: 0,
      affectedByLowPower: true,
    ),
    BuildingType.superWeapon: BuildingDef(
      type: BuildingType.superWeapon,
      id: 'super_weapon',
      displayName: 'Superweapon Facility',
      baseCost: 5000,
      buildTime: Duration(seconds: 60),
      maxHp: 3200,
      powerUsage: 100,
      powerOutput: 0,
      affectedByLowPower: true,
      shutsDownInLowPower: EngineConfig.superWeaponsDisabledInLowPower,
      isSuperWeapon: true,
    ),
    BuildingType.mobileCommandCenter: BuildingDef(
      type: BuildingType.mobileCommandCenter,
      id: 'mobile_cc',
      displayName: 'Mobile Command Center',
      baseCost: 3000,
      buildTime: Duration(seconds: 45),
      maxHp: 3800,
      powerUsage: 30,
      powerOutput: 0,
      affectedByLowPower: false,
    ),
  };
}
