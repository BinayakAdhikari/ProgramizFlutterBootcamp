import 'package:dartz/dartz.dart';
import 'package:flutter_bootcamp/src/core/data/model/failure_model.dart';
import 'package:flutter_bootcamp/src/weather_feature/domain/entity/weather_entity.dart';
import 'package:flutter_bootcamp/src/weather_feature/domain/repository/weather_repository.dart';

class GetWeathersUsecase {
  final WeatherRepositroy repositroy;

  GetWeathersUsecase({required this.repositroy});

  Future<Either<NetworkFailure, List<WeatherEntity>>> execute(
      {required List<Map<String, double>> locations}) {
    return repositroy.getWeathersStats(locations: locations);
  }
}
