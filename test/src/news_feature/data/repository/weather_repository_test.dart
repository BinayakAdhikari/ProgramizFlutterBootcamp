import 'package:dartz/dartz.dart';
import 'package:flutter_bootcamp/src/core/data/model/failure_model.dart';
import 'package:flutter_bootcamp/src/weather_feature/data/model/weather_model.dart';
import 'package:flutter_bootcamp/src/weather_feature/data/repository/weather_repository.dart';
import 'package:flutter_bootcamp/src/weather_feature/domain/entity/weather_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/test_helper.mocks.dart';
import './weather_repository_test.dart' as helperTest;

void main() {
  late MockWeatherDatasource mockWeatherDatasource;
  late WeatherRepositoryImp weatherRepositoryImp;
  late WeatherEntity weatherEntity;
  late Either<NetworkFailure, WeatherEntity> expectedResultPass;
  late Either<NetworkFailure, WeatherEntity> expectedResultFailure;
  late Either<NetworkFailure, WeatherModel> mockedResultPass;
  late Either<NetworkFailure, WeatherModel> mockedResultFailure;
  late WeatherModel weatherModel;

  NetworkFailure networkFailure =
      NetworkFailure(statusCode: 404, message: "Weather not found");

  setUp(() {
    mockWeatherDatasource = MockWeatherDatasource();
    weatherRepositoryImp =
        WeatherRepositoryImp(datasource: mockWeatherDatasource);

    weatherModel = WeatherModel(
        lat: 21,
        lon: 23,
        timezone: "America/New york",
        timezone_offset: 123314234,
        current: CurrentWeatherModel(
            dt: 12341234,
            humidity: 15,
            sunrise: 12341234,
            sunset: 12341234,
            temp: 24,
            weather: []),
        daily: []);

    mockedResultPass = Right(weatherModel);
    weatherEntity = WeatherEntity(
        city: weatherModel.timezone,
        currentStats: CurrentStats(
            currentTemp: weatherModel.current.temp,
            dateTime:
                DateTime.fromMillisecondsSinceEpoch(weatherModel.current.dt),
            sunrise: DateTime.fromMillisecondsSinceEpoch(
                weatherModel.current.sunrise),
            sunset: DateTime.fromMillisecondsSinceEpoch(
                weatherModel.current.sunset),
            humidity: weatherModel.current.humidity,
            weather: []),
        dailyStats: []);

    expectedResultPass = Right(weatherEntity);
    mockedResultFailure = Left(networkFailure);
    expectedResultFailure = Left(networkFailure);
  });

  final Map<String, double> inputValues = {'lat': 21, 'lon': 23};

  group("Repository test for single city", () {
    test('Should return a Single Weather Entity', () async {
      // arrange
      when(mockWeatherDatasource.getWeather(
              lat: inputValues['lat'], long: inputValues['lon']))
          .thenAnswer((realInvocation) async => mockedResultPass);
      // act
      final result = await weatherRepositoryImp.getWeatherStats(
          lat: inputValues['lat']!, long: inputValues['lon']!);
      // assert
      await expectLater(result.runtimeType, expectedResultPass.runtimeType);
      // await expectLater(result.hashCode, expectedResultPass.hashCode);
      verify(mockWeatherDatasource.getWeather(
          lat: inputValues['lat'], long: inputValues['lon']));
    });
    test('Should return a Network Failure', () async {
      // arrange
      when(mockWeatherDatasource.getWeather(
              lat: inputValues['lat'], long: inputValues['lon']))
          .thenAnswer((realInvocation) async => mockedResultFailure);
      // act
      final result = await weatherRepositoryImp.getWeatherStats(
          lat: inputValues['lat']!, long: inputValues['lon']!);
      // assert
      await expectLater(result, expectedResultFailure);
      verify(mockWeatherDatasource.getWeather(
          lat: inputValues['lat'], long: inputValues['lon']));
    });
  });
}
