import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageName extends StatelessWidget {
  const PageName(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.lato(
          textStyle: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ));
  }
}
