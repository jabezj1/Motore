import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motore/pages/CarInfo.dart';
import 'package:motore/pages/Dashboard.dart';
import 'package:motore/pages/carModel.dart';
import 'package:motore/services/auth.dart';
import 'package:motore/pages/createCarProfile.dart';
import '../components/basicPage.dart';
import 'package:http/http.dart' as http;

import 'carMakes.dart';

List<dynamic> cars = [];
List<dynamic> make = [];

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

  cars = json;

  print('fetchCars complete');
  print(cars);
}

void fetchCarMake() async {
  print("fetchCar called");
  const url = 'https://car-api2.p.rapidapi.com/api/makes';
  final uri = Uri.parse(url);
  final response = await http.get(uri, headers: {
    'X-RapidAPI-Key': 'e6ebfb9ba0mshc75a7335d6856fcp170770jsn8630a0da6b73',
    'X-RapidAPI-Host': 'car-api2.p.rapidapi.com'
  });
  final body = response.body;
  final json = jsonDecode(body);

  make = json['data'];

  print('fetchCars complete');
}

const List<String> listOfCarNames = <String>[
  ' Car One',
  ' Car Two',
  ' Car Three',
  ' Car Four',
];

String drop = listOfCarNames.first;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  StateProfile createState() => StateProfile();
}

final AuthService _auth = AuthService();

class StateProfile extends State<Profile> {
  bool read = true;
  String? username = FirebaseAuth.instance.currentUser?.displayName;
  String? emailAdd = FirebaseAuth.instance.currentUser?.email;

  // String imgMake = apiMake.replaceAll(" ", "%20");
  // String imgModel = apiModel.replaceAll(" ", "%20");
  // String imgYear = apiYear.replaceAll(" ", "%20");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
        ),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF15AAAFF),
              Color(0xFFADF7F2),
            ]),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 100),
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color(0xFF15AAAFF),
                    Color(0xFFADF7F2),
                  ]),
                  //color: Color.fromARGB(255, 150, 206, 232),

                  image: DecorationImage(
                    image: NetworkImage(
                        "https://cdn-01.imagin.studio/getImage?customer=usmotore&make=$apiMake&modelFamily=$apiModel"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(35),
                    bottomLeft: Radius.circular(35),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFF04589A),
                      offset: Offset(7, 7),
                      blurRadius: 6,
                    )
                  ]),
              child: Text(
                "*Some Cars May not appear.",
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black38, width: 3),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const <BoxShadow>[]),
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: DropdownButton<String>(
                value: drop,
                icon: const Icon(Icons.arrow_drop_down_sharp),
                elevation: 16,
                style: const TextStyle(color: Colors.blue),
                underline: Container(
                  height: 1,
                  width: 1,
                  color: Colors.blueAccent,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    drop = value!;
                  });
                },
                items: listOfCarNames
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                ProfileRow(title: 'Name', value: username.toString()),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ProfileRow(title: 'Email', value: emailAdd.toString()),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ProfileRow(
                    title: 'Number of Cars',
                    value: listOfCarNames.length.toString()),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ProfileRow(
                  title: 'Active Reminders',
                  value: reminderList.length.toString(),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ProfileRow(
                      title: 'User ID Number',
                      value: FirebaseAuth.instance.currentUser!.uid.toString()),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () async {
                    fetchCarYear();
                    fetchCarMake();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateCarProfile(
                                title: "a",
                              )),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text(
                    'Add a Car',
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 15.0),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () async {
                    await _auth.signOut();
                    // await _auth.emailsignOut();
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text(
                    'Log Out',
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 15.0),
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProfileRow extends StatelessWidget {
  const ProfileRow({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    ),
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                    ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.3,
                child: const Divider(
                  thickness: 2.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black38, width: 3),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.only(left: 30, right: 30),
      child: DropdownButton<String>(
        value: drop,
        icon: const Icon(Icons.arrow_drop_down_sharp),
        elevation: 16,
        style: const TextStyle(color: Colors.blue),
        underline: Container(
          height: 6,
          width: 3,
          color: Colors.blueAccent,
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            drop = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
