import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/weather_feature/presentation/view/weather_city_detail_page.dart';
import 'package:flutter_bootcamp/src/weather_feature/presentation/view/weather_home.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => const WeatherHome(),
        );
      case WeatherCityDetailPage.routeName:
        return MaterialPageRoute(
          builder: (_) => const WeatherCityDetailPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const WeatherHome(),
        );
    }
  }
}
