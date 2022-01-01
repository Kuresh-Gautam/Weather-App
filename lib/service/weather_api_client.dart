import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherApiClient {
  Future<Weather>? getLocation(String? location) async {
    var endPoint = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=acfa9cdc4e00af3a79040e1e1ef02ae5&units=metric',
    );
    var respond = await http.get(endPoint);
    var body = jsonDecode(respond.body);
    // print(Weather.fromJson(body));

    return Weather.fromJson(body);
  }
}
