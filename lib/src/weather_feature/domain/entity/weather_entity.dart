class WeatherEntity {
  final String city;
  final CurrentStats currentStats;
  final List<DailyStats> dailyStats;

  WeatherEntity(
      {required this.city,
      required this.currentStats,
      required this.dailyStats});
}

abstract class WeatherStatistics {
  final DateTime dateTime;
  final DateTime sunrise;
  final DateTime sunset;
  final int humidity;
  final Weather weather;

  WeatherStatistics(
      {required this.dateTime,
      required this.sunrise,
      required this.sunset,
      required this.humidity,
      required this.weather});
}

class CurrentStats extends WeatherStatistics {
  final double currentTemp;
  CurrentStats(
      {required this.currentTemp,
      required DateTime dateTime,
      required DateTime sunrise,
      required DateTime sunset,
      required int humidity,
      required Weather weather})
      : super(
          dateTime: dateTime,
          sunrise: sunrise,
          sunset: sunset,
          humidity: humidity,
          weather: weather,
        );
}

class DailyStats extends WeatherStatistics {
  DailyStats(
      {required DateTime dateTime,
      required DateTime sunrise,
      required DateTime sunset,
      required int humidity,
      required Weather weather})
      : super(
          dateTime: dateTime,
          sunrise: sunrise,
          sunset: sunset,
          humidity: humidity,
          weather: weather,
        );
}

class Weather {
  final String weather;
  final String description;

  Weather({required this.weather, required this.description});
}

class Temperature {
  final double day;
  final double min;
  final double max;

  Temperature({required this.day, required this.min, required this.max});
}
