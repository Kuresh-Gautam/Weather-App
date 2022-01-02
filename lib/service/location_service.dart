import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:location/location.dart';
//import 'package:weather_app/model/weather_model.dart';

getLocation() async {
  final Location location = Location();
  LocationData locationData;
  bool serviceEnable;
  PermissionStatus permissionStatus;

  serviceEnable = await location.serviceEnabled();
  if (!serviceEnable) {
    serviceEnable = await location.requestService();
  }

  permissionStatus = await location.hasPermission();

  if (permissionStatus == PermissionStatus.denied) {
    permissionStatus = await location.requestPermission();
  }

  locationData = await location.getLocation();
  return locationData;
}

Future<List<String>> listOfCities(LocationData locationData, int count) async {
  var endPoint = Uri.parse(
    'https://api.openweathermap.org/data/2.5/find?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=acfa9cdc4e00af3a79040e1e1ef02ae5&cnt=$count',
  );
  var respond = await http.get(endPoint);
  var body = jsonDecode(respond.body);
  return List<String>.from(List.from(body['list']).map((item) => item['name']));
}
