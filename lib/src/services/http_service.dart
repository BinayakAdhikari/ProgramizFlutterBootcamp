import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:flutter_bootcamp/src/config/appConfig.dart';
import 'package:flutter_bootcamp/src/core/data/model/failure_model.dart';
import 'package:flutter_bootcamp/src/weather_feature/data/model/weather_model.dart';

import 'package:http/http.dart' as http;

class HttpService {
  Uri _getEndpointUri({required double lat, required double long}) {
    return Uri.parse(baseUrl +
        "?lat=${lat.toString()}&lon=${long.toString()}&exclude=minutely,hourly&appid=49b10fdee63dcedd33bdd8e327ad3c8f");
  }

  Future<Either<NetworkFailure, WeatherModel>> getWeatherForCity(
      {required double lat, required double long}) async {
    try {
      http.Response response =
          await http.get(_getEndpointUri(lat: lat, long: long));
      if (response.statusCode == 200) {
        return Right(WeatherModel.fromJson(jsonDecode(response.body)));
      } else {
        return Left(
          NetworkFailure(
            message: 'Something went wrong',
            statusCode: response.statusCode,
          ),
        );
      }
    } catch (e) {
      return Left(
        NetworkFailure(
          message: e.toString(),
          statusCode: 400,
        ),
      );
    }
  }
}
