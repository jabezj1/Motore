import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:motore/pages/CarInfo.dart';
import 'dart:convert' as convert;

import 'package:motore/pages/createCarProfile.dart';
import 'package:motore/pages/profile.dart';

import 'carMakes.dart';

List<dynamic> carModel = model;
TextEditingController theModel = TextEditingController();
String apiModel = ''.replaceAll(" ", "%20");
List<dynamic> modelTrim = [];

class CarModel extends StatefulWidget {
  const CarModel({super.key});

  @override
  State<CarModel> createState() => _CarModelState();
}

class _CarModelState extends State<CarModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Models"),
      ),
      body: ListView.builder(
          itemCount: model.length,
          itemBuilder: (context, index) {
            final year = model[index]["name"];
            // final name = cars[index]["name"];
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                // child: Image.network(show)),
              ),
              title: Text(year),
              //
              onTap: () {
                theModel.text = year.toString();
                apiModel = year.toString();
                fetchCarTrim();
                // fetchCarModel();
              },
            );
          }),
    );
  }

  void fetchCarTrim() async {
    print("fetchCar called");
    // print(theMake);
    String newMake = apiMake.replaceAll(" ", "%20");
    String newModel = apiModel.replaceAll(" ", "%20");
    String newYear = apiYear.replaceAll(" ", "%20");

    apiMake = newMake;
    apiModel = newModel;
    apiYear = newYear;

    final url =
        'https://car-api2.p.rapidapi.com/api/trims?year=$newYear&make=$newMake&model=$newModel';
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'e6ebfb9ba0mshc75a7335d6856fcp170770jsn8630a0da6b73',
      'X-RapidAPI-Host': 'car-api2.p.rapidapi.com'
    });
    final body = response.body;
    final json = jsonDecode(body);

    modelTrim = json['data'];

    print('fetchCars complete');
    print(modelTrim);
  }

  // void fetchCarMake() async {
  //   print("fetchCar called");
  //   const url = 'https://car-api2.p.rapidapi.com/api/makes';
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri, headers: {
  //     'X-RapidAPI-Key': 'e6ebfb9ba0mshc75a7335d6856fcp170770jsn8630a0da6b73',
  //     'X-RapidAPI-Host': 'car-api2.p.rapidapi.com'
  //   });
  //   final body = response.body;
  //   final json = jsonDecode(body);
  //   setState(() {
  //     make = json['data'];
  //   });
  //   print('fetchCars complete');
  // }

//   void fetchCarMake() async {
//     print("fetchCarMake called");
//     var url = 'http://api.carmd.com/v3.0/make?year=' '$yearSelected';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri, headers: {
//       "content-type": "application/json",
//       "authorization": "Basic YjFkYTZkMzgtYzZmYy00M2YzLTg1YmQtYzE5YjVmODg2NzNj",
//       "partner-token": "171474d263404efa843077ee5e3f747b"
//     });
//     final body = response.body;
//     final json = jsonDecode(body);
//     setState(() {
//       make = json;
//     });
//     print('fetchCarsMake complete');
//   }
// }
}
