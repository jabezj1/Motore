import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

List<dynamic> cars = [];
List<dynamic> make = [];

class CarInfo extends StatefulWidget {
  const CarInfo({super.key});

  @override
  State<CarInfo> createState() => _CarInfoState();
}

class _CarInfoState extends State<CarInfo> {
  var yearSelected;
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
            // final name = cars[index]["name"];
            // final show = year['data']['image'];
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                // child: Image.network(show)),
              ),
              title: Text(year.toString()),
              //
              onTap: () {
                print(year);
                yearSelected = year;
                // fetchCarMake();
              },
            );
          }),
      floatingActionButton: FloatingActionButton(onPressed: fetchCarYear),
    );
  }

  void fetchCarYear() async {
    print("fetchCar called");
    const url = 'https://car-api2.p.rapidapi.com/api/years';
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'e6ebfb9ba0mshc75a7335d6856fcp170770jsn8630a0da6b73',
      'X-RapidAPI-Host': 'car-api2.p.rapidapi.com'
    });
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      cars = json;
    });
    print('fetchCars complete');
  }

  void fetchCarMake() async {
    print("fetchCarMake called");
    var url = 'http://api.carmd.com/v3.0/make?year=' '$yearSelected';
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: {
      "content-type": "application/json",
      "authorization": "Basic YjFkYTZkMzgtYzZmYy00M2YzLTg1YmQtYzE5YjVmODg2NzNj",
      "partner-token": "171474d263404efa843077ee5e3f747b"
    });
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      make = json;
    });
    print('fetchCarsMake complete');
  }
}
