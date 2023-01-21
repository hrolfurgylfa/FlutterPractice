import 'package:http/http.dart';

class WeatherDataProvider {
  Future<Response> getRawWeatherData(String city) async {
    String key = "07b7183353864375abc140801232101";
    Response rawWeatherData = await get(Uri.parse(
        "https://api.weatherapi.com/v1/current.json?key=$key&q=$city&aqi=no"));
    return rawWeatherData;
  }
}
