import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:motore/pages/Dashboard.dart';
import 'package:motore/pages/InspectGas.dart';
import 'package:motore/pages/carSpecCard.dart';

class CreateGasExpense extends StatefulWidget {
  const CreateGasExpense({super.key, required this.title});
  final String title;

  @override
  StateCreateGasExpense createState() => StateCreateGasExpense();
}

class StateCreateGasExpense extends State<CreateGasExpense> {
  TextEditingController gasCostController = TextEditingController();
  TextEditingController gasGallonsController = TextEditingController();
  TextEditingController gasMileageController = TextEditingController();
  TextEditingController gasTypeController = TextEditingController();
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
                  "Enter the details of your latest Gas Expense.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                EnterHistoryInfo(
                    hintText: 'Gas Type', controller: gasTypeController),
                EnterHistoryInfo(
                    hintText: 'Cost', controller: gasCostController),
                EnterHistoryInfo(
                    hintText: 'Gallons', controller: gasGallonsController),
                EnterHistoryInfo(
                    hintText: 'Current Mileage', controller: gasMileageController),
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
                        child: const Text('Add Gas Expense',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                        onPressed: () async {
                          int newMiles = int.parse(gasMileageController.text);
                          int prevMiles = 0;
                          int deltaMiles = 0;
						  
                          
						  // save the current mileage of the car
						FirebaseFirestore.instance
                            .collection("users")
                            .doc(FirebaseAuth.instance.currentUser?.email)
                            .collection("cars")
                            .doc(sellNick)
                            .get()
                            .then((DocumentSnapshot documentSnapshot) {
                              prevMiles = documentSnapshot.get("miles");
                            });

                          // change mileage of car to what the new indicated mileage is
                          FirebaseFirestore.instance
                            .collection("users")
                            .doc(FirebaseAuth.instance.currentUser?.email)
                            .collection("cars")
                            .doc(sellNick)
                            .update({
                              "miles" : newMiles
                            });

							// calculate the change in mileage
                          deltaMiles = newMiles - prevMiles;

						
						
                          var updatingMaintCollection = FirebaseFirestore.instance
                            .collection("users")
                            .doc(FirebaseAuth.instance.currentUser?.email)
                            .collection("cars")
                            .doc(sellMake)
                            .collection("maintenance");

                          var querySnapshots = await updatingMaintCollection.get();

                          for (var doc in querySnapshots.docs) {
                            // TODO: write function to save mileage of each maintenance item
							int maintMiles = 0;
							

							await doc.reference.update({
                              
                            });
                          }

                          FirebaseFirestore.instance
                              .collection("users")
                              .doc(FirebaseAuth.instance.currentUser
                                  ?.email) //FirebaseAuth.instance.currentUser?.email
                              .collection("cars")
                              .doc(sellNick)
                              .collection("gas")
                              .add({
                                "cost": gasCostController.text,
                                "gallons": gasGallonsController.text,
                                "mileage": newMiles,
                                "type": gasTypeController.text,
                                "timestamp": timestampdate.toDate()
                                
                              })
                              .then((value) =>
                                  print("successfully added document"))
                              .catchError((e) => print(e));

                          FirebaseFirestore.instance
                            .collection("users")
                            .doc(FirebaseAuth.instance.currentUser?.email)
                            .collection("cars")
                            .doc(sellNick)
                            .collection("expenses")
                            .add({
                              "title" : "Fuel Fillup (${gasTypeController.text})",
                              "cost" : gasCostController.text
                            });

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const InspectGas()));
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
