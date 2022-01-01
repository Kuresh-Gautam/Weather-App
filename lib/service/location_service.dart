import 'package:location/location.dart';

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
