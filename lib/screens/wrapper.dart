import 'package:flutter/material.dart';
import 'package:motore/models/myuser.dart';
import 'package:motore/screens/authenticate/authenticate.dart';
import 'package:motore/screens/authenticate/login.dart';
import 'package:motore/screens/authenticate/signup.dart';
import 'package:motore/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    // print(user);

    //return home or authenticade widget
    // return Authenticate();

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
