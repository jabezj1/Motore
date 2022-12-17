import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'nearby_response.dart';
import 'dart:math';

class NearByPlacesScreen extends StatefulWidget {
  const NearByPlacesScreen({Key? key}) : super(key: key);

  @override
  State<NearByPlacesScreen> createState() => _NearByPlacesScreenState();
}

class _NearByPlacesScreenState extends State<NearByPlacesScreen> {
  String apiKey = "AIzaSyCQ7bm9nSgSRTwrewm51ZCoBynb7upQwc4";
  // String radius = "30";

  // double latitude = 40.785091;
  // double longitude = -73.968285;

  late double latitude;
  late double longitude;

  NearbyPlacesResponse nearbyPlacesResponse = NearbyPlacesResponse();

  @override
  Widget build(BuildContext context) {
    final currPosition = Provider.of<Position?>(context);

    latitude = currPosition!.latitude;
    longitude = currPosition.longitude;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.red,
          Color(0xff15aaaff),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Nearby Gas Station'),
          centerTitle: true,
          backgroundColor: Colors.red,
          elevation: 0,
          toolbarHeight: 50,
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 100.0,
                    right: 20,
                    left: 20,
                  ),
                  child: Column(
                    children: [
                      Lottie.network(
                'https://assets10.lottiefiles.com/packages/lf20_0ec3p5o6.json'),
                      ElevatedButton(
                          style: ButtonStyle(
                              shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green.shade300)),
                          onPressed: () {
                            getNearbyPlaces();
                          },
                          child: Text(
                            "Find a Gas Station",
                            style: TextStyle(fontSize: 35),
                          )),
                    ],
                  ),
                ),
              ),
              if (nearbyPlacesResponse.results != null)
                for (int i = 0; i < nearbyPlacesResponse.results!.length; i++)
                  nearbyPlacesWidget(nearbyPlacesResponse.results![i])
            ],
          ),
        ),
      ),
    );
  }

  void getNearbyPlaces() async {
    var url = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=' +
            latitude.toString() +
            ',' +
            longitude.toString() +
            '&type=gas_station&rankby=distance&' +
            '&key=' +
            apiKey));

    //  var response = await http.post(url);

    nearbyPlacesResponse =
        NearbyPlacesResponse.fromJson(convert.jsonDecode(url.body));

    setState(() {});
  }

  Widget nearbyPlacesWidget(Results results) {
    final currPosition = Provider.of<Position?>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2.5),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              results.name!,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 5,
            ),
            // Text("Location: " +
            //     results.geometry!.location!.lat.toString() +
            //     " , " +
            //     results.geometry!.location!.lng.toString()),
            Text(
              results.vicinity!,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 5,
            ),

            Text(
              results.openingHours != null ? "Open" : "Closed",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'user-rating: ' + results.userRatingsTotal.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            IconTheme(
              data: IconThemeData(
                color: Colors.amber,
                size: 24,
              ),
              child:
                  StarDisplay(value: double.parse(results.rating.toString())),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Total distance: " +
                  (_coordinateDistance(
                          currPosition!.latitude,
                          currPosition.longitude,
                          results.geometry!.location!.lat,
                          results.geometry!.location!.lng))
                      .toStringAsFixed(2)
                      .toString() +
                  " km",
              style: TextStyle(
                color: Colors.yellow,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            IconButton(
              iconSize: 50,
              icon: Icon(Icons.directions),
              color: Colors.amber,
              onPressed: (() {
                _launchMapsUrl(results.geometry!.location!.lat!,
                    results.geometry!.location!.lng!);
              }),
            ),

            // Consumer<double>(
            //   builder: (context, meters, widget) {
            //     return Text(
            //         "${results.vicinity!} \u00b7 ${(meters / 1609).round()} mi");
            //   },
            // ),
            // Text(results.vicinity!),
            // Text(results.photos.)

            // // Image.network(results.icon!),
            
          ],
        ),
      ),
    );
  }
}

void _launchMapsUrl(double lat, double lng) async {
  final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

//it will return distance in KM
double _coordinateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}

//Star Rating Bar
class StarDisplay extends StatelessWidget {
  final double value;
  const StarDisplay({Key? key, this.value = 0})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}
