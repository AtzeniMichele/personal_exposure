library personal_exposure;

import 'package:impact_database/impact_database.dart';

import 'dart:math';

class Inhalation {
  double getInhalation(
      List<dynamic> minuteVentilation, List<Pm> pms, String typePm) {
    double sum = 0;
    for (int p = 0; p < pms.length; p++) {
      if (typePm == 'PM1') {
        sum = sum + pms[p].pm1;
      } else if (typePm == 'PM2.5') {
        sum = sum + pms[p].pm25;
      } else if (typePm == 'PM10') {
        sum = sum + pms[p].pm10;
      }
    }

    double value = double.parse((sum / pms.length).toStringAsFixed(2));

    return double.parse(
        ((minuteVentilation[0].value * value * 5) / 1000).toStringAsFixed(2));
  }
}
