/// Simple pub/sub event bus used by the engine to notify the UI layer.
abstract class EngineEvent {}

class UnitCreatedEvent extends EngineEvent {
  final String unitId;
  UnitCreatedEvent(this.unitId);
}

class UnitDestroyedEvent extends EngineEvent {
  final String unitId;
  UnitDestroyedEvent(this.unitId);
}

class BuildingCreatedEvent extends EngineEvent {
  final String buildingId;
  BuildingCreatedEvent(this.buildingId);
}

class BuildingDestroyedEvent extends EngineEvent {
  final String buildingId;
  BuildingDestroyedEvent(this.buildingId);
}

class PowerStateChangedEvent extends EngineEvent {
  final bool isLowPower;
  PowerStateChangedEvent(this.isLowPower);
}

typedef EventListener = void Function(EngineEvent event);

class EventBus {
  final List<EventListener> _listeners = [];

  void subscribe(EventListener listener) {
    _listeners.add(listener);
  }

  void unsubscribe(EventListener listener) {
    _listeners.remove(listener);
  }

  void emit(EngineEvent event) {
    for (final listener in List<EventListener>.from(_listeners)) {
      listener(event);
    }
  }
}
