import 'package:dartz/dartz.dart';
import 'package:flutter_bootcamp/src/core/data/model/failure_model.dart';
import 'package:flutter_bootcamp/src/weather_feature/domain/entity/weather_entity.dart';
import 'package:flutter_bootcamp/src/weather_feature/domain/repository/weather_repository.dart';
import 'package:flutter_bootcamp/src/weather_feature/domain/usecase/get_weathers_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_weathers_usecase_test.mocks.dart';

@GenerateMocks([WeatherRepositroy])
void main() {
  late MockWeatherRepositroy mockWeatherRepository;
  late GetWeathersUsecase getWeathersUsecase;

  setUp(() {
    mockWeatherRepository = MockWeatherRepositroy();
    getWeathersUsecase = GetWeathersUsecase(repositroy: mockWeatherRepository);
  });
  final Map<String, double> inputValues = {'lat': 21, 'lon': 23};
  WeatherEntity weatherEntity = WeatherEntity(
      city: 'new york',
      currentStats: CurrentStats(
          currentTemp: 21,
          dateTime: DateTime.now(),
          humidity: 15,
          sunrise: DateTime.now(),
          sunset: DateTime.now(),
          weather: []),
      dailyStats: []);
  List<WeatherEntity> weathers = [weatherEntity];
  Either<NetworkFailure, List<WeatherEntity>> expectedResult = Right(weathers);

  test('Should return all the weathers ', () async {
    // arrange
    when(mockWeatherRepository.getWeathersStats(locations: [inputValues]))
        .thenAnswer((realInvocation) async => expectedResult);
    // act
    final result = await getWeathersUsecase.execute(locations: [inputValues]);
    // assert
    expectLater(expectedResult, result);
  });
}
