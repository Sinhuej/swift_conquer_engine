import '../core/game_state.dart';

/// Hooks that the Flutter/Flame layer can implement to bridge engine + UI.
abstract class EngineUiHooks {
  /// Called after each engine tick with the current game state.
  void onStateUpdated(GameState state);

  /// Optional: called when the match ends.
  void onMatchEnded(String winningPlayerId);
}
