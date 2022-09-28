import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              "History",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                margin: const EdgeInsets.only(top: 1),
                height: 40,
                width: 380,
                color: Color.fromARGB(255, 150, 206, 232),
                // ignore: prefer_const_constructors
                child: Center(
                  child: const Text(
                    "Set a Reminder",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                margin: const EdgeInsets.only(top: 1),
                height: 170,
                width: 380,
                color: Color.fromARGB(255, 150, 206, 232),
                child: Center(
                  child: const Text(
                    "Monthly Expenses",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                margin: const EdgeInsets.only(top: 1),
                height: 170,
                width: 380,
                color: Color.fromARGB(255, 150, 206, 232),
                child: Center(
                  child: const Text(
                    "Oil Changes",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                margin: const EdgeInsets.only(top: 1),
                height: 170,
                width: 380,
                color: Color.fromARGB(255, 150, 206, 232),
                child: Center(
                  child: const Text(
                    "Past Maintenance",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


 /*
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: const [
          Text(
            'History Page',
            style: TextStyle(
                fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 100,
          ),
          CircleAvatar(
            radius: 70,
            child: Icon(Icons.people, size: 120),
          ),
          SizedBox(
            height: 100,
          ),
          Text(
            'History Page Content',
            style: TextStyle(fontSize: 40, color: Colors.black),
          ),
        ],
      ),
    );
    */
