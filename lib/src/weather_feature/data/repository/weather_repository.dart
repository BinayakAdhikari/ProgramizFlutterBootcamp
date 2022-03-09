import 'package:flutter_bootcamp/src/core/data/model/failure_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bootcamp/src/weather_feature/data/datasource/weather_datasource.dart';
import 'package:flutter_bootcamp/src/weather_feature/domain/entity/weather_entity.dart';
import 'package:flutter_bootcamp/src/weather_feature/domain/repository/weather_repository.dart';

import '../model/weather_model.dart';

class WeatherRepositoryImp extends WeatherRepositroy {
  final WeatherDatasource datasource;

  WeatherRepositoryImp({required this.datasource});

  @override
  Future<Either<NetworkFailure, WeatherEntity>> getWeatherStats(
      {required double lat, required double long}) async {
    Either<NetworkFailure, WeatherModel> result =
        await datasource.service.getWeatherForCity(lat: lat, long: long);
    if (result.isLeft()) {
      throw UnimplementedError();
    } else {
      WeatherModel model = (result as WeatherModel);

      // WeatherEntity entity = WeatherEntity(city: model.timezone.split('/')[1], currentStats: CurrentStats(currentTemp: model.currentWeatherModel.temperature, dateTime: DateTime.fromMillisecondsSinceEpoch(model.currentWeatherModel.dateTime), humidity: model.currentWeatherModel.humidity, sunrise:  DateTime.fromMillisecondsSinceEpoch(model.currentWeatherModel.sunrise), sunset:  DateTime.fromMillisecondsSinceEpoch(model.currentWeatherModel.sunset), weather:  Weather(description: model.currentWeatherModel.weather.description, weather: model.currentWeatherModel.weather.main,),), dailyStats: DailyStats(city: model.dailyWeatherModel., dateTime: null, humidity: null));

      throw UnimplementedError();
    }
  }
}
