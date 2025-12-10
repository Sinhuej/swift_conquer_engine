/// Swift Conquer - DLC / feature flag configuration.
///
/// This lets you enable or disable paid features at runtime:
/// - Battle Pass perks
/// - Premium Map Editor
/// - Cheaters / modders queue
/// - Extra factions, skins, storm modes, etc.

class DlcFlags {
  /// Whether Battle Pass is enabled in this build/environment.
  final bool battlePassEnabled;

  /// Whether the premium map editor is available.
  final bool premiumMapEditorEnabled;

  /// Whether community map sharing is available.
  final bool communityMapsEnabled;

  /// Whether the "Cheaters / Modders" DLC queue is enabled.
  final bool cheatersDlcQueueEnabled;

  /// Whether extra cosmetic skin packs are enabled.
  final bool skinDlcEnabled;

  /// Whether special storm-enhanced game modes are enabled.
  final bool stormDlcEnabled;

  /// Whether additional factions beyond the base set are available.
  final bool extraFactionsEnabled;

  /// Whether spectator-only "cast mode" is enabled.
  final bool spectatorDlcEnabled;

  const DlcFlags({
    required this.battlePassEnabled,
    required this.premiumMapEditorEnabled,
    required this.communityMapsEnabled,
    required this.cheatersDlcQueueEnabled,
    required this.skinDlcEnabled,
    required this.stormDlcEnabled,
    required this.extraFactionsEnabled,
    required this.spectatorDlcEnabled,
  });

  /// All DLC on - used for your development build.
  factory DlcFlags.allOn() {
    return const DlcFlags(
      battlePassEnabled: true,
      premiumMapEditorEnabled: true,
      communityMapsEnabled: true,
      cheatersDlcQueueEnabled: true,
      skinDlcEnabled: true,
      stormDlcEnabled: true,
      extraFactionsEnabled: true,
      spectatorDlcEnabled: true,
    );
  }

  /// All DLC off - useful for a completely free/demo build.
  factory DlcFlags.allOff() {
    return const DlcFlags(
      battlePassEnabled: false,
      premiumMapEditorEnabled: false,
      communityMapsEnabled: false,
      cheatersDlcQueueEnabled: false,
      skinDlcEnabled: false,
      stormDlcEnabled: false,
      extraFactionsEnabled: false,
      spectatorDlcEnabled: false,
    );
  }

  DlcFlags copyWith({
    bool? battlePassEnabled,
    bool? premiumMapEditorEnabled,
    bool? communityMapsEnabled,
    bool? cheatersDlcQueueEnabled,
    bool? skinDlcEnabled,
    bool? stormDlcEnabled,
    bool? extraFactionsEnabled,
    bool? spectatorDlcEnabled,
  }) {
    return DlcFlags(
      battlePassEnabled: battlePassEnabled ?? this.battlePassEnabled,
      premiumMapEditorEnabled:
          premiumMapEditorEnabled ?? this.premiumMapEditorEnabled,
      communityMapsEnabled:
          communityMapsEnabled ?? this.communityMapsEnabled,
      cheatersDlcQueueEnabled:
          cheatersDlcQueueEnabled ?? this.cheatersDlcQueueEnabled,
      skinDlcEnabled: skinDlcEnabled ?? this.skinDlcEnabled,
      stormDlcEnabled: stormDlcEnabled ?? this.stormDlcEnabled,
      extraFactionsEnabled:
          extraFactionsEnabled ?? this.extraFactionsEnabled,
      spectatorDlcEnabled:
          spectatorDlcEnabled ?? this.spectatorDlcEnabled,
    );
  }
}
