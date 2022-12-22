import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:motore/pages/Dashboard.dart';
import 'package:motore/pages/InspectGas.dart';
import 'package:motore/pages/carSpecCard.dart';
import 'package:motore/navbar.dart';

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
							int newMiles = int.parse(gasMileageController.text); // new milage of the car
							int prevMiles = 0; // preset previous mileage
							int deltaMiles = 0; // preset change in mileage
						  
						  	// save the current mileage of the car
							// by getting it from the car's stats on the database
							FirebaseFirestore.instance
								.collection("users")
								.doc(FirebaseAuth.instance.currentUser?.email)
								.collection("cars")
								.doc(sellNick)
								.get()
								.then((DocumentSnapshot documentSnapshot) {
									prevMiles = documentSnapshot.get("miles");
								});

							if (newMiles > prevMiles) {
								// PROCESS: update all maintenance mileage intervals
								// 			to reflect change in mileage

								// calculate the change in mileage
								deltaMiles = newMiles - prevMiles;

								// create a collection reference to the maintenance numbers of the car
								var updatingMaintCollection = FirebaseFirestore.instance
									.collection("users")
									.doc(FirebaseAuth.instance.currentUser?.email)
									.collection("cars")
									.doc(sellMake)
									.collection("maintenance");
								
								// get all the documents in the collection 
								var querySnapshots = await updatingMaintCollection.get();

								// for every document in the collection: 
								for (var doc in querySnapshots.docs) {
									int maintMiles = doc["miles"]; // save the miles left on the maintenance
									int newMaintMiles = maintMiles - deltaMiles; // calculate the new miles left for the maintenance

									// update the maintenance miles remaining
									await doc.reference.update({
										"miles" : newMaintMiles 
									});
								}

								// change mileage of car to what the new indicated mileage is
								FirebaseFirestore.instance
									.collection("users")
									.doc(FirebaseAuth.instance.currentUser?.email)
									.collection("cars")
									.doc(sellNick)
									.update({
										"miles" : newMiles
									});
					
								FirebaseFirestore.instance
									.collection("users")
									.doc(FirebaseAuth.instance.currentUser?.email) //FirebaseAuth.instance.currentUser?.email
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
							}
							Navigator.push(context, MaterialPageRoute(builder: (context) => const Navigation()));
                        }
					)
				),
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
