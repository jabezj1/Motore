import 'package:flutter/material.dart';
import 'package:motore/models/myuser.dart';
import 'package:motore/screens/authenticate/login.dart';
import 'package:motore/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:motore/services/auth.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      catchError: (_, __) => null,
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
