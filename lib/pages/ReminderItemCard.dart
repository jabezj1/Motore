import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:motore/pages/ReminderItem.dart';
import 'package:motore/pages/carSpecCard.dart';

class ReminderItemCard extends StatelessWidget {
  final ReminderItem _reminder;

  ReminderItemCard(this._reminder);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            elevation: 20,
            color: Colors.white.withOpacity(0.5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            // side: BorderSide(color: Colors.blue, width: 5)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: AutoSizeText(
                            _reminder.title.toString().toUpperCase(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("Days left:"),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                            decoration: BoxDecoration(
                                // color: Colors.blue,
                                border: Border.all(
                                  color: Colors.red.shade400,
                                  width: 2,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              _reminder.days.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                      IconButton(
                        onPressed: () async {
                          FirebaseFirestore.instance
                            .collection("users")
                            .doc(FirebaseAuth.instance.currentUser?.email)
                            .collection("cars")
                            .doc(sellMake)
                            .collection("reminders")
                            .where("title", isEqualTo: _reminder.title.toString())
                            .get();
                            
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
