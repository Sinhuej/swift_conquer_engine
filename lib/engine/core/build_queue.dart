// Manages production queue for buildings
import '../buildings/build_time.dart';

class QueueItem {
  final String id;
  final BuildTime buildTime;
  double progress = 0;

  QueueItem(this.id, this.buildTime);
}

class BuildQueue {
  final List<QueueItem> items = [];
  bool lowPower = false;
  bool buildingDamaged = false;
  int engineers = 0;

  void enqueue(String id, BuildTime time) {
    items.add(QueueItem(id, time));
  }

  void update(double dt) {
    if (items.isEmpty) return;

    final item = items.first;
    final adjustedTime =
        item.buildTime.computeTime(lowPower: lowPower, damaged: buildingDamaged, engineers: engineers);

    item.progress += dt / adjustedTime;

    if (item.progress >= 1.0) {
      items.removeAt(0);
      // TODO: Spawn completed unit
    }
  }
}
