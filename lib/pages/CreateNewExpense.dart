import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:motore/navbar.dart';
import 'package:motore/pages/Dashboard.dart';
import 'package:motore/pages/History.dart';
import 'package:motore/pages/InspectExpenses.dart';
import 'package:motore/pages/InspectPastMaintenance.dart';
import 'package:motore/pages/createCarProfile.dart';

class CreateNewExpense extends StatefulWidget {
  const CreateNewExpense({super.key, required this.title});
  final String title;

  @override
  StateCreateNewExpense createState() => StateCreateNewExpense();
}

class StateCreateNewExpense extends State<CreateNewExpense> {
  TextEditingController title = TextEditingController();
  TextEditingController cost = TextEditingController();
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
                  "Enter the details of your latest expense.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                EnterHistoryInfo(
                    hintText: 'What did you buy?', controller: title),
                EnterHistoryInfo(
                    hintText: 'How much did you spend?', controller: cost),
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
                        child: const Text('Record Expense',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                        onPressed: () async {                          
                          FirebaseFirestore.instance
                              .collection("users")
                              .doc(FirebaseAuth.instance.currentUser
                                  ?.email) //FirebaseAuth.instance.currentUser?.email
                              .collection("cars")
                              .doc(sellNick)
                              .collection("expenses")
                              .add({
                                "title": title.text,
                                "cost": cost.text,
                                "timestamp": timestampdate
                              })
                              .then((value) =>
                                  print("successfully added Expense"))
                              .catchError((e) => print(e));
                          index = 7;
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