import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:motore/services/auth.dart';
import 'package:motore/screens/authenticate/login.dart';

class lottieComp extends StatelessWidget {
  const lottieComp(this.lottiePath);
  final String lottiePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: Lottie.network(lottiePath),
    );
  }
}

class introPara extends StatelessWidget {
  const introPara(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(text,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.lato(
                textStyle: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ))));
  }
}
