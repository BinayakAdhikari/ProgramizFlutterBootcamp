import 'package:flutter/material.dart';

import '../../../config/appConfig.dart';

class WeatherCityDetailsWeeklyIndicator extends StatelessWidget {
  const WeatherCityDetailsWeeklyIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _getEachDay(day: 'Fri', maxTemp: 31, minTemp: 26),
        _getEachDay(day: 'Sat', maxTemp: 31, minTemp: 26),
        _getEachDay(day: 'Sun', maxTemp: 31, minTemp: 26),
        _getEachDay(day: 'Mon', maxTemp: 31, minTemp: 26),
        _getEachDay(day: 'Tue', maxTemp: 31, minTemp: 26),
        _getEachDay(day: 'Wed', maxTemp: 31, minTemp: 26),
      ],
    );
  }

  _getEachDay({
    required String day,
    required int maxTemp,
    required int minTemp,
  }) {
    return Column(
      children: [
        Text(
          day,
          style: TextStyle(
            fontSize: AppConfig().themeData.textTheme.headline6!.fontSize,
            fontWeight: AppConfig().themeData.textTheme.headline6!.fontWeight,
            color: white,
          ),
        ),
        Text(
          "${maxTemp.toString()}°",
          style: TextStyle(
            fontSize: AppConfig().themeData.textTheme.headline3!.fontSize,
            fontWeight: AppConfig().themeData.textTheme.headline3!.fontWeight,
            color: pureWhite,
          ),
        ),
        Text(
          "${minTemp.toString()}°",
          style: TextStyle(
            fontSize: AppConfig().themeData.textTheme.headline6!.fontSize,
            fontWeight: AppConfig().themeData.textTheme.headline6!.fontWeight,
            color: white,
          ),
        ),
      ],
    );
  }
}
