import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:motore/pages/CarInfo.dart';
import 'package:motore/pages/carModel.dart';
import 'dart:convert' as convert;

import 'package:motore/pages/createCarProfile.dart';
import 'package:motore/pages/profile.dart';

import 'carMakes.dart';

List<dynamic> carModelTrim = modelTrim;
TextEditingController theModelTrim = TextEditingController();

class CarModelTrim extends StatefulWidget {
  const CarModelTrim({super.key});

  @override
  State<CarModelTrim> createState() => _CarModelTrimState();
}

class _CarModelTrimState extends State<CarModelTrim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trims"),
      ),
      body: ListView.builder(
          itemCount: modelTrim.length,
          itemBuilder: (context, index) {
            final year = modelTrim[index]["name"];
            final des = modelTrim[index]["description"];
            // final name = cars[index]["name"];
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                // child: Image.network(show)),
              ),
              title: Text(year),
              subtitle: Text(des),
              //
              onTap: () {
                theModelTrim.text = year.toString();
                 Navigator.pop(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateCarProfile(title: "")));

                // fetchCarModel();
              },
            );
          }),
    );
  }

  // void fetchCarTrim() async {
  //   print("fetchCar called");
  //   print(theMake);
  //   String newMake = theMake.replaceAll(" ", "%20");
  //   String newModel = theModel.replaceAll(" ", "%20");
  //   String newYear = theYear.replaceAll(" ", "%20");
  //   print(newMake);

  //   final url =
  //       'https://car-api2.p.rapidapi.com/api/trims?year=$newYear&make=$newMake&model=$newModel';
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri, headers: {
  //     'X-RapidAPI-Key': 'e6ebfb9ba0mshc75a7335d6856fcp170770jsn8630a0da6b73',
  //     'X-RapidAPI-Host': 'car-api2.p.rapidapi.com'
  //   });
  //   final body = response.body;
  //   final json = jsonDecode(body);

  //   model = json['data'];

  //   print('fetchCars complete');
  //   print(model);
  // }

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
