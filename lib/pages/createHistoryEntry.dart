import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:motore/pages/History.dart';
import 'package:motore/pages/history_second.dart';

class createHistoryEntry extends StatefulWidget {
  const createHistoryEntry({super.key, required this.title});
  final String title;

  @override
  _createHistoryEntry createState() => _createHistoryEntry();
}

class _createHistoryEntry extends State<createHistoryEntry> {
  TextEditingController passController = TextEditingController();
  TextEditingController historyTitleController = TextEditingController();
  TextEditingController historyDateController = TextEditingController();
  TextEditingController historyCostController = TextEditingController();
  TextEditingController historyLocationController = TextEditingController();
  TextEditingController historyNotesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF15AAAFF),
              Color(0xFFADF7F2),
            ]),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
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
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //       colors: [
            //         Color(0xFF15AAAFF),
            //         Color(0xFFADF7F2),
            //       ]),
            // ),
            //margin: const EdgeInsets.only(top: 30),
            child: SingleChildScrollView(
              //width: 500,
              child: Column(children: [
                Text(
                  "Enter the details of your latest car servicing or maintenance here",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                // Container(
                //   padding: const EdgeInsets.all(10),
                //   child: Text(
                //     'Add 2 History',
                //     style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                //   ),
                // ),
                Container(
                  padding:
                      const EdgeInsets.only(bottom: 10, right: 40, left: 30),
                  child: TextField(
                    obscureText: false,
                    controller: historyTitleController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          //borderSide: BorderSide(width: 0, style: BorderStyle.none),
                          //borderSide: BorderSide(color: Colors.red)),
                          //labelText: 'Title',
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Title'),
                  ),
                ),
                // const Text(
                //   '\n',
                // ),
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
                            borderSide: BorderSide(color: Colors.red)),
                        // labelText: 'Date',
                        hintText: 'Date'),
                  ),
                ),
                // const Text(
                //   '\n',
                // ),
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
                          borderSide: BorderSide(color: Colors.red)),
                      //labelText: 'Cost',
                      hintText: 'Cost',
                    ),
                  ),
                ),
                // const Text(
                //   '\n',
                // ),
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
                          borderSide: BorderSide(color: Colors.red)),
                      // labelText: 'Location',
                      hintText: 'Location',
                    ),
                  ),
                ),
                // const Text('\n'),
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
                          borderSide: BorderSide(color: Colors.red)),
                      //labelText: 'Notes',
                      hintText: 'Notes',
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 50,
                    width: 280,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        side: BorderSide(width: 4.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: const Text('Create New History Entry',
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      onPressed: () async {
                        FirebaseFirestore.instance.collection("priv-PW").add({
                          "email": FirebaseAuth.instance.currentUser?.email,
                          "password": passController.text
                        }).then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => History(),
                              ));
                        }).catchError((error) => print(
                            "Failed to save secret notes password! Error: $error"));
                      },
                    )),
                // SizedBox(
                //   height: 220,
                // ),
              ]),
            ),
          )),
    );
  }
}
