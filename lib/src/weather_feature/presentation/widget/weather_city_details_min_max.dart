import 'package:flutter/material.dart';

import '../../../config/appConfig.dart';

class WeatherCityDetailsMinMax extends StatelessWidget {
  final double? maxTemp;
  final double? minTemp;
  const WeatherCityDetailsMinMax({Key? key, this.maxTemp = 0, this.minTemp = 0})
      : super(key: key);

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
              "$maxTemp°",
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
              "$minTemp°",
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
