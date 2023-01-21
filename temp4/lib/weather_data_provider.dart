import 'package:http/http.dart';

class WeatherDataProvider {
  Future<Response> getRawWeatherData(String city) async {
    Response rawWeatherData = await get(Uri.parse("Url"));
    return rawWeatherData;
  }
}
