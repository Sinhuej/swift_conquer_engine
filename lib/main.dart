/// Swift Conquer – Engine Library
///
/// Core simulation engine for Swift Conquer RTS.
/// The app/game layer (Flutter/Flame) depends on this package
/// and plugs rendering + input into these classes to run matches.

library swift_conquer_engine;

// Core engine
export 'engine/engine.dart';
export 'engine/core/game_state.dart';
export 'engine/core/event_bus.dart';
export 'engine/core/update_loop.dart';

// Map & factions
export 'engine/map/tile.dart';
export 'engine/map/tile_map.dart';
export 'engine/map/fog_of_war.dart';
export 'factions/faction.dart';
export 'engine/factions/faction.dart';
export 'engine/factions/faction_unit_ids.dart';
export 'engine/factions/faction_registry.dart';

// Entities & units
export 'engine/units/base_unit.dart';
export 'engine/buildings/base_building.dart';
export 'engine/buildings/construction_queue.dart';

// Resources & combat
export 'engine/resources/economy.dart';
export 'engine/resources/resource_node.dart';
export 'engine/combat/combat_system.dart';
