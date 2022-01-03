import 'dart:convert';
import 'package:location/location.dart';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherApiClient {
  Future<Weather>? getWeatherFromCity(String city) async {
    var endPoint = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=acfa9cdc4e00af3a79040e1e1ef02ae5&units=metric',
    );
    var respond = await http.get(endPoint);
    var body = jsonDecode(respond.body);
    // print(Weather.fromJson(body));

    return Weather.fromJson(body);
  }

  Future<Weather>? getWeatherFromGps(LocationData locationData) async {
    var endPoint = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=acfa9cdc4e00af3a79040e1e1ef02ae5&units=metric',
    );
    var respond = await http.get(endPoint);
    var body = jsonDecode(respond.body);
    // print(Weather.fromJson(body));

    return Weather.fromJson(body);
  }
}
