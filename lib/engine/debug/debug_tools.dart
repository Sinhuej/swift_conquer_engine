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
