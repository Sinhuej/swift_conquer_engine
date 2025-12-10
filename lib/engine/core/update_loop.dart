import 'dart:async';

/// Simple fixed-timestep loop that calls [onTick] with dt in seconds.
class UpdateLoop {
  final void Function(double dtSeconds) onTick;
  final Duration _step;
  Timer? _timer;
  bool _running = false;

  UpdateLoop({
    required this.onTick,
    Duration step = const Duration(milliseconds: 33), // ~30 fps
  }) : _step = step;

  bool get isRunning => _running;

  void start() {
    if (_running) return;
    _running = true;
    _timer = Timer.periodic(_step, (timer) {
      onTick(_step.inMilliseconds / 1000.0);
    });
  }

  void stop() {
    _running = false;
    _timer?.cancel();
    _timer = null;
  }
}
