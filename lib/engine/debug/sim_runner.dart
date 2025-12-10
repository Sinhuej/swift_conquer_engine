/// Simple simulation runner scaffold for Swift Conquer.
///
/// This is meant as a *headless* (no graphics) way to advance the engine
/// for debugging, tests, or future command-line tools.
///
/// Later you can:
///  - Inject a GameState
///  - Advance time in fixed steps
///  - Capture logs / metrics for balancing.

class EngineSimRunner {
  /// Total simulated time in seconds.
  double simulatedTime = 0;

  /// Advance the simulation by [dt] seconds.
  ///
  /// In the future this will call into your real engine update loop.
  void step(double dt) {
    if (dt <= 0) return;
    simulatedTime += dt;
    // TODO: call your core engine update(dt) here when ready.
  }

  /// Runs N fixed steps for quick experiments.
  void runSteps(int steps, {double dt = 0.016}) {
    for (var i = 0; i < steps; i++) {
      step(dt);
    }
  }
}
