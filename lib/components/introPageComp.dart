import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LottieComp extends StatelessWidget {
	const LottieComp(this.lottiePath, {super.key});
	final String lottiePath;
	@override
	Widget build(BuildContext context) {
		return SizedBox(
			width: 300,
			height: 300,
			child: Lottie.network(lottiePath)
		);
	}
}

class IntroPara extends StatelessWidget {
	const IntroPara(this.text, {super.key});
	final String text;
	@override
	Widget build(BuildContext context) {
		return Text(text,
			maxLines: 3,
			overflow: TextOverflow.ellipsis,
			style: GoogleFonts.lato(
				textStyle: const TextStyle(
					fontSize: 40.0,
					fontWeight: FontWeight.bold,
					color: Colors.white,
					fontStyle: FontStyle.italic,
				)
			)
		);
	}
}
