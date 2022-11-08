import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class createCarProfile extends StatefulWidget {
  const createCarProfile({super.key, required this.title});
  final String title;

  @override
  _createCarProfile createState() => _createCarProfile();
}

class _createCarProfile extends State<createCarProfile> {
  TextEditingController carMakeController = TextEditingController();
  TextEditingController carModelController = TextEditingController();
  TextEditingController carModelYearController = TextEditingController();
  TextEditingController carTrimController = TextEditingController();
  TextEditingController carMileageController = TextEditingController();
  TextEditingController carNicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff15aaaff),
              Color(0xFFADF7F2),
            ]),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text(
              'Add a Car',
              style: TextStyle(color: Color.fromARGB(255, 5, 132, 235)),
            ),
            centerTitle: true,
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF15AAAFF),
                      Color(0xFFADF7F2),
                    ]),
              ),
            ),
          ),
          //backgroundColor: Color.fromARGB(255, 150, 206, 232),
          body: Container(
            margin: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              child: Column(children: [
                const Text(
                  "Enter details about your vehicle with this form.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ProfileInfo(hintText: "Make", Controller: carMakeController),
                ProfileInfo(hintText: "Model", Controller: carModelController),
                ProfileInfo(
                    hintText: "Model Year", Controller: carModelYearController),
                ProfileInfo(
                    hintText: "Model Trim", Controller: carTrimController),
                ProfileInfo(
                    hintText: "Mileage", Controller: carMileageController),
                ProfileInfo(
                    hintText: "Car Model", Controller: carModelController),
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
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        child: const Text('Add Vehicle',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                        onPressed: () {
                          print({
                            "title": carMakeController.text,
                            "date": carModelController.text,
                            "cost": carModelYearController.text,
                            "location": carTrimController.text,
                            "notes": carMileageController.text
                          });
                          // FirebaseFirestore.instance
                          // 	.collection("users")
                          // 	.doc(FirebaseAuth.instance.currentUser!.email)
                          // 	.set(
                          // 		{
                          // 			"email": FirebaseAuth.instance.currentUser!.email,
                          // 			"uid": FirebaseAuth.instance.currentUser!.uid
                          // 		}
                          // 	);

                          // print(FirebaseAuth.instance.currentUser!.email);

                          FirebaseFirestore.instance
                              .collection("users")
                              .doc("iftekhar.f.19@gmail.com")
                              .collection("cars")
                              .doc("car-nickname-3")
                              .set({
                                "title": carMakeController.text,
                                "date": carModelController.text,
                                "cost": carModelYearController.text,
                                "location": carTrimController.text,
                                "notes": carMileageController.text
                              })
                              .then((value) =>
                                  print("successfully added document"))
                              .catchError((e) => print(e));
                        })),
              ]),
            ),
          )),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String hintText;
  final TextEditingController Controller;
  const ProfileInfo(
      {super.key, required this.hintText, required this.Controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, right: 40, left: 30),
      child: TextField(
        obscureText: false,
        controller: Controller,
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
