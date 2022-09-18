import 'package:motore/screens/authenticate/login.dart';
import 'package:flutter/material.dart';
import 'package:motore/screens/authenticate/signup.dart';
import 'package:motore/screens/home/home.dart';
// import 'package:motore/screens/authenticate/signup.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showLogin = true;
  toggleView() {
    setState(() => showLogin = !showLogin);
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return Login(toggleView: toggleView);
    } else {
      return Signup(toggleView: toggleView);
    }
  }
}
