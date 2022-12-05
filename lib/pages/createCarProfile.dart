import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motore/pages/profile.dart';

late String curr_car;

class CreateCarProfile extends StatefulWidget {
	const CreateCarProfile({super.key, required this.title});
	final String title;

	@override
	StateCreateCarProfile createState() => StateCreateCarProfile();
}

class StateCreateCarProfile extends State<CreateCarProfile> {
	TextEditingController carMakeController = TextEditingController();
	TextEditingController carModelController = TextEditingController();
	TextEditingController carModelYearController = TextEditingController();
	TextEditingController carTrimController = TextEditingController();
	TextEditingController carMileageController = TextEditingController();
	TextEditingController carNicknameController = TextEditingController();

	//todo consolidate query to cars
	CollectionReference users = FirebaseFirestore.instance.collection("users");

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
						style: TextStyle(color: Color.fromARGB(255, 5, 132, 235)),
					),
					centerTitle: true,
					elevation: 0,
					flexibleSpace: Container(
						decoration: const BoxDecoration(
							gradient: LinearGradient(
								begin: Alignment.bottomLeft,
								end: Alignment.bottomRight,
								colors: [Color(0xFF15AAAFF), Color(0xFFADF7F2)]
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
								const SizedBox(height: 20),
								EnterCarInfo(hintText: "Make", controller: carMakeController),
								EnterCarInfo(hintText: "Model", controller: carModelController),
								EnterCarInfo(hintText: "Model Year", controller: carModelYearController),
								EnterCarInfo(hintText: "Model Trim", controller: carTrimController),
								EnterCarInfo(hintText: "Mileage", controller: carMileageController),
								EnterCarInfo(hintText: "Car Nickname", controller: carNicknameController),
								const SizedBox(height: 30),
								Container(
									height: 50,
									width: 280,
									padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
									child: ElevatedButton(
										style: ElevatedButton.styleFrom(
											backgroundColor: Colors.blue,
											side: const BorderSide(width: 4.0),
											shape: RoundedRectangleBorder(
												borderRadius: BorderRadius.circular(30)
											),
										),
										child: const Text(
											'Add Vehicle',
											style: TextStyle(fontSize: 20, color: Colors.black)
										),
										onPressed: () {
											users
												.doc(FirebaseAuth.instance.currentUser?.email)
												.collection("cars")
												.add({
													"make": carMakeController.text,
													"model": carModelController.text,
													"year": carModelYearController.text,
													"trim": carTrimController.text,
													"miles": carMileageController.text,
													"nickname": carNicknameController.text
												})
											.then((value) => {
												curr_car = value.id
													// users
													//         .doc("iftekhar.f.19@gmail.com")
													//         .collection("cars")
													//         .doc(value.id)
													//         .collection("history")
													//         .add({
													//       "Title": "",
													//       "Date": DateTime.now(),
													//       "Cost": "",
													//       "Location": "",
													//       "Notes": ""
											}).catchError((e) => print(e));
											
											Navigator.push(
												context, 
												MaterialPageRoute(
													builder: (context) => const Profile()
												)
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

class EnterCarInfo extends StatelessWidget {
	final String hintText;
	final TextEditingController controller;
	const EnterCarInfo({super.key, required this.hintText, required this.controller});

	@override
	Widget build(BuildContext context) {
		return Container(
			padding: const EdgeInsets.only(bottom: 10, right: 40, left: 30),
			child: TextField(
				obscureText: false,
				controller: controller,
				maxLines: null,
				decoration: InputDecoration(
					filled: true,
					fillColor: Colors.white,
					border: OutlineInputBorder(
						borderRadius: BorderRadius.circular(30),
						borderSide: const BorderSide(color: Colors.red)
					),
					hintText: hintText,
				),
			),
		);
	}
}
