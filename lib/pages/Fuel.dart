import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

LatLng startingLocation = LatLng(40.7678, -73.9645);

class Fuel extends StatefulWidget {
  const Fuel({Key? key}) : super(key: key);

  @override
  _FuelState createState() => _FuelState();
}

class _FuelState extends State<Fuel> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      initialCameraPosition: CameraPosition(
        target: startingLocation,
        zoom: 12,
      ),
      onMapCreated: (controller) {
        mapController = controller;
      },
    ));
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location services are disabled.");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permissions are denied.");
      }
    }

    return await Geolocator.getCurrentPosition();
  }
}
