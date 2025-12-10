import '../core/game_state.dart';
import 'behavior_tree.dart';

/// High-level AI brain for one player / faction.
class AiController {
  final String playerId;
  final BehaviorNode rootBehavior;

  AiController({
    required this.playerId,
    required this.rootBehavior,
  });

  void update(double dtSeconds, GameState state) {
    rootBehavior.tick(dtSeconds);
  }
}
