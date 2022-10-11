import 'package:flutter/material.dart';

class HistorySecond extends StatelessWidget {
  const HistorySecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: const [
          SizedBox(
            height: 45,
          ),
          Text(
            'Work in progress',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 100,
          ),
          // CircleAvatar(
          //   radius: 70,
          //   child: Icon(Icons.people, size: 120),
          // ),
          SizedBox(
            height: 100,
          ),
          Text(
            'We apologize for any the inconvenience',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
