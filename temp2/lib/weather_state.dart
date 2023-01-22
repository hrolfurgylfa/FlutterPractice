import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:temp2/weather.dart';

Future<Weather> getWeatherData(String city) async {
  String key = "07b7183353864375abc140801232101";
  Response res = await get(Uri.parse(
      "https://api.weatherapi.com/v1/current.json?key=$key&q=$city&aqi=no"));
  final json = jsonDecode(res.body);
  return Weather.fromJson(json);
}

class WeatherNotifier extends StateNotifier<String> {
  WeatherNotifier() : super("London");

  void setLocation(String city) {
    state = city;
  }
}

final weatherLocation =
    StateNotifierProvider<WeatherNotifier, String>((ref) => WeatherNotifier());
final weatherData = FutureProvider((ref) async {
  final location = ref.watch(weatherLocation);
  return await getWeatherData(location);
});
