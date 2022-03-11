import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/config/appConfig.dart';

Color getCardColor({required String weather}) {
  switch (weather.toLowerCase()) {
    case "clouds":
      return cloud;
    case "rain":
      return rain;
    default:
      return primary;
  }
}
