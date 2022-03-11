part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final List<WeatherEntity> weatherData;

  WeatherLoaded({required this.weatherData});
}

class WeatherLoadingFailed extends WeatherState {}
