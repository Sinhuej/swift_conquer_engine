#!/data/data/com.termux/files/usr/bin/bash
set -e

# Simple helper: create parent dirs, then write file from stdin
write_file() {
  mkdir -p "$(dirname "$1")"
  cat > "$1"
}

echo "== Phase 14: Creating engine debug helpers =="

# 1) Debug tools placeholder
write_file "lib/engine/debug/debug_tools.dart" <<'EOT'
/// Engine debug utilities for Swift Conquer.
///
/// This file is intentionally lightweight for now — it gives us a place
/// to put helper functions that spawn test units, log state, or build
/// quick demo scenarios while we flesh out the full engine.
///
/// You can expand this later with:
///  - spawnTestScenario()
///  - logTickStats()
///  - dumpFactionSummary()
///  - verifyBuildQueues(), etc.

library swift_conquer_engine_debug_tools;

class EngineDebugTools {
  /// Example toggle flag so you can quickly turn debug logging on/off.
  bool loggingEnabled = false;

  void log(String message) {
    if (!loggingEnabled) return;
    // In the future you might hook this into a UI console, file logger, etc.
    // For now this is just a placeholder.
    // ignore: avoid_print
    print('[SwiftConquer][DEBUG] $message');
  }

  /// Placeholder hook for future validation routines.
  ///
  /// For example, you might:
  ///  - verify unit counts per faction
  ///  - check that power/resource values are within valid ranges
  ///  - assert no negative HP, etc.
  void runBasicHealthCheck() {
    // TODO: wire this into GameState when you're ready.
  }
}
EOT

# 2) Sim runner placeholder
write_file "lib/engine/debug/sim_runner.dart" <<'EOT'
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
EOT

echo "✔ Phase 14 - Engine debug helpers created"
