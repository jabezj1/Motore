import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:motore/pages/CarInfo.dart';
import 'package:motore/pages/Dashboard.dart';
import 'package:motore/pages/carModel.dart';
import 'package:motore/pages/carSpec.dart';
import 'package:motore/pages/carSpecCard.dart';
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
  bool dark = false;
  String? username = FirebaseAuth.instance.currentUser?.displayName;
  String? emailAdd = FirebaseAuth.instance.currentUser?.email;

  List<Object> _carSpeclist = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getCarSpesc();
  }

  // String imgMake = apiMake.replaceAll(" ", "%20");
  // String imgModel = apiModel.replaceAll(" ", "%20");
  // String imgYear = apiYear.replaceAll(" ", "%20");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        // backgroundColor: Colors.amber,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.red,
            // gradient: LinearGradient(colors: [
            //   Colors.red,
            //   // Color(0xff15aaaff),
            // ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            // gradient: LinearGradient(colors: [
            //   Color(0xFF15AAAFF),
            //   Color(0xFFADF7F2),
            // ]),
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
                  gradient: LinearGradient(colors: [
                    Colors.red,
                    Color(0xff15aaaff),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  // gradient: const LinearGradient(colors: [
                  //   Color(0xFF15AAAFF),
                  //   Color(0xFFADF7F2),
                  // ]),
                  //color: Color.fromARGB(255, 150, 206, 232),

                  image: DecorationImage(
                    image: NetworkImage(
                        "https://cdn-01.imagin.studio/getImage?customer=usmotore&make=$selMake&modelFamily=$selModel"),
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
              child: ElevatedButton(
                  child: Text(
                    "Select a car",
                  ),
                  onPressed: (() async {
                    showModalBottomSheet(
                        backgroundColor: const Color.fromARGB(255, 35, 34, 34),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0),
                          ),
                        ),
                        context: context,
                        builder: (context) => Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: Container(
                              margin: const EdgeInsets.all(20),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2,
                                      child: ListView.builder(
                                        itemCount: _carSpeclist.length,
                                        itemBuilder: (context, index) {
                                          print(_carSpeclist);
                                          return CarSpecCard(
                                              _carSpeclist[index] as CarSpec);
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )));
                  })),
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
                  title: 'Active Reminders',
                  value: reminderList.length.toString(),
                ),
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
                ),
                // Switch(
                //     value: dark,
                //     onChanged: ((value) {
                //       if (value == false) {
                //         darkColor = Colors.white;
                //       } else {
                //         darkColor = Colors.black;
                //       }
                //     }))
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Future getCarSpesc() async {
    final userEmail = FirebaseAuth.instance.currentUser?.email;
    var data = await FirebaseFirestore.instance
        .collection("users")
        .doc(userEmail) // replace with userEmail
        .collection("cars")
        .orderBy("nickname", descending: true)
        .get();

    setState(() {
      _carSpeclist =
          List.from(data.docs.map((doc) => CarSpec.fromSnapshot(doc)));
    });
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
      // color: Colors.green.shade100,
      decoration: BoxDecoration(
        // color: Colors.red,
        // color: Colors.green.shade100,
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
