import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motore/pages/ReminderItem.dart';
import 'package:motore/pages/ReminderItemCard.dart';
import 'package:motore/pages/createCarProfile.dart';

class Dashboard extends StatefulWidget {
	Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
	String? username = FirebaseAuth.instance.currentUser?.displayName; // name of the authenticated user
	String? emailAdd = FirebaseAuth.instance.currentUser?.email; // email of the authenticated user
	late String? carNick = ""; // nickname of the car the user picked in Profile page

	List<Object> _reminderList = [];

	@override
	void didChangeDependencies() {
		super.didChangeDependencies();
		getCarRemindersList();
	}

	@override
	Widget build(BuildContext context) {

		var docSnapshot = FirebaseFirestore.instance
		.collection("users")
		.doc(emailAdd)
		.collection("cars")
		.doc("NAPm33gq0rcaKIaZGAA3") // curr_car references the current car selected in profile page
		.get()
		.then((DocumentSnapshot ds) { // creates a document snapshot named "ds"
			carNick = ds['nickname']; // only retrieves the nickname field from the document
		});

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
					child: Column(
						children: [
							Row( // This row prints "Hello, <Name of authenticated user>"
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
							),
							Column(
								children: [
									const SizedBox(height: 25),
									Container(
										decoration: const BoxDecoration(
											image: DecorationImage(
												image: AssetImage("lib/icons/car2.png"), // displays picture of selected car from Profile
											)
										),	
									),
									const SizedBox(height: 5),
									Text(
										carNick.toString() // displays car nickname under picture of car
									),
								],
							),
							// this is where the list of reminders will show
							const Text(
								"To-Do List",
								style: TextStyle(
									color: Colors.black,
									fontSize: 25,
									fontWeight: FontWeight.bold
								),
						  	),
							SafeArea(
								child: ListView.builder(
									itemCount: _reminderList.length,
									itemBuilder: ((context, index) {
										return ReminderItemCard(_reminderList[index] as ReminderItem);
									})
								)
							)
						],
					)
				),
			),
		);
	}

	Future getCarRemindersList() async {
		var data = await FirebaseFirestore.instance
			.collection("users")
			.doc(emailAdd)
			.collection("cars")
			.doc("NAPm33gq0rcaKIaZGAA3") // replace with curr_car
			.collection("reminders")
			.orderBy("days", descending: false)
			.get()
		;

		setState(() {
			_reminderList = List.from(
				data.docs.map(
					(doc) => ReminderItem.fromSnapshot(doc)
				)
			);
		});
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
				children: [
					Text(remText), 
					const SizedBox(width: 15), 
					Text(daysLeft)
				],
			)
		);
	}
}
