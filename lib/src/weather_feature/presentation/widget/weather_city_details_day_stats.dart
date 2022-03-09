import 'package:flutter/material.dart';

import '../../../config/appConfig.dart';

class WeatherCityDetailsDayStats extends StatelessWidget {
  const WeatherCityDetailsDayStats({Key? key}) : super(key: key);

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
              "2.06m/s",
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
              "06:09 AM",
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
              "05:29 PM",
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
              "15%",
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
