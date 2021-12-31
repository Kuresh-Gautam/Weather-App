import 'package:flutter/material.dart';

Widget currentWeatherWidget(
  IconData icon,
  String temp,
  String location,
) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        Icon(
          icon,
          color: Colors.orange,
          size: 64,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          temp,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 46,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          location,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 30,
          ),
        ),
      ],
    ),
  );
}
