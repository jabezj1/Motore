import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateHistoryEntry extends StatefulWidget {
  const CreateHistoryEntry({super.key, required this.title});
  final String title;

  @override
  StateCreateHistoryEntry createState() => StateCreateHistoryEntry();
}

class StateCreateHistoryEntry extends State<CreateHistoryEntry> {
  TextEditingController historyTitleController = TextEditingController();
  TextEditingController historyDateController = TextEditingController();
  TextEditingController historyCostController = TextEditingController();
  TextEditingController historyLocationController = TextEditingController();
  TextEditingController historyNotesController = TextEditingController();

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
                  "Enter the details of your latest car servicing here.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding:
                      const EdgeInsets.only(bottom: 10, right: 40, left: 30),
                  child: TextField(
                    obscureText: false,
                    controller: historyTitleController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Title'),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(bottom: 10, right: 40, left: 30),
                  child: TextField(
                    obscureText: false,
                    controller: historyDateController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.red)),
                        hintText: 'Date'),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(bottom: 10, right: 40, left: 30),
                  child: TextField(
                    obscureText: false,
                    controller: historyCostController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.red)),
                        hintText: 'Cost'),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(bottom: 10, right: 40, left: 30),
                  child: TextField(
                    obscureText: false,
                    controller: historyLocationController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.red)),
                        hintText: 'Location'),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(bottom: 10, right: 40, left: 30),
                  child: TextField(
                    obscureText: false,
                    controller: historyNotesController,
                    maxLines: null,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.red)),
                      hintText: 'Notes',
                    ),
                  ),
                ),
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
                        child: const Text('Create New History Entry',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                        onPressed: () async {
                          FirebaseFirestore.instance
                              .collection("users")
                              .doc(FirebaseAuth.instance.currentUser!.email)
                              .set({
                            "email": FirebaseAuth.instance.currentUser!.email,
                            "uid": FirebaseAuth.instance.currentUser!.uid
                          });

                          FirebaseFirestore.instance
                              .collection("users")
                              .doc(FirebaseAuth.instance.currentUser!.email)
                              .collection("cars")
                              .doc("car-nickname-3")
                              .collection("history")
                              .add({
                            "title": historyTitleController,
                            "date": historyDateController,
                            "cost": historyCostController,
                            "location": historyLocationController,
                            "notes": historyNotesController
                          });
                        })),
              ]),
            ),
          )),
    );
  }
}
