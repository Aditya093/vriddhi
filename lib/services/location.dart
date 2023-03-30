import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    try {
      if (permission == LocationPermission.denied) {
        // Display an error message and exit the method
        AlertDialog(
          title: Text("Permission Request"),
          content: Text(
              "Weather Forecasting must need your current location access!"),
          actions: [
            TextButton(
              onPressed: () {
                permission;
              },
              child: Text("Deny"),
            ),
            TextButton(
                onPressed: () {
                  permission = LocationPermission.whileInUse;
                },
                child: Text("Allow")),
          ],
        );
        // print("Permission Denied");
      } else if (permission == LocationPermission.deniedForever) {
        // Display an error message and open the app settings so the user can grant permission manually
        print("Never Access");
      } else {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        latitude = position.latitude;
        longitude = position.longitude;
        // The user granted permission or already granted it in the past
      }
    } catch (e) {
      debugPrint('$e');
    }
  }
}
