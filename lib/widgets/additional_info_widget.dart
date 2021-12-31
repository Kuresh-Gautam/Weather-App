import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget additionalInfoWidget(
  String wind,
  String humidity,
  String pressure,
  String feelLike,
) {
  TextStyle additionalInfoTitleFont =
      const TextStyle(fontWeight: FontWeight.w600, fontSize: 18);

  TextStyle additionalInfoDataFont =
      const TextStyle(fontWeight: FontWeight.w300, fontSize: 18);

  return Container(
    padding: const EdgeInsets.all(10),
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Wind', style: additionalInfoTitleFont),
                  const SizedBox(height: 10),
                  Text('Pressure', style: additionalInfoTitleFont),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(wind, style: additionalInfoDataFont),
                  const SizedBox(height: 10),
                  Text(pressure, style: additionalInfoDataFont),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Humidity', style: additionalInfoTitleFont),
                  const SizedBox(height: 10),
                  Text('Feel Like', style: additionalInfoTitleFont),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(humidity, style: additionalInfoDataFont),
                  const SizedBox(height: 10),
                  Text(feelLike, style: additionalInfoDataFont),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
