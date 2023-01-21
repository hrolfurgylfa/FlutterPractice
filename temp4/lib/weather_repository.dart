import 'dart:convert';

import 'package:http/http.dart';
import 'package:temp4/weather.dart';
import 'package:temp4/weather_data_provider.dart';

class WeatherRepository {
  final WeatherDataProvider _weatherDataProvider = WeatherDataProvider();
  Future<Weather> getWeather(String location) async {
    final Response rawWeather =
        await _weatherDataProvider.getRawWeatherData(location);
    final json = jsonDecode(rawWeather.body);
    final Weather weather = Weather.fromJson(json);
    return weather;
  }
}
