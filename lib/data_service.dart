import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_weather_app/models.dart';

// api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}}
// 8f4fd4cc69ca11350b1abfa8e07a55f9

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    final queryParameters = {
      'q': city,
      'appid': '8f4fd4cc69ca11350b1abfa8e07a55f9',
      'units': 'imperial'
    };
    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);
    final response = await http.get(uri);
    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
