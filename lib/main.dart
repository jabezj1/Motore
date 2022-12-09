import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motore/services/auth.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:motore/screens/introPage.dart';
import 'package:provider/provider.dart';

import 'services/geolocator_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final locatorService = GeoLocatorService();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => locatorService.getLocation(),
      initialData: null,
      child: MaterialApp(
        initialRoute: '/',
        theme: ThemeData(
            fontFamily: GoogleFonts.roboto().fontFamily,
            primarySwatch: Colors.blue,
            inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.redAccent),
            )),
        home: AnimatedSplashScreen(
            splash: 'lib/icons/BC_logo.png',
            duration: 3000,
            splashIconSize: 400,
            splashTransition: SplashTransition.fadeTransition,
            nextScreen: AuthService().handleAuthState()),
      ),
    );
  }
}
