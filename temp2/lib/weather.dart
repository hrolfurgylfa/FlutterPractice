import 'package:json_annotation/json_annotation.dart';
part 'weather.g.dart';

@JsonSerializable()
class WeatherLocation {
  String name;
  String region;
  String country;
  String tz_id;
  int localtime_epoch;
  DateTime localtime;

  WeatherLocation({
    required this.name,
    required this.region,
    required this.country,
    required this.tz_id,
    required this.localtime_epoch,
    required this.localtime,
  });

  factory WeatherLocation.fromJson(Map<String, dynamic> json) =>
      _$WeatherLocationFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherLocationToJson(this);
}

@JsonSerializable()
class WeatherCondition {
  String text;
  String icon;
  int code;

  WeatherCondition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory WeatherCondition.fromJson(Map<String, dynamic> json) =>
      _$WeatherConditionFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherConditionToJson(this);
}

@JsonSerializable()
class WeatherInfo {
  int last_updated_epoch;
  String last_updated;
  double temp_c;
  WeatherCondition condition;
  double wind_kph;
  int humidity;
  int cloud;
  double feelslike_c;

  WeatherInfo({
    required this.last_updated_epoch,
    required this.last_updated,
    required this.temp_c,
    required this.condition,
    required this.wind_kph,
    required this.humidity,
    required this.cloud,
    required this.feelslike_c,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherInfoToJson(this);
}

@JsonSerializable()
class Weather {
  WeatherInfo current;
  WeatherLocation location;

  Weather({
    required this.current,
    required this.location,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
