import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/service/weather_api_client.dart';
import 'package:weather_app/widgets/additional_info_widget.dart';
import 'package:weather_app/widgets/current_weather_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.modeChange, required this.darkMode})
      : super(key: key);

  final Function modeChange;
  final bool darkMode;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<void> getData() async {
    data = await client.getLocation('Kathmandu');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
            title: const Text("Weather App"),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  widget.modeChange();
                },
                icon: Icon(
                  widget.darkMode
                      ? Icons.toggle_off_outlined
                      : Icons.toggle_on_outlined,
                  size: 40,
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            hoverElevation: 16,
            hoverColor: Colors.yellowAccent,
            child: const Icon(
              Icons.location_on,
            ),
            onPressed: () {},
          ),
          body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      currentWeatherWidget(
                          Icons.wb_sunny, "${data!.temp}", "${data!.cityName}"),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Additional Information',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.green,
                      ),
                      //Now lets create additional information weidget
                      additionalInfoWidget("${data!.wind}", "${data!.pressure}",
                          "${data!.humidity}", "${data!.feels_like}"),

                      //Now we have the UI ready
                      // Start git repository
                      //after that API fetch
                    ],
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return (const CircularProgressIndicator());
              }
              return Container();
            },
          )),
    );
  }
}
