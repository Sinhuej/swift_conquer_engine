// Defines production behavior for factories, barracks, airfields
import 'build_time.dart';

class ProductionRules {
  final BuildTime buildTime;
  bool lowPower = false;
  bool buildingDamaged = false;

  ProductionRules(this.buildTime);

  double get currentBuildTime {
    return buildTime.computeTime(
      lowPower: lowPower,
      damaged: buildingDamaged,
      engineers: 0,
    );
  }
}
