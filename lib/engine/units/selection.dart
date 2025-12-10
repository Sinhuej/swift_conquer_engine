import 'base_unit.dart';

/// Helper functions for unit selection and group logic.
class SelectionManager {
  final List<BaseUnit> _selected = [];

  List<BaseUnit> get selectedUnits => List.unmodifiable(_selected);

  void clear() {
    _selected.clear();
  }

  void selectSingle(BaseUnit unit) {
    clear();
    unit.isSelected = true;
    _selected.add(unit);
  }

  void toggleUnit(BaseUnit unit) {
    if (_selected.contains(unit)) {
      unit.isSelected = false;
      _selected.remove(unit);
    } else {
      unit.isSelected = true;
      _selected.add(unit);
    }
  }
}
