import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp/src/services/http_service.dart';
import 'package:flutter_bootcamp/src/weather_feature/data/datasource/weather_datasource.dart';
import 'package:flutter_bootcamp/src/weather_feature/data/repository/weather_repository.dart';
import 'package:flutter_bootcamp/src/weather_feature/domain/repository/weather_repository.dart';
import 'package:flutter_bootcamp/src/weather_feature/domain/usecase/get_weathers_usecase.dart';
import 'package:flutter_bootcamp/src/weather_feature/domain/usecase/weather_usecase.dart';
import 'package:flutter_bootcamp/src/weather_feature/presentation/bloc/bloc/weather_bloc.dart';
import 'package:flutter_bootcamp/src/weather_feature/presentation/view/weather_city_detail_page.dart';
import 'package:flutter_bootcamp/src/weather_feature/presentation/view/weather_home.dart';

class RouteGenerator {
  final WeatherBloc _weatherBloc = WeatherBloc(
    getWeatherUsecase: GetWeatherUsecase(
      repositroy: WeatherRepositoryImp(
        datasource: WeatherDatasourceImp(
          service: HttpService(),
        ),
      ),
    ),
    getWeathersUsecase: GetWeathersUsecase(
      repositroy: WeatherRepositoryImp(
        datasource: WeatherDatasourceImp(
          service: HttpService(),
        ),
      ),
    ),
  );

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _weatherBloc,
            child: const WeatherHome(),
          ),
        );
      case WeatherCityDetailPage.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _weatherBloc,
            child: const WeatherCityDetailPage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const WeatherHome(),
        );
    }
  }
}
