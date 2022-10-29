import 'package:flutter/material.dart';

class Dashboard2 extends StatelessWidget {
  const Dashboard2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: const [
          Text(
            'History Page',
            style: TextStyle(
                fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
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
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
