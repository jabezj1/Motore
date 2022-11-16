import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

imageInput(String path, double h, double w) {
	return Image.asset(
		path,
		height: h,
		width: w,
		fit: BoxFit.fill,
	);
}

class Dashboard extends StatelessWidget {
	Dashboard({Key? key}) : super(key: key);

	String? username = FirebaseAuth.instance.currentUser?.displayName;

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				automaticallyImplyLeading: false,
				title: const Text('Dashboard'),
				centerTitle: true,
				elevation: 0,
				flexibleSpace: Container(
					decoration: const BoxDecoration(
						gradient: LinearGradient(
							colors: [
								Color(0xff15aaaff),
								Color(0xFFADF7F2),
							]
						),
					),
				),
			),
			backgroundColor: const Color.fromARGB(255, 255, 255, 255),
			body: SingleChildScrollView(
				child: SafeArea(
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: const <Widget>[

						],
					)
				),
			),
		);
	}
}