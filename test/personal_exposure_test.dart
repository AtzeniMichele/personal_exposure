import 'package:flutter_test/flutter_test.dart';
import 'package:impact_database/impact_database.dart';
import 'package:personal_exposure/personal_exposure.dart';

void main() {
  List<HeartRate> heartrates = [
    HeartRate(patient: 'username', timestamp: DateTime.now(), value: 60)
  ];
  List<Pm> pms = [];
  int gender = 1;
  test('adds one to input values', () {
    final guo = Guo();
    final inhalation = Inhalation();
    double ans =
        guo.getMinuteVentilation(gender: gender, heartrate: heartrates[0]);
    double ans2 = inhalation.getInhalation([ans], pms, 'PM1');
  });
}
