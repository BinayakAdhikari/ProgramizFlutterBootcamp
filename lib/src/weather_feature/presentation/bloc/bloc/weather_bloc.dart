import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bootcamp/src/core/data/model/failure_model.dart';
import 'package:flutter_bootcamp/src/weather_feature/domain/entity/weather_entity.dart';
import 'package:flutter_bootcamp/src/weather_feature/domain/usecase/get_weathers_usecase.dart';
import 'package:flutter_bootcamp/src/weather_feature/domain/usecase/weather_usecase.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/subjects.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUsecase getWeatherUsecase;
  final GetWeathersUsecase getWeathersUsecase;

  final StreamController<WeatherEntity> _weatherStreamController =
      BehaviorSubject();
  Stream<WeatherEntity> get outWeatherStreamController =>
      _weatherStreamController.stream;
  Sink<WeatherEntity> get inWeatherStreamController =>
      _weatherStreamController.sink;

  WeatherBloc(
      {required this.getWeatherUsecase, required this.getWeathersUsecase})
      : super(WeatherInitial()) {
    on<RequestWeather>((event, emit) async {
      //! For single request
      // emit(WeatherLoading());
      // Either<NetworkFailure, WeatherEntity> response =
      //     await getWeatherUsecase.execute(lat: event.lat, long: event.lon);
      // response.fold((failure) {
      //   emit(WeatherLoadingFailed());
      // }, (success) {
      //   emit(WeatherLoaded());
      // });
    });
    on<RequestAllWeather>((event, emit) async {
      emit(WeatherLoading());
      Either<NetworkFailure, List<WeatherEntity>> response =
          await getWeathersUsecase.execute(locations: event.locations);

      response.fold((failure) {
        emit(WeatherLoadingFailed());
      }, (success) {
        emit(
          WeatherLoaded(
            weatherData: success,
          ),
        );
      });
    });
    on<DisplaySingleWeather>((event, emit) async {
      inWeatherStreamController.add(event.weatherEntity);
    });
  }
}
