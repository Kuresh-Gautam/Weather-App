class Weather {
  String? cityName;
  String? temp;
  double? wind;
  int? humidity;
  // ignore: non_constant_identifier_names
  double? feels_like;
  int? pressure;

  Weather({
    required this.cityName,
    required this.temp,
    required this.wind,
    required this.humidity,
    // ignore: non_constant_identifier_names
    required this.feels_like,
    required this.pressure,
  });

  //Now let's build a function to parse the Json file into the model

  Weather.fromJson(Map<String, dynamic> jsonObj) {
    cityName = jsonObj['name'];
    temp = jsonObj['main']['temp'];
    wind = jsonObj['wind']['speed'];
    humidity = jsonObj['main']['humidity'];
    feels_like = jsonObj['main']['feels_like'];
    pressure = jsonObj['main']['pressure'];
  }
}
