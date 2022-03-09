import 'package:dartz/dartz.dart';
import 'package:flutter_bootcamp/src/weather_feature/domain/entity/weather_entity.dart';

import '../../../core/data/model/failure_model.dart';

abstract class WeatherRepositroy {
  Future<Either<NetworkFailure, WeatherEntity>> getWeatherStats(
      {required double lat, required double long});
  Future<Either<NetworkFailure, List<WeatherEntity>>> getWeathersStats(
      {required List<Map<String, double>> locations});
}
