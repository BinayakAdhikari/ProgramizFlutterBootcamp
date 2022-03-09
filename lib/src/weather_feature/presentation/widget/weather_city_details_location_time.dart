import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/config/appConfig.dart';

class WeatherCityDetailsLocationTime extends StatelessWidget {
  const WeatherCityDetailsLocationTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Los Angeles",
          style: AppConfig().themeData.textTheme.headline1,
        ),
        Text(
          "Cloudy, 7:44 am",
          style: AppConfig().themeData.textTheme.headline3,
        ),
      ],
    );
  }
}
