import 'dart:async';

import 'core/game_state.dart';
import 'core/update_loop.dart';
import 'core/event_bus.dart';

/// Central simulation engine for Swift Conquer.
///
/// This is platform-agnostic. The Flutter/Flame app layer should:
///  - create a GameState
///  - create an Engine
///  - call engine.start() / engine.stop()
///  - subscribe to EventBus for UI updates & sounds.
class Engine {
  final GameState gameState;
  final EventBus eventBus;
  late final UpdateLoop _loop;

  Engine({
    required this.gameState,
    EventBus? bus,
  }) : eventBus = bus ?? EventBus() {
    _loop = UpdateLoop(onTick: _onTick);
  }

  bool get isRunning => _loop.isRunning;

  void start() => _loop.start();
  void stop() => _loop.stop();

  void _onTick(double dtSeconds) {
    gameState.update(dtSeconds, eventBus);
  }
}

// --- Config imports (Phase 5) ---
import 'config/game_rules.dart';
import 'config/dlc_flags.dart';
import 'config/anti_cheat_config.dart';

/// Container for top-level configuration used by the engine.
class EngineRuntimeConfig {
  final GameRules gameRules;
  final DlcFlags dlcFlags;
  final AntiCheatConfig antiCheat;

  const EngineRuntimeConfig({
    required this.gameRules,
    required this.dlcFlags,
    required this.antiCheat,
  });

  factory EngineRuntimeConfig.defaultDev() {
    return EngineRuntimeConfig(
      gameRules: GameRules.standard(),
      dlcFlags: DlcFlags.allOn(),
      antiCheat: AntiCheatConfig.strict(),
    );
  }
}
