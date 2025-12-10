/// Swift Conquer - Anti-cheat configuration.
///
/// This describes high-level behavior when cheating is detected.
/// The actual detection will live in a separate system, but the
/// engine will read these knobs to decide how hard to punish.

class AntiCheatConfig {
  /// Whether anti-cheat is enabled at all.
  final bool enabled;

  /// Whether cheaters should be instantly eliminated.
  final bool instantEliminateCheaters;

  /// Whether buildings & units should rapidly decay instead of
  /// popping instantly (the "melt the base" punishment).
  final bool useDecayPunishment;

  /// Duration in seconds over which the punishment decay runs.
  final int decayDurationSeconds;

  /// Whether to display the "Player Cheated - No Cheating Allowed"
  /// marker where the base was.
  final bool showCheaterGraveMarker;

  /// Whether detected cheaters should be moved to the "cheaters / modders"
  /// DLC queue for future matches instead of normal matchmaking.
  final bool sendCheatersToDlcQueue;

  const AntiCheatConfig({
    required this.enabled,
    required this.instantEliminateCheaters,
    required this.useDecayPunishment,
    required this.decayDurationSeconds,
    required this.showCheaterGraveMarker,
    required this.sendCheatersToDlcQueue,
  });

  factory AntiCheatConfig.strict() {
    return const AntiCheatConfig(
      enabled: true,
      instantEliminateCheaters: true,
      useDecayPunishment: true,
      decayDurationSeconds: 10,
      showCheaterGraveMarker: true,
      sendCheatersToDlcQueue: true,
    );
  }

  factory AntiCheatConfig.off() {
    return const AntiCheatConfig(
      enabled: false,
      instantEliminateCheaters: false,
      useDecayPunishment: false,
      decayDurationSeconds: 0,
      showCheaterGraveMarker: false,
      sendCheatersToDlcQueue: false,
    );
  }
}
