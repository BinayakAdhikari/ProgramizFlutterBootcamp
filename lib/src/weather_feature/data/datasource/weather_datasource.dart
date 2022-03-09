import 'package:dartz/dartz.dart';
import 'package:flutter_bootcamp/src/core/data/model/failure_model.dart';
import 'package:flutter_bootcamp/src/services/http_service.dart';
import 'package:flutter_bootcamp/src/weather_feature/data/model/weather_model.dart';
import 'package:flutter_bootcamp/src/weather_feature/domain/entity/weather_entity.dart';
import 'package:flutter_bootcamp/src/weather_feature/domain/repository/weather_repository.dart';

abstract class WeatherDatasource {
  final HttpService service;

  WeatherDatasource({required this.service});

  Future<Either<NetworkFailure, WeatherModel>> getWeather(
      {required double lat, required long});
  Future<Either<NetworkFailure, List<WeatherModel>>> getWeatherForCities(
      {required List<Map<String, double>> locations});
}

class WeatherDatasourceImp extends WeatherDatasource {
  WeatherDatasourceImp({required HttpService service})
      : super(service: service);

  @override
  Future<Either<NetworkFailure, WeatherModel>> getWeather(
      {required double lat, required long}) async {
    return await service.getWeatherForCity(lat: lat, long: long);
  }

  @override
  Future<Either<NetworkFailure, List<WeatherModel>>> getWeatherForCities(
      {required List<Map<String, double>> locations}) async {
    return await service.getWeatherForCities(locations: locations);
  }
}
