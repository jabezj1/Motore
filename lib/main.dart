import 'package:flutter/material.dart';
import 'package:motore/models/myuser.dart';
import 'package:motore/navbar.dart';
import 'package:motore/pages/CarInfo.dart';
import 'package:motore/pages/history_fourth.dart';
import 'package:motore/pages/createHistoryEntry.dart';
import 'package:motore/pages/history_second.dart';
import 'package:motore/pages/History.dart';
import 'package:motore/screens/authenticate/login.dart';
import 'package:motore/screens/introPage.dart';
import 'package:motore/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:motore/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:motore/splash.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

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
      // routes: {
      //   '/': (context) => HistorySecond(),
      // },
      home: AnimatedSplashScreen(
          // splash: 'lib/icons/BC_logo.png',
          splash: 'lib/icons/BC_logo.png',
          duration: 3000,
          splashIconSize: 400,
          // backgroundColor: Colors.black,
          splashTransition: SplashTransition.fadeTransition,
          // nextScreen: AuthService().handleAuthState()),
          nextScreen: CarInfo()),
    );
  }
}
