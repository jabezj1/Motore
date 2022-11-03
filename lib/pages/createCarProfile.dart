import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class createCarProfile extends StatefulWidget {
	const createCarProfile({super.key, required this.title});
	final String title;

	@override
	_createCarProfile createState() => _createCarProfile();
}

class _createCarProfile extends State<createCarProfile> {
	TextEditingController carMakeController = TextEditingController();
	TextEditingController carModelController = TextEditingController();
	TextEditingController carModelYearController = TextEditingController();
	TextEditingController carTrimController = TextEditingController();
	TextEditingController carMileageController = TextEditingController();
	TextEditingController carNicknameController = TextEditingController();

	@override
	Widget build(BuildContext context) {
		return Container(
		decoration: const BoxDecoration(
			gradient: LinearGradient(
				begin: Alignment.bottomLeft,
				end: Alignment.bottomRight,
				colors: [
					Color(0xff15aaaff),
					Color(0xFFADF7F2),
				]
			),
		),
		child: Scaffold(
			backgroundColor: Colors.transparent,
			appBar: AppBar(
				title: const Text(
					'Add a Car',
					style: TextStyle(
						color: Color.fromARGB(255, 5, 132, 235)
					),
				),
				centerTitle: true,
				elevation: 0,
				flexibleSpace: Container(
					decoration: const BoxDecoration(
						gradient: LinearGradient(
							begin: Alignment.bottomLeft,
							end: Alignment.bottomRight,
							colors: [
								Color(0xFF15AAAFF),
								Color(0xFFADF7F2),
							]
						),
					),
				),
			),
			//backgroundColor: Color.fromARGB(255, 150, 206, 232),
			body: Container(
					margin: const EdgeInsets.only(top: 20),
					child: SingleChildScrollView(
						child: Column(
							children: [
								const Text(
									"Enter details about your vehicle with this form.",
									textAlign: TextAlign.center,
									style: TextStyle(
										fontSize: 15,
										fontWeight: FontWeight.bold,
									),
								),
								const SizedBox(
									height: 20,
								),
								Container(
									padding:
										const EdgeInsets.only(bottom: 10, right: 40, left: 30),
									child: TextField(
										obscureText: false,
										controller: carMakeController,
										decoration: InputDecoration(
											border: OutlineInputBorder(
												borderRadius: BorderRadius.circular(30),
											),
											fillColor: Colors.white,
											filled: true,
											hintText: 'Make'
										),
									),
								),
								Container(
									padding:
										const EdgeInsets.only(bottom: 10, right: 40, left: 30),
									child: TextField(
										obscureText: false,
										controller: carModelController,
										decoration: InputDecoration(
											filled: true,
											fillColor: Colors.white,
											border: OutlineInputBorder(
												borderRadius: BorderRadius.circular(30),
												borderSide: const BorderSide(color: Colors.red)
											),
											hintText: 'Model'
										),
									),
								),
								Container(
									padding:
										const EdgeInsets.only(bottom: 10, right: 40, left: 30),
									child: TextField(
										obscureText: false,
										controller: carModelYearController,
										decoration: InputDecoration(
											filled: true,
											fillColor: Colors.white,
											border: OutlineInputBorder(
												borderRadius: BorderRadius.circular(30),
												borderSide: const BorderSide(color: Colors.red)
											),
											hintText: 'Model Year'
										),
									),
								),
								Container(
									padding: const EdgeInsets.only(bottom: 10, right: 40, left: 30),
									child: TextField(
										obscureText: false,
										controller: carTrimController,
										decoration: InputDecoration(
											filled: true,
											fillColor: Colors.white,
											border: OutlineInputBorder(
												borderRadius: BorderRadius.circular(30),
												borderSide: const BorderSide(color: Colors.red)
											),
											hintText: 'Model Trim'
										),
									),
								),
								Container(
									padding: const EdgeInsets.only(bottom: 10, right: 40, left: 30),
									child: TextField(
										obscureText: false,
										controller: carMileageController,
										maxLines: null,
										decoration: InputDecoration(
											filled: true,
											fillColor: Colors.white,
											border: OutlineInputBorder(
												borderRadius: BorderRadius.circular(30),
												borderSide: const BorderSide(color: Colors.red)
											),
											hintText: 'Mileage',
										),
									),
								),
								Container(
									padding: const EdgeInsets.only(bottom: 10, right: 40, left: 30),
									child: TextField(
										obscureText: false,
										controller: carNicknameController,
										maxLines: null,
										decoration: InputDecoration(
											filled: true,
											fillColor: Colors.white,
											border: OutlineInputBorder(
												borderRadius: BorderRadius.circular(30),
												borderSide: const BorderSide(color: Colors.red)
											),
											hintText: 'Car Nickname',
										),
									),
								),
								const SizedBox(
									height: 30,
								),
								Container(
									height: 50,
									width: 280,
									padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
									child: ElevatedButton(
										style: ElevatedButton.styleFrom(
											primary: Colors.blue,
											side: const BorderSide(width: 4.0),
											shape: RoundedRectangleBorder(
												borderRadius: BorderRadius.circular(30)
											),
										),
										child: const Text(
											'Add Vehicle',
											style: TextStyle(fontSize: 20, color: Colors.black)
										),
										onPressed: () async {
											FirebaseFirestore.instance
												.collection("users")
												.doc(FirebaseAuth.instance.currentUser!.email)
												.set(
													{
														"email": FirebaseAuth.instance.currentUser!.email,
														"uid": FirebaseAuth.instance.currentUser!.uid
													}
												);

											FirebaseFirestore.instance
												.collection("users")
												.doc(FirebaseAuth.instance.currentUser!.email)
												.collection("cars")
												.doc("car-nickname-3")
												.collection("history")
												.add(
													{
														"title": carMakeController,
														"date": carModelController,
														"cost": carModelYearController,
														"location": carTrimController,
														"notes": carMileageController
													}
												);
										}
									)
								),
							]
						),
					),
				)
			),
		);
	}
}
