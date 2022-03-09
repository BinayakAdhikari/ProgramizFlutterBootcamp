import 'package:flutter/material.dart';

import '../../../config/appConfig.dart';

class WeatherCityDetailsMinMax extends StatelessWidget {
  const WeatherCityDetailsMinMax({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: [
            Text(
              "max",
              style: TextStyle(
                fontSize: AppConfig().themeData.textTheme.headline6!.fontSize,
                fontWeight:
                    AppConfig().themeData.textTheme.headline6!.fontWeight,
                color: white,
              ),
            ),
            Text(
              "33°",
              style: TextStyle(
                fontSize: AppConfig().themeData.textTheme.headline3!.fontSize,
                fontWeight:
                    AppConfig().themeData.textTheme.headline3!.fontWeight,
                color: pureWhite,
              ),
            ),
          ],
        ),
        const VerticalDivider(
          color: pureWhite,
        ),
        Column(
          children: [
            Text(
              "min",
              style: TextStyle(
                fontSize: AppConfig().themeData.textTheme.headline6!.fontSize,
                fontWeight:
                    AppConfig().themeData.textTheme.headline6!.fontWeight,
                color: white,
              ),
            ),
            Text(
              "33°",
              style: TextStyle(
                fontSize: AppConfig().themeData.textTheme.headline3!.fontSize,
                fontWeight:
                    AppConfig().themeData.textTheme.headline3!.fontWeight,
                color: pureWhite,
              ),
            ),
          ],
        )
      ],
    );
  }
}
