import 'package:json_annotation/json_annotation.dart';
part 'weather.g.dart';

@JsonSerializable()
class Weather {
  Map<String, dynamic> current;
  Map<String, dynamic> location;
  // double temp_c;
  // double feelslike_c;
  // int humidity;
  // int cloud;
  // double wind_kph;
  // String tz_id;
  // String name;

  Weather({
    required this.current,
    required this.location,
    // required this.temp_c,
    // required this.feelslike_c,
    // required this.humidity,
    // required this.cloud,
    // required this.wind_kph,
    // required this.tz_id,
    // required this.name,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
