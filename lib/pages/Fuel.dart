import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motore/services/auth.dart';

class Fuel extends StatelessWidget {
  // final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          ElevatedButton.icon(
              onPressed: () async {
                AuthService().signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Log Out'))
        ],
      ),
    );
  }
}
