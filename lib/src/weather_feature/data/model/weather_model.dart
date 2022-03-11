import 'package:json_annotation/json_annotation.dart';
part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  final double lat;
  final double lon;
  final String timezone;
  // ignore: non_constant_identifier_names
  final int timezone_offset;
  final CurrentWeatherModel current;
  final List<DailyWeatherModel> daily;

  WeatherModel({
    required this.lat,
    required this.lon,
    required this.timezone,
    // ignore: non_constant_identifier_names
    required this.timezone_offset,
    required this.current,
    required this.daily,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

abstract class WeatherStatisticsModel {
  final int dt;
  final int sunrise;
  final int sunset;
  final int humidity;
  final List<WeatherDescriptionModel> weather;

  WeatherStatisticsModel(
      {required this.dt,
      required this.sunrise,
      required this.sunset,
      required this.humidity,
      required this.weather});
}

@JsonSerializable()
class WeatherDescriptionModel {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherDescriptionModel(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  factory WeatherDescriptionModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDescriptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDescriptionModelToJson(this);
}

@JsonSerializable()
class CurrentWeatherModel extends WeatherStatisticsModel {
  final double temp;

  CurrentWeatherModel(
      {required this.temp,
      required int dt,
      required int sunrise,
      required int sunset,
      required int humidity,
      required List<WeatherDescriptionModel> weather})
      : super(
            dt: dt,
            sunrise: sunrise,
            sunset: sunset,
            humidity: humidity,
            weather: weather);

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherModelToJson(this);
}

@JsonSerializable()
class DailyWeatherModel extends WeatherStatisticsModel {
  final TemperatureModel temp;
  DailyWeatherModel(
      {required this.temp,
      required int dt,
      required int sunrise,
      required int sunset,
      required int humidity,
      required List<WeatherDescriptionModel> weather})
      : super(
            dt: dt,
            sunrise: sunrise,
            sunset: sunset,
            humidity: humidity,
            weather: weather);
  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$DailyWeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$DailyWeatherModelToJson(this);
}

@JsonSerializable()
class TemperatureModel {
  final double day;
  final double min;
  final double max;

  TemperatureModel({required this.day, required this.min, required this.max});

  factory TemperatureModel.fromJson(Map<String, dynamic> json) =>
      _$TemperatureModelFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureModelToJson(this);
}
