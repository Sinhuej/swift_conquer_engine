import '../units/base_unit.dart';

/// A simple build queue used by factories and training structures.
///
/// It tracks what is being built, how long until completion, and
/// exposes a callback for when units are finished.
class ConstructionJob {
  final String unitTypeId;
  final double buildTimeSeconds;
  double remainingTime;

  ConstructionJob({
    required this.unitTypeId,
    required this.buildTimeSeconds,
  }) : remainingTime = buildTimeSeconds;

  bool get isComplete => remainingTime <= 0;
}

typedef UnitFactoryCallback = void Function(ConstructionJob job);

class ConstructionQueue {
  final List<ConstructionJob> _queue = [];
  UnitFactoryCallback? onJobCompleted;

  void enqueue(String unitTypeId, double buildTimeSeconds) {
    _queue.add(ConstructionJob(
      unitTypeId: unitTypeId,
      buildTimeSeconds: buildTimeSeconds,
    ));
  }

  List<ConstructionJob> get jobs => List.unmodifiable(_queue);

  void cancel(ConstructionJob job) {
    _queue.remove(job);
  }

  void update(double dtSeconds) {
    if (_queue.isEmpty) return;

    final job = _queue.first;
    job.remainingTime -= dtSeconds;

    if (job.isComplete) {
      _queue.removeAt(0);
      if (onJobCompleted != null) {
        onJobCompleted!(job);
      }
    }
  }
}
