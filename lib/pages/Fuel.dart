import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:motore/services/auth.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class Fuel extends StatefulWidget {
  const Fuel({Key? key}) : super(key: key);

  @override
  _FuelState createState() => _FuelState();
}

class _FuelState extends State<Fuel> {
  late LatLng currentLatLng;
  // late LatLng currentLatLng = const LatLng(48.8566, 2.3522);
  final Completer<GoogleMapController> _controller = Completer();
  Future<void> _determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location permissions denied!');
      }
    } else {
      throw Exception(Error);
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      currentLatLng = LatLng(position.latitude, position.longitude);
      _goToCurrentLocation();
    });
    return;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print("Current Location: " + currentLatLng.latitude.toString() + " " + currentLatLng.longitude.toString());
    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(target: currentLatLng, zoom: 5),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: <Marker>{
            Marker(
              draggable: true,
              markerId: const MarkerId("1"),
              position: currentLatLng,
              icon: BitmapDescriptor.defaultMarker,
              infoWindow: const InfoWindow(
                title: 'My Location',
              ),
            )
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _goToCurrentLocation,
          label: const Text('Home'),
          icon: const Icon(Icons.home),
        ),
      ),
    );
  }

  Future<void> _goToCurrentLocation() async {
    await _determinePosition();
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: currentLatLng, zoom: 3)));
  }
  // late GoogleMapController mapController;

  // final LatLng _center = const LatLng(45.521563, -122.677433);

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: const Text(
  // 				'Nearby Gas Stations',
  // 				style: TextStyle(
  // 					color: Color.fromARGB(255, 255, 255, 255)
  // 				),
  // 			),
  // 			centerTitle: true,
  // 			elevation: 0,
  // 			flexibleSpace: Container(
  // 				decoration: const BoxDecoration(
  // 					gradient: LinearGradient(
  // 						begin: Alignment.bottomLeft,
  // 						end: Alignment.bottomRight,
  // 						colors: [
  // 							Color(0xFF15AAAFF),
  // 							Color(0xFFADF7F2),
  // 						]
  // 					),
  // 				),
  // 			),
  //       ),
  //       body: GoogleMap(
  //         onMapCreated: _onMapCreated,
  //         initialCameraPosition: CameraPosition(
  //           target: _center,
  //           zoom: 11.0,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
