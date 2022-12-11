import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:matcher/matcher.dart';
import 'package:provider/provider.dart';

import 'nearby_places_screen.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currPosition = Provider.of<Position?>(context);
    double latitude = 40.785091;
    double longitude = -73.968285;

    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Text('Fuel',
              style: GoogleFonts.josefinSans(
                color: Colors.blue,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: false,
          elevation: 0,
          flexibleSpace: Container(
              // decoration: const BoxDecoration(
              //   gradient:
              //       LinearGradient(colors: [Color(0xff15aaaff), Color(0xFFADF7F2)]),
              // ),
              ),
        ),
        // ignore: unnecessary_null_comparison
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return const NearByPlacesScreen();
            }));
          },
          label: Text('Nearby Gas Station'),
          backgroundColor: Colors.red,
          hoverColor: Colors.orange,
          focusColor: Colors.green,
          autofocus: true,
          hoverElevation: 50,
          heroTag: 'uniqueTag',
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        body: (currPosition != null)
            ? Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 100,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                            currPosition.latitude, currPosition.longitude),
                        zoom: 16,
                      ),
                      zoomGesturesEnabled: true,
                    ),
                  )
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
