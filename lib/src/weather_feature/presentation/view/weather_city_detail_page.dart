import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp/src/weather_feature/domain/entity/weather_entity.dart';
import 'package:flutter_bootcamp/src/weather_feature/presentation/bloc/bloc/weather_bloc.dart';
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
          _weatherDetailView(context),
        ],
      ),
    );
  }

  _weatherDetailView(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<WeatherEntity>(
          stream:
              BlocProvider.of<WeatherBloc>(context).outWeatherStreamController,
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 24,
              ),
              child: Column(
                children: [
                  const WeatherCityDetailsHeader(),
                  Padding(
                    padding: const EdgeInsets.only(top: 48, bottom: 72),
                    child: snapshot.hasData
                        ? WeatherCityDetailsLocationTime(
                            cityName: snapshot.data!.city,
                            timeNow: snapshot.data!.currentStats.dateTime,
                            weatherName: snapshot
                                .data!.currentStats.weather.first.weather,
                          )
                        : Container(),
                  ),
                  Text(
                    snapshot.hasData
                        ? "${snapshot.data!.currentStats.currentTemp.toString()}°"
                        : "No data",
                    style: TextStyle(
                      fontSize: 72,
                      fontWeight:
                          AppConfig().themeData.textTheme.headline1!.fontWeight,
                      color: pureWhite,
                    ),
                  ),
                  const WeatherCityDetailsMinMax(
                      maxTemp: 0, minTemp: 0), //! Requires model fix
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 24,
                    ),
                    child: Divider(
                      color: pureWhite,
                    ),
                  ),
                  const WeatherCityDetailsWeeklyIndicator(), //! Requires model fix
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 24,
                    ),
                    child: Divider(
                      color: pureWhite,
                    ),
                  ),

                  snapshot.hasData
                      ? WeatherCityDetailsDayStats(
                          humidity: snapshot.data!.currentStats.humidity,
                          sunrise: snapshot.data!.currentStats.sunrise,
                          sunset: snapshot.data!.currentStats.sunset,
                          windSpeed: 2.0,
                        )
                      : Container()
                ],
              ),
            );
          }),
    );
  }
}
