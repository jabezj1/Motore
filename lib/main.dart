import 'package:flutter/material.dart';
import 'package:motore/navbar.dart';
import 'package:motore/pages/CarInfo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:motore/screens/authenticate/authenticate.dart';
import 'package:motore/services/auth.dart';

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
    return MaterialApp(
      initialRoute: '/',
      home: AnimatedSplashScreen(
          splash: 'lib/icons/BC_logo.png',
          duration: 3000,
          splashIconSize: 400,
          splashTransition: SplashTransition.fadeTransition,
          nextScreen: NavigationExample()),
    );
  }
}
