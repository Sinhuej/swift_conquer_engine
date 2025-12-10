import 'base_building.dart';
import '../units/base_unit.dart';

/// Represents a single item in the build queue (unit or building).
class BuildQueueItem {
  final String id;
  final String kind; // "unit" or "building"
  final int buildTimeSeconds;

  double _progress = 0.0; // 0.0 to 1.0

  BuildQueueItem({
    required this.id,
    required this.kind,
    required this.buildTimeSeconds,
  });

  double get progress => _progress;
  bool get isComplete => _progress >= 1.0;

  void update(double dtSeconds) {
    if (buildTimeSeconds <= 0 || isComplete) return;
    _progress += dtSeconds /
cd ~/slimnation/swift_conquer_engine

cat << 'EOF' > lib/engine/buildings/construction_queue.dart
import 'base_building.dart';
import '../units/base_unit.dart';

/// Represents a single item in the build queue (unit or building).
class BuildQueueItem {
  final String id;
  final String kind; // "unit" or "building"
  final int buildTimeSeconds;

  double _progress = 0.0; // 0.0 to 1.0

  BuildQueueItem({
    required this.id,
    required this.kind,
    required this.buildTimeSeconds,
  });

  double get progress => _progress;
  bool get isComplete => _progress >= 1.0;

  void update(double dtSeconds) {
    if (buildTimeSeconds <= 0 || isComplete) return;
    _progress += dtSeconds / buildTimeSeconds;
    if (_progress > 1.0) _progress = 1.0;
  }
}

/// Simple construction queue used by factories & construction yards.
class ConstructionQueue {
  final List<BuildQueueItem> _queue = [];

  BuildQueueItem? get currentItem =>
      _queue.isEmpty ? null : _queue.first;

  bool get isEmpty => _queue.isEmpty;

  void enqueueUnit(BaseUnit unit) {
    _queue.add(BuildQueueItem(
      id: unit.id,
      kind: 'unit',
      buildTimeSeconds: unit.buildTimeSeconds,
    ));
  }

  void enqueueBuilding(BaseBuilding building) {
    _queue.add(BuildQueueItem(
      id: building.id,
      kind: 'building',
      buildTimeSeconds: building.buildTimeSeconds,
    ));
  }

  /// Advance current construction. Returns a completed item (if any).
  BuildQueueItem? update(double dtSeconds) {
    if (_queue.isEmpty) return null;

    final item = _queue.first;
    item.update(dtSeconds);

    if (item.isComplete) {
      _queue.removeAt(0);
      return item;
    }
    return null;
  }

  void clear() {
    _queue.clear();
  }
}
