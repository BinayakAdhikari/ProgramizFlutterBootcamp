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
        await datasource.getWeather(lat: lat, long: long);

    return result.fold((networkFailure) {
      return Left(networkFailure);
    }, (weatherModel) {
      List<Weather> weather = [];
      List<DailyStats> dailyStats = [];

      for (WeatherDescriptionModel modelDesc in weatherModel.current.weather) {
        weather.add(
          Weather(weather: modelDesc.main, description: modelDesc.description),
        );
      }

      for (DailyWeatherModel modelDaily in weatherModel.daily) {
        List<Weather> dailyWeather = [];
        for (WeatherDescriptionModel model in modelDaily.weather) {
          dailyWeather.add(
            Weather(weather: model.main, description: model.description),
          );
        }
        dailyStats.add(
          DailyStats(
            dateTime: DateTime.fromMillisecondsSinceEpoch(modelDaily.dt),
            sunrise: DateTime.fromMillisecondsSinceEpoch(modelDaily.sunrise),
            sunset: DateTime.fromMillisecondsSinceEpoch(modelDaily.sunset),
            temp: Temperature(
                day: modelDaily.temp.day,
                max: modelDaily.temp.max,
                min: modelDaily.temp.min),
            humidity: modelDaily.humidity,
            weather: dailyWeather,
          ),
        );
      }

      WeatherEntity entity = WeatherEntity(
        city: weatherModel.timezone.split('/')[1],
        currentStats: CurrentStats(
            currentTemp: weatherModel.current.temp,
            dateTime:
                DateTime.fromMillisecondsSinceEpoch(weatherModel.current.dt),
            humidity: weatherModel.current.humidity,
            sunrise: DateTime.fromMillisecondsSinceEpoch(
                weatherModel.current.sunrise),
            sunset: DateTime.fromMillisecondsSinceEpoch(
                weatherModel.current.sunset),
            weather: weather),
        dailyStats: dailyStats,
      );
      return Right(entity);
    });
  }

  @override
  Future<Either<NetworkFailure, List<WeatherEntity>>> getWeathersStats(
      {required List<Map<String, double>> locations}) async {
    Either<NetworkFailure, List<WeatherModel>> result =
        await datasource.getWeatherForCities(locations: locations);

    return result.fold((failure) {
      return Left(failure);
    }, (listOfModels) {
      List<WeatherEntity> entities = [];
      for (WeatherModel weatherModel in listOfModels) {
        List<Weather> weather = [];
        List<DailyStats> dailyStats = [];

        for (WeatherDescriptionModel modelDesc
            in weatherModel.current.weather) {
          weather.add(
            Weather(
                weather: modelDesc.main, description: modelDesc.description),
          );
        }

        for (DailyWeatherModel modelDaily in weatherModel.daily) {
          List<Weather> dailyWeather = [];
          for (WeatherDescriptionModel model in modelDaily.weather) {
            dailyWeather.add(
              Weather(weather: model.main, description: model.description),
            );
          }
          dailyStats.add(
            DailyStats(
              dateTime: DateTime.fromMillisecondsSinceEpoch(modelDaily.dt),
              sunrise: DateTime.fromMillisecondsSinceEpoch(modelDaily.sunrise),
              sunset: DateTime.fromMillisecondsSinceEpoch(modelDaily.sunset),
              humidity: modelDaily.humidity,
              temp: Temperature(
                  day: modelDaily.temp.day,
                  max: modelDaily.temp.max,
                  min: modelDaily.temp.min),
              weather: dailyWeather,
            ),
          );
        }

        WeatherEntity entity = WeatherEntity(
          city: weatherModel.timezone.split('/')[1],
          currentStats: CurrentStats(
              currentTemp: weatherModel.current.temp,
              dateTime:
                  DateTime.fromMillisecondsSinceEpoch(weatherModel.current.dt),
              humidity: weatherModel.current.humidity,
              sunrise: DateTime.fromMillisecondsSinceEpoch(
                  weatherModel.current.sunrise),
              sunset: DateTime.fromMillisecondsSinceEpoch(
                  weatherModel.current.sunset),
              weather: weather),
          dailyStats: dailyStats,
        );

        entities.add(entity);
      }
      return Right(entities);
    });
  }
}
