/// A harvestable resource node (ore field, crystal patch, etc.).
class ResourceNode {
  final String id;
  final double maxAmount;
  double remaining;

  ResourceNode({
    required this.id,
    required this.maxAmount,
  }) : remaining = maxAmount;

  bool get isDepleted => remaining <= 0;

  /// Harvest returns the actual gathered amount.
  double harvest(double requested) {
    if (isDepleted) return 0;
    final taken = requested > remaining ? remaining : requested;
    remaining -= taken;
    return taken;
  }
}
