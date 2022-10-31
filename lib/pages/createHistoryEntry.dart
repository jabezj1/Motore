import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:motore/pages/History.dart';

class createHistoryEntry extends StatefulWidget {
	const createHistoryEntry({super.key, required this.title});
	final String title;

	@override
	_createHistoryEntry createState() => _createHistoryEntry();
}

class _createHistoryEntry extends State<createHistoryEntry> {
	TextEditingController passController = TextEditingController();
	TextEditingController historyTitleController = TextEditingController();
	TextEditingController historyDateController = TextEditingController();
	TextEditingController historyCostController = TextEditingController();
	TextEditingController historyLocationController = TextEditingController();
	TextEditingController historyNotesController = TextEditingController();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Center(
				child: Container(
					width: 500,
					child: Column(children: [
						Container(
							padding: const EdgeInsets.all(10),
							child: TextField(
								obscureText: false,
								controller: historyTitleController,
								decoration: const InputDecoration(
									border: OutlineInputBorder(
										borderSide: BorderSide(color: Colors.red)
									),
									labelText: 'Title',
								),
							),
						),
						const Text(
							'\n',
						),
						Container(
							padding: const EdgeInsets.all(10),
							child: TextField(
								obscureText: false,
								controller: historyDateController,
								decoration: const InputDecoration(
									border: OutlineInputBorder(
										borderSide: BorderSide(color: Colors.red)
									),
									labelText: 'Date',
								),
							),
						),
						const Text(
							'\n',
						),
						Container(
							padding: const EdgeInsets.all(10),
							child: TextField(
								obscureText: false,
								controller: historyCostController,
								decoration: const InputDecoration(
									border: OutlineInputBorder(
										borderSide: BorderSide(color: Colors.red)
									),
									labelText: 'Cost',
								),
							),
						),
						const Text(
							'\n',
						),
						Container(
							padding: const EdgeInsets.all(10),
							child: TextField(
								obscureText: false,
								controller: historyLocationController,
								decoration: const InputDecoration(
									border: OutlineInputBorder(
										borderSide: BorderSide(color: Colors.red)
									),
									labelText: 'Location',
								),
							),
						),
						const Text(
							'\n'
						),
						Container(
							padding: const EdgeInsets.all(10),
							child: TextField(
								obscureText: false,
								controller: historyNotesController,
								decoration: const InputDecoration(
									border: OutlineInputBorder(
										borderSide: BorderSide(color: Colors.red)
									),
									labelText: 'Notes',
								),
							),
						),
						Container(
							height: 50,
							width: 300,
							padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
							child: ElevatedButton(
								style: ElevatedButton.styleFrom(
									primary: Color.fromARGB(255, 228, 218, 132)),
								child: const Text('Create New History Entry',
									style: TextStyle(fontSize: 20, color: Colors.black)),
								onPressed: () async {
									FirebaseFirestore.instance.collection("priv-PW").add({
										"email": FirebaseAuth.instance.currentUser?.email,
										"password": passController.text
									}).then((value) {
										Navigator.push(
											context,
											MaterialPageRoute(
												builder: (context) => History(),
											)
										);
									}).catchError((error) => print("Failed to save secret notes password! Error: $error"));
								},
							)
						)
					]),
          		),
        	)
		);
  	}
}