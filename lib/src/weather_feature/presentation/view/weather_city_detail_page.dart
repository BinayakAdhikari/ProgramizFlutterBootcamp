import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/weather_feature/presentation/widget/weather_city_details_day_stats.dart';
import 'package:flutter_bootcamp/src/weather_feature/presentation/widget/weather_city_details_header.dart';
import 'package:flutter_bootcamp/src/weather_feature/presentation/widget/weather_city_details_location_time.dart';
import 'package:flutter_bootcamp/src/weather_feature/presentation/widget/weather_city_details_min_max.dart';
import 'package:flutter_bootcamp/src/weather_feature/presentation/widget/weather_city_details_weekly_indicator.dart';

import '../../../config/appConfig.dart';

class WeatherCityDetailPage extends StatelessWidget {
  static const String routeName = "/detailPage";
  const WeatherCityDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Stack(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/new_york.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Opacity(
                opacity: 1,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.5, 1],
                      colors: [
                        Color(0x22000000),
                        black,
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ),
          _weatherDetailView(),
        ],
      ),
    );
  }

  _weatherDetailView() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        child: Column(
          children: [
            const WeatherCityDetailsHeader(),
            const Padding(
              padding: EdgeInsets.only(top: 48, bottom: 72),
              child: WeatherCityDetailsLocationTime(),
            ),
            Text(
              "33°",
              style: TextStyle(
                fontSize: 72,
                fontWeight:
                    AppConfig().themeData.textTheme.headline1!.fontWeight,
                color: pureWhite,
              ),
            ),
            const WeatherCityDetailsMinMax(),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 24,
              ),
              child: Divider(
                color: pureWhite,
              ),
            ),
            const WeatherCityDetailsWeeklyIndicator(),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 24,
              ),
              child: Divider(
                color: pureWhite,
              ),
            ),
            const WeatherCityDetailsDayStats(),
          ],
        ),
      ),
    );
  }
}
