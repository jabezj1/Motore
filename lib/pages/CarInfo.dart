import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CarInfo extends StatefulWidget {
  const CarInfo({super.key});

  @override
  State<CarInfo> createState() => _CarInfoState();
}

class _CarInfoState extends State<CarInfo> {
  List<dynamic> cars = [];
  // var yearSelected = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
      ),
      body: ListView.builder(
          itemCount: cars.length,
          itemBuilder: (context, index) {
            final year = cars[index];
            // final show = year['data']['image'];
            return ListTile(
              // leading: ClipRRect(
              //     borderRadius: BorderRadius.circular(100),
              //     child: Image.network(show)),
              title: Text(year),
              onTap: () {
                print(year);
                // yearSelected = year;
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchCarYear,
      ),
    );
  }

  void fetchCarYear() async {
    print("fetchCar called");
    const url = 'http://api.carmd.com/v3.0/year';
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: {
      "content-type": "application/json",
      "authorization": "Basic YjFkYTZkMzgtYzZmYy00M2YzLTg1YmQtYzE5YjVmODg2NzNj",
      "partner-token": "171474d263404efa843077ee5e3f747b"
    });
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      cars = json['data'];
    });
    print('fetchCars complete');
  }

  void fetchCarMake() async {
    // var yearmake = yearSelected;
    print("fetchCarMake called");
    // const url = 'http://api.carmd.com/v3.0/make?year=' '${yearmake}';
    // // final uri = Uri.parse(url);
    // final response = await http.get(uri, headers: {
    //   "content-type": "application/json",
    //   "authorization": "Basic YjFkYTZkMzgtYzZmYy00M2YzLTg1YmQtYzE5YjVmODg2NzNj",
    //   "partner-token": "171474d263404efa843077ee5e3f747b"
    // // });
    // final body = response.body;
    // final json = jsonDecode(body);
    setState(() {
      // cars = json['data'];
    });
    print('fetchCarsMake complete');
  }
}
