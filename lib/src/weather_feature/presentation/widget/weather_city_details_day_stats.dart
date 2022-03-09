import 'package:flutter/material.dart';

import '../../../config/appConfig.dart';

class WeatherCityDetailsDayStats extends StatelessWidget {
  final double windSpeed;
  final DateTime sunrise;
  final DateTime sunset;
  final int humidity;
  const WeatherCityDetailsDayStats(
      {Key? key,
      required this.windSpeed,
      required this.sunrise,
      required this.sunset,
      required this.humidity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "Wind Speed",
              style: TextStyle(
                fontSize: AppConfig().themeData.textTheme.headline6!.fontSize,
                fontWeight:
                    AppConfig().themeData.textTheme.headline6!.fontWeight,
                color: white,
              ),
            ),
            Text(
              "${windSpeed.toString()}m/s",
              style: TextStyle(
                fontSize: AppConfig().themeData.textTheme.bodyText1!.fontSize,
                fontWeight:
                    AppConfig().themeData.textTheme.headline6!.fontWeight,
                color: pureWhite,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Sunrise",
              style: TextStyle(
                fontSize: AppConfig().themeData.textTheme.headline6!.fontSize,
                fontWeight:
                    AppConfig().themeData.textTheme.headline6!.fontWeight,
                color: white,
              ),
            ),
            Text(
              "${sunrise.hour.toString().padLeft(2, '0')}:${sunrise.minute.toString().padRight(2, '0')}",
              style: TextStyle(
                fontSize: AppConfig().themeData.textTheme.bodyText1!.fontSize,
                fontWeight:
                    AppConfig().themeData.textTheme.headline6!.fontWeight,
                color: pureWhite,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Sunset",
              style: TextStyle(
                fontSize: AppConfig().themeData.textTheme.headline6!.fontSize,
                fontWeight:
                    AppConfig().themeData.textTheme.headline6!.fontWeight,
                color: white,
              ),
            ),
            Text(
              "${sunset.hour.toString().padLeft(2, '0')}:${sunset.minute.toString().padRight(2, '0')}",
              style: TextStyle(
                fontSize: AppConfig().themeData.textTheme.bodyText1!.fontSize,
                fontWeight:
                    AppConfig().themeData.textTheme.headline6!.fontWeight,
                color: pureWhite,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Humidity",
              style: TextStyle(
                fontSize: AppConfig().themeData.textTheme.headline6!.fontSize,
                fontWeight:
                    AppConfig().themeData.textTheme.headline6!.fontWeight,
                color: white,
              ),
            ),
            Text(
              "$humidity%",
              style: TextStyle(
                fontSize: AppConfig().themeData.textTheme.bodyText1!.fontSize,
                fontWeight:
                    AppConfig().themeData.textTheme.headline6!.fontWeight,
                color: pureWhite,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
