import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:motore/navbar.dart';
import 'package:motore/pages/Dashboard.dart';
import 'package:motore/pages/History.dart';
import 'package:motore/pages/InspectPastMaintenance.dart';
import 'package:motore/pages/createCarProfile.dart';

class createNewMaintenance extends StatefulWidget {
  const createNewMaintenance({super.key, required this.title});
  final String title;

  @override
  StatecreateNewMaintenance createState() => StatecreateNewMaintenance();
}

class StatecreateNewMaintenance extends State<createNewMaintenance> {
  TextEditingController systemMaintenance = TextEditingController();
  TextEditingController milesMaintenance = TextEditingController();
  Timestamp timestampdate = Timestamp.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff15aaaff), Color(0xFFADF7F2)]),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text(
              'Entries',
              style: TextStyle(color: Color.fromARGB(255, 5, 132, 235)),
            ),
            centerTitle: true,
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF15AAAFF), Color(0xFFADF7F2)]),
              ),
            ),
          ),
          //backgroundColor: Color.fromARGB(255, 150, 206, 232),
          body: Container(
            margin: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              child: Column(children: [
                const Text(
                  "Enter the details of your upcoming Maintenance.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                EnterHistoryInfo(
                    hintText: 'Maintenance', controller: systemMaintenance),
                EnterHistoryInfo(
                    hintText: 'Miles', controller: milesMaintenance),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    height: 50,
                    width: 280,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            side: const BorderSide(width: 4.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: const Text('Create New Maintenance',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                        onPressed: () async {
                          print({
                            "miles": milesMaintenance.text,
                          });

                          FirebaseFirestore.instance
                              .collection("users")
                              .doc(FirebaseAuth.instance.currentUser
                                  ?.email) //FirebaseAuth.instance.currentUser?.email
                              .collection("cars")
                              .doc(sellNick)
                              .collection("maintenance")
                              .doc()
                              .set({
                                "system": systemMaintenance.text,
                                "miles": milesMaintenance.text,
                                
                              })
                              .then((value) =>
                                  print("successfully added document"))
                              .catchError((e) => print(e));
                          index = 0;
                          defPage = Dashboard();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Navigation()));
                        })),
              ]),
            ),
          )),
    );
  }
}

class EnterHistoryInfo extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const EnterHistoryInfo(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, right: 40, left: 30),
      child: TextField(
        obscureText: false,
        controller: controller,
        maxLines: null,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.red)),
          hintText: hintText,
        ),
      ),
    );
  }
}
