import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:matcher/matcher.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentPostion = Provider.of<Position>(context);
    return Scaffold(
      body: (currentPostion != null)
          ? Column(
              children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: LatLng(currentPostion.latitude,
                              currentPostion.longitude),
                          zoom: 13.0),
                      zoomGesturesEnabled: true,
                    ))
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
