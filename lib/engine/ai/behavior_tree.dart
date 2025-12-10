/// Super minimal behavior tree interface – enough to expand later.
abstract class BehaviorNode {
  BehaviorStatus tick(double dtSeconds);
}

enum BehaviorStatus {
  running,
  success,
  failure,
}

class SequenceNode implements BehaviorNode {
  final List<BehaviorNode> children;
  int _currentIndex = 0;

  SequenceNode(this.children);

  @override
  BehaviorStatus tick(double dtSeconds) {
    while (_currentIndex < children.length) {
      final status = children[_currentIndex].tick(dtSeconds);
      if (status == BehaviorStatus.running || status == BehaviorStatus.failure) {
        return status;
      }
      _currentIndex++;
    }
    _currentIndex = 0;
    return BehaviorStatus.success;
  }
}

class SelectorNode implements BehaviorNode {
  final List<BehaviorNode> children;

  SelectorNode(this.children);

  @override
  BehaviorStatus tick(double dtSeconds) {
    for (final child in children) {
      final status = child.tick(dtSeconds);
      if (status == BehaviorStatus.running || status == BehaviorStatus.success) {
        return status;
      }
    }
    return BehaviorStatus.failure;
  }
}
