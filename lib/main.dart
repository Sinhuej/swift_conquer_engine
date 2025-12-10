/// Swift Conquer – Engine Library
///
/// This package defines the core simulation engine for the Swift Conquer RTS.
/// The app/game layer (Flutter/Flame) will depend on this package and call
/// into these classes to run matches.

library swift_conquer_engine;

// Core engine
export 'engine/engine.dart';
export 'engine/game_state.dart';
export 'engine/timing.dart';
export 'engine/id_generator.dart';

// Map & factions
export 'map/map_grid.dart';
export 'factions/faction.dart';

// Entities
export 'entities/entity_base.dart';
export 'entities/unit_base.dart';
export 'entities/building_base.dart';

