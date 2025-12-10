import 'faction.dart';
import 'faction_unit_ids.dart';

class FactionRegistry {
  static final Map<String, Faction> factions = {

    // -----------------------------------------------------------
    // 1. GOLD-BLUE ALLIANCE (FACTION 1)
    // -----------------------------------------------------------
    "faction_1": Faction(
      id: "faction_1",
      displayName: "Aurelia Guard",
      description: "High-tech disciplined army with energy shields and precise weaponry.",
      startingUnits: [
        UnitIDs.rifleInfantry,
        UnitIDs.tank1,
      ],
      startingBuildings: ["command_center", "power_plant"],
      bonuses: {
        "armor_bonus": 0.10,
        "shield_regen": 0.05,
      },
      penalties: {
        "build_speed": -0.05,
      },
      techTree: [
        "energy_shields",
        "precision_lasers",
        "chrono_upgrade",
      ],
      colorPalette: [0xFFE8C21E, 0xFF1837FF], // gold + blue
    ),

    // -----------------------------------------------------------
    // 2. ORANGE INDUSTRIAL DOMINION
    // -----------------------------------------------------------
    "faction_2": Faction(
      id: "faction_2",
      displayName: "Iron Dominion",
      description: "Heavy industrial faction with brute force tanks and durable units.",
      startingUnits: [
        UnitIDs.tank2,
        UnitIDs.rifleInfantry,
      ],
      startingBuildings: ["command_center", "refinery"],
      bonuses: {
        "tank_health": 0.20,
        "siege_damage": 0.15,
      },
      penalties: {
        "air_unit_speed": -0.10,
      },
      techTree: [
        "overdrive_engines",
        "super_armor_plating",
      ],
      colorPalette: [0xFFCC5A1A, 0xFF8A3B12],
    ),

    // -----------------------------------------------------------
    // 3. PURPLE SHADOW SYNDICATE
    // -----------------------------------------------------------
    "faction_3": Faction(
      id: "faction_3",
      displayName: "Shadow Syndicate",
      description: "Stealth, sabotage, hacking, and ambush tactics.",
      startingUnits: [
        UnitIDs.spy,
        UnitIDs.tank3,
      ],
      startingBuildings: ["command_center", "stealth_lab"],
      bonuses: {
        "stealth_duration": 0.25,
        "spy_speed": 0.20,
      },
      penalties: {
        "armor": -0.10,
      },
      techTree: [
        "advanced_cloak",
        "neural_hack",
      ],
      colorPalette: [0xFF9A3BFF, 0xFF5A1AAE],
    ),

    // -----------------------------------------------------------
    // 4. GREEN EAGLE BATTALION
    // -----------------------------------------------------------
    "faction_4": Faction(
      id: "faction_4",
      displayName: "Eagle Battalion",
      description: "Fast-moving, air-focused, elite military force.",
      startingUnits: [
        UnitIDs.rifleInfantry,
        UnitIDs.tank4,
      ],
      startingBuildings: ["command_center", "airfield"],
      bonuses: {
        "air_speed": 0.20,
        "resource_efficiency": 0.10,
      },
      penalties: {
        "tank_armor": -0.05,
      },
      techTree: [
        "advanced_rotors",
        "hawk_scout_drones",
      ],
      colorPalette: [0xFF2F5E1B, 0xFFE1D25A],
    ),

    // -----------------------------------------------------------
    // 5. TEAL FUTURE COLLECTIVE
    // -----------------------------------------------------------
    "faction_5": Faction(
      id: "faction_5",
      displayName: "Horizon Collective",
      description: "Advanced robotics and clean energy technology.",
      startingUnits: [
        UnitIDs.tank5,
        UnitIDs.rifleInfantry,
      ],
      startingBuildings: ["command_center", "tech_lab"],
      bonuses: {
        "build_speed": 0.10,
        "energy_efficiency": 0.15,
      },
      penalties: {
        "infantry_cost": 0.10,
      },
      techTree: [
        "fusion_core",
        "auto_repair_nanobots",
      ],
      colorPalette: [0xFF4ED7C7, 0xFF1E3A3A],
    ),

    // -----------------------------------------------------------
    // 6. RED DESERT LEGION
    // -----------------------------------------------------------
    "faction_6": Faction(
      id: "faction_6",
      displayName: "Crimson Legion",
      description: "Sand-hardened warriors using heat weaponry and rugged vehicles.",
      startingUnits: [
        UnitIDs.tank6,
        UnitIDs.rifleInfantry,
      ],
      startingBuildings: ["command_center", "armory"],
      bonuses: {
        "heat_damage": 0.15,
        "terrain_advantage_desert": 0.20,
      },
      penalties: {
        "water_unit_speed": -0.10,
      },
      techTree: [
        "flame_projectors",
        "sandstorm_shielding",
      ],
      colorPalette: [0xFFD04848, 0xFFAA2626],
    ),

    // -----------------------------------------------------------
    // 7. FINAL FACTION (YOU CHOSE OPTION D)
    // -----------------------------------------------------------
    "faction_7": Faction(
      id: "faction_7",
      displayName: "Nightfall Directorate",
      description:
          "Advanced blue-tech stealth operatives with elite snipers, saboteurs, and precision hover tanks.",
      startingUnits: [
        UnitIDs.spy,
        UnitIDs.tank7,
      ],
      startingBuildings: ["command_center", "intel_center"],
      bonuses: {
        "vision_range": 0.15,
        "projectile_accuracy": 0.20,
      },
      penalties: {
        "building_health": -0.10,
      },
      techTree: [
        "penetration_rounds",
        "neural_scan_detection",
      ],
      colorPalette: [0xFF0077FF, 0xFF001A33],
    ),

  };
}
