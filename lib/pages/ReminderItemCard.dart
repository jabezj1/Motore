import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motore/pages/ReminderItem.dart';

class ReminderItemCard extends StatelessWidget {
  final ReminderItem _reminder;

  ReminderItemCard(this._reminder);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: Colors.blue, width: 5)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: Text(
                          _reminder.title.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
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
                        onPressed: () async {},
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        // style: ElevatedButton.styleFrom(
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 10.0, vertical: 3.0),
                        //     backgroundColor: Colors.red,
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(50.0))),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
