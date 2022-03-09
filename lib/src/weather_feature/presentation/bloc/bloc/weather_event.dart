part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class RequestWeather extends WeatherEvent {
  final double lat;
  final double lon;

  RequestWeather({required this.lat, required this.lon});
}

class RequestAllWeather extends WeatherEvent {
  final List<Map<String, double>> locations;

  RequestAllWeather({required this.locations});
}

class DisplaySingleWeather extends WeatherEvent {
  final WeatherEntity weatherEntity;

  DisplaySingleWeather({required this.weatherEntity});
}
