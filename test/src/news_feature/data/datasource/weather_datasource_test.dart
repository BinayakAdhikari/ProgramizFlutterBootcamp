import 'package:dartz/dartz.dart';
import 'package:flutter_bootcamp/src/core/data/model/failure_model.dart';
import 'package:flutter_bootcamp/src/weather_feature/data/datasource/weather_datasource.dart';
import 'package:flutter_bootcamp/src/weather_feature/data/model/weather_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockHttpService mockHttpService;
  late WeatherDatasourceImp weatherDatasource;

  setUp(() {
    mockHttpService = MockHttpService();
    weatherDatasource = WeatherDatasourceImp(service: mockHttpService);
  });

  const double lat = 10;
  const double long = 12;
  const List<Map<String, double>> locations = [
    {'lat': lat, 'lon': long}
  ];

  WeatherModel weatherModel = WeatherModel(
      lat: lat,
      lon: long,
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

  NetworkFailure networkFailure =
      NetworkFailure(statusCode: 404, message: "Weather not found");

  Either<NetworkFailure, WeatherModel> expectedResultPass = Right(weatherModel);
  Either<NetworkFailure, WeatherModel> expectedResultFailure =
      Left(networkFailure);

  Either<NetworkFailure, List<WeatherModel>> expectedResultPass2 =
      Right([weatherModel]);

  Either<NetworkFailure, List<WeatherModel>> expectedResultFailure2 =
      Left(networkFailure);

  group('Datasource test for Single city', () {
    test('Should return a single Weather model', () async {
      // arrange
      when(mockHttpService.getWeatherForCity(lat: lat, long: long))
          .thenAnswer((_) async => expectedResultPass);
      // act
      final result = await weatherDatasource.getWeather(lat: lat, long: long);
      // assert
      await expectLater(result, expectedResultPass);
      verify(mockHttpService.getWeatherForCity(lat: lat, long: long));
    });

    test('Should return a Network failure', () async {
      // arrange
      when(mockHttpService.getWeatherForCity(lat: lat, long: long))
          .thenAnswer((_) async => expectedResultFailure);
      // act
      final result = await weatherDatasource.getWeather(lat: lat, long: long);
      // assert
      await expectLater(result, expectedResultFailure);
      verify(mockHttpService.getWeatherForCity(lat: lat, long: long));
    });
  });

  group('Datasource test for multiple cities', () {
    test('Should return a list of Weather models', () async {
      // arrange
      when(mockHttpService.getWeatherForCities(locations: locations))
          .thenAnswer((realInvocation) async => expectedResultPass2);
      // act
      final result =
          await weatherDatasource.getWeatherForCities(locations: locations);
      // assert
      await expectLater(result, expectedResultPass2);
      verify(mockHttpService.getWeatherForCities(locations: locations));
    });

    test('Should return a NetworkError', () async {
      // arrange
      when(mockHttpService.getWeatherForCities(locations: locations))
          .thenAnswer((realInvocation) async => expectedResultFailure2);
      // act
      final result =
          await weatherDatasource.getWeatherForCities(locations: locations);
      // assert
      await expectLater(result, expectedResultFailure2);
      verify(mockHttpService.getWeatherForCities(locations: locations));
    });
  });
}
