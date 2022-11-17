import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
								Color(0xFFADF7F2)
							]
						),
					),
				),
			),
			backgroundColor: const Color.fromARGB(255, 255, 255, 255),
			body: SingleChildScrollView(
				child: SafeArea(
					child: Row(
						children: [
							const Padding(
								padding: EdgeInsets.all(16.0),
								child: Text(
									"Hello,",
									style: TextStyle(
										color: Colors.black,
										fontSize: 30,
										fontWeight: FontWeight.bold
									),
								),
							),
							Text(
								username.toString(),
								style: const TextStyle(
								color: Colors.black,
								fontSize: 30,
								fontWeight: FontWeight.bold,
								),
							)
						]
					)
				),
			),
		);
	}
}

class ShowReminders extends StatelessWidget {
	final String remText;
	final String daysLeft;
	const ShowReminders({super.key, required this.remText, required this.daysLeft});

	@override
	Widget build(BuildContext context) {
		return Container(
			padding: const EdgeInsets.only(bottom: 10, right: 40, left: 30),
			child: Row(
				children: [Text(remText), const SizedBox(width: 15), Text(daysLeft)],
			)
		);
	}
}
