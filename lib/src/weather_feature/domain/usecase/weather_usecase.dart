import 'package:dartz/dartz.dart';
import 'package:flutter_bootcamp/src/core/data/model/failure_model.dart';
import 'package:flutter_bootcamp/src/weather_feature/domain/entity/weather_entity.dart';
import 'package:flutter_bootcamp/src/weather_feature/domain/repository/weather_repository.dart';

class GetWeatherUsecase {
  final WeatherRepositroy repositroy;
  final double lat;
  final double long;

  GetWeatherUsecase(
      {required this.lat, required this.long, required this.repositroy});

  Future<Either<NetworkFailure, WeatherEntity>> execute() async {
    return await repositroy.getWeatherStats(lat: lat, long: long);
  }
}
