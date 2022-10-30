import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class CarInfoPage extends StatefulWidget {
  const CarInfoPage({super.key});

  @override
  State<CarInfoPage> createState() => _CarInfoPageState();
}

class _CarInfoPageState extends State<CarInfoPage> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              title: Text('year'),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchCarYear,
      ),
    );
  }

  void fetchCarYear() async {
    print("fetchCarYear called");
    const url = 'https://car-data.p.rapidapi.com/cars/years';
    final uri = Uri.parse(url);
    final response = await http.get(
      uri,
      headers: {
        'X-RapidAPI-Key': 'e6ebfb9ba0mshc75a7335d6856fcp170770jsn8630a0da6b73',
        'X-RapidAPI-Host': 'car-data.p.rapidapi.com'
      },
    );
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['data'];
    });
    print("Fetch complete");
  }
}
