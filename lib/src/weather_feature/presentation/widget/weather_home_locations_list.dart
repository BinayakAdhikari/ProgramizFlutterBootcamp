import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp/src/utils/weatherUtil.dart';
import 'package:flutter_bootcamp/src/weather_feature/presentation/bloc/bloc/weather_bloc.dart';
import 'package:flutter_bootcamp/src/weather_feature/presentation/view/weather_city_detail_page.dart';

import '../../../config/appConfig.dart';

class WeatherHomeLocationsList extends StatelessWidget {
  const WeatherHomeLocationsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 24,
          ),
          child: Text(
            "Locations",
            style: AppConfig().themeData.textTheme.headline2,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            bottom: 24,
          ),
        ),
        Expanded(
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: primary,
                  ),
                );
              } else if (state is WeatherLoadingFailed) {
                return Center(
                  child: Text(
                    "Failed loading",
                    style: AppConfig().themeData.textTheme.headline1,
                  ),
                );
              } else if (state is WeatherLoaded) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.weatherData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          BlocProvider.of<WeatherBloc>(context).add(
                            DisplaySingleWeather(
                              weatherEntity: state.weatherData[index],
                            ),
                          );
                          Navigator.pushNamed(
                            context,
                            WeatherCityDetailPage.routeName,
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2 - 24,
                          margin: EdgeInsets.only(
                            right: 24,
                            left: index == 0 ? 24 : 0,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 24,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: getCardColor(
                                weather: state.weatherData[index].currentStats
                                    .weather.first.weather),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    state.weatherData[index].city
                                        .replaceAll('_', ' '),
                                    style: AppConfig()
                                        .themeData
                                        .textTheme
                                        .headline5,
                                  ),
                                  Text(
                                    "${state.weatherData[index].currentStats.dateTime.hour.toString().padLeft(2, '0')}:${state.weatherData[index].currentStats.dateTime.minute.toString().padRight(2, '0')}",
                                    style: AppConfig()
                                        .themeData
                                        .textTheme
                                        .headline5,
                                  ),
                                ],
                              ),
                              Text(
                                "${state.weatherData[index].currentStats.currentTemp.toString()}°",
                                style:
                                    AppConfig().themeData.textTheme.headline1,
                              ),
                              Text(
                                state.weatherData[index].currentStats.weather
                                    .first.weather,
                                style:
                                    AppConfig().themeData.textTheme.headline5,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return Container();
              }
            },
          ),
        )
      ],
    );
  }
}
