//library personal_exposure;

import 'package:impact_database/impact_database.dart';

import 'dart:math' as math;

class MinuteVentilation {}

class Zuurbier extends MinuteVentilation {
  double getMinuteVentilation(HeartRate heartrate, int gender) {
    // double sumheart = 0;
    // for (int p = 0; p < heartrates.length; p++) {
    //   sumheart = sumheart + heartrates[p].value;
    // }

    // double valheart =
    //     double.parse((sumheart / heartrates.length).toStringAsFixed(2));
    double valheart = heartrate.heart_rate;

    if (valheart != 0) {
      if (gender == 1) {
        // UOMO
        double val = math.pow(math.e, 1.03 + (0.021 * valheart)) as double;
        return (val * 100).roundToDouble() / 100;
      } else {
        // DONNA
        double val = math.pow(math.e, 0.57 + (0.023 * valheart)) as double;
        return (val * 100).roundToDouble() / 100;
      }
    } else {
      return 0;
    }
  }
}

class Guo extends MinuteVentilation {
  double getMinuteVentilation(
      {required int gender, required HeartRate heartrate}) {
    // double sumheart = 0;
    // for (int p = 0; p < heartrates.length; p++) {
    //   sumheart = sumheart + heartrates[p].value;
    // }

    // double valheart =
    //     double.parse((sumheart / heartrates.length).toStringAsFixed(2));
    double valheart = heartrate.heart_rate;

    if (valheart != 0) {
      if (gender == 1) {
        double val = math.pow(10, 0.559 + (0.007 * valheart)) as double;
        return (val * 100).roundToDouble() / 100;
      } else {
        double val = math.pow(10, 0.647 + (0.006 * valheart)) as double;
        return (val * 100).roundToDouble() / 100;
      }
    } else {
      return 0;
    }
  }
}

class Greenwald extends MinuteVentilation {
  double getMinuteVentilation(
      HeartRate heartrate, int gender, int age, double FVC) {
    // double sumheart = 0;
    // for (int p = 0; p < heartrates.length; p++) {
    //   sumheart = sumheart + heartrates[p].value;
    // }

    // double valheart =
    //     double.parse((sumheart / heartrates.length).toStringAsFixed(2));
    double valheart = heartrate.heart_rate;

    if (valheart != 0) {
      double val = (math.pow(math.e, -9.59) *
          math.pow(valheart, 2.39) *
          math.pow(gender, -0.204) *
          math.pow(age, 0.274) *
          math.pow(FVC, 0.520)) as double;
      return (val * 100).roundToDouble() / 100;
    } else {
      return 0;
    }
  }
}

class Good extends MinuteVentilation {
  double getMinuteVentilation(
      HeartRate heartrate, int gender, int age, double hrRest, double hip) {
    // double sumheart = 0;
    // for (int p = 0; p < heartrates.length; p++) {
    //   sumheart = sumheart + heartrates[p].value;
    // }

    // double valheart =
    //     double.parse((sumheart / heartrates.length).toStringAsFixed(2));
    double valheart = heartrate.heart_rate;

    if (gender == 2) {
      gender = 0;
    }

    if (valheart != 0) {
      // 1  uomo 0 donna
      double val = 0.99 -
          (27.41 * gender) +
          (50.24 * valheart / 100) +
          (15.73 * age / 100) -
          (43.65 * hrRest / 100) -
          (7.02 * hip / 100) +
          (23.02 * gender * valheart / 100) -
          (10.34 * gender * age / 100) -
          (26.21 * gender * hrRest / 100) +
          (38.78 * gender * hip / 100);
      return (val * 100).roundToDouble() / 100;
    } else {
      return 0;
    }
  }
}

// TODO: aggiungere altro modello trovato
