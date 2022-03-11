import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/config/appConfig.dart';

class WeatherCityDetailsLocationTime extends StatelessWidget {
  final String cityName;
  final String weatherName;
  final DateTime timeNow;
  const WeatherCityDetailsLocationTime(
      {Key? key,
      required this.cityName,
      required this.weatherName,
      required this.timeNow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          cityName.replaceAll("_", " "),
          style: AppConfig().themeData.textTheme.headline1,
        ),
        Text(
          "$weatherName, ${timeNow.hour.toString().padLeft(2, '0')}:${timeNow.minute.toString().padRight(2, '0')}",
          style: AppConfig().themeData.textTheme.headline3,
        ),
      ],
    );
  }
}
