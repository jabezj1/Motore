import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motore/pages/ReminderItem.dart';
import 'package:motore/pages/ReminderItemCard.dart';
import 'package:motore/pages/createCarProfile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motore/pages/MaintenanceItem.dart';
import 'package:motore/pages/MaintenanceItemCard.dart';

List<Object> reminderList = [];
List<Object> maintenanceList = [];

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

	@override
	State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? username = FirebaseAuth
      .instance.currentUser?.displayName; // name of the authenticated user
  late String? carNick =
      ""; // nickname of the car the user picked in Profile page

<<<<<<< HEAD
  @override
  Widget build(BuildContext context) {
    var docSnapshot = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.email)
        .collection("cars")
        .doc(
            curr_car) // curr_car references the current car selected in profile page
        .get()
        .then((DocumentSnapshot ds) {
      // creates a document snapshot named "ds"
      carNick =
          ds['nickname']; // only retrieves the nickname field from the document
    });

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Dashboard'),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xff15aaaff), Color(0xFFADF7F2)]),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Row(// This row prints "Hello, <Name of authenticated user>"
                children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Hello,",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
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
            ]),
            Column(
              children: [
                const SizedBox(height: 25),
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                        "lib/icons/car2.png"), // displays picture of selected car from Profile
                  )),
                ),
                const SizedBox(height: 5),
                Text(carNick
                        .toString() // displays car nickname under picture of car
                    )
              ],
            )
          ],
        )),
      ),
    );
  }
=======
	@override
	void didChangeDependencies() {
		super.didChangeDependencies();
		getCarRemindersList();
		getPreventativeMaintenanceList();
	}

	@override
	Widget build(BuildContext context) {
		FirebaseFirestore.instance
			.collection("users")
			.doc("iftekhar.f.19@gmail.com")
			.collection("cars")
			.doc("NAPm33gq0rcaKIaZGAA3") // curr_car references the current car selected in profile page
			.get()
			.then((DocumentSnapshot ds) {
				// creates a document snapshot named "ds"
				carNick = ds['nickname']; // only retrieves the nickname field from the document
			})
		;

		return Scaffold(
			appBar: AppBar(
				automaticallyImplyLeading: false,
				title: const Text('Dashboard'),
				centerTitle: true,
				elevation: 0,
				flexibleSpace: Container(
				decoration: const BoxDecoration(
					gradient:
						LinearGradient(
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
							const SizedBox(height: 25),
							Text(
								"Hello, $username",
								style: const TextStyle(
									color: Colors.black,
									fontSize: 30,
									fontWeight: FontWeight.bold
								)
							),
							// Row(
							// 	children: [
							// 		const Padding(
							// 			padding: EdgeInsets.all(16.0),
							// 			child: Text(
							// 			"Hello,",
							// 			style: TextStyle(
							// 				color: Colors.black,
							// 				fontSize: 30,
							// 				fontWeight: FontWeight.bold),
							// 			),
							// 		),
							// 		Text(
							// 			username.toString(),
							// 			style: const TextStyle(
							// 			color: Colors.black,
							// 			fontSize: 30,
							// 			fontWeight: FontWeight.bold,
							// 			),
							// 		)
							// 	]
							// ),
							Column(
								children: [
									Container(
										height: MediaQuery.of(context).size.height / 6,
										width: MediaQuery.of(context).size.width / 1.5,
										decoration: const BoxDecoration(
											image: DecorationImage(
												image: AssetImage("lib/icons/car2.png"), // displays picture of selected car from Profile
											)
										),
									),
									const SizedBox(height: 5),
									Container(
										padding: const EdgeInsets.all(8),
										width: MediaQuery.of(context).size.width,
										decoration: const BoxDecoration(
											gradient: LinearGradient(
												colors: [Colors.white, Colors.red],
												begin: Alignment.topCenter,
												end: Alignment.bottomCenter
											),
										),
										child: Text(
											carNick.toString(),
											textAlign: TextAlign.center,
											style: GoogleFonts.getFont(
												'Permanent Marker',
												color: Colors.black,
												fontSize: 36,
												fontWeight: FontWeight.w700,
												fontStyle: FontStyle.italic,
											),
										),
									),
								],
							),
							SafeArea(
								child: Column(
									children: [
										Container(
											padding: const EdgeInsets.only(top: 10),
											decoration: const BoxDecoration(
												gradient: LinearGradient(
													colors: [
														Colors.red,
														Color(0xff15aaaff),
													], 
													begin: Alignment.topCenter, 
													end: Alignment.bottomCenter
												),
											),
											child: Column(
												children: [
													const Text(
														"Upcoming Maintenance",
														style: TextStyle(
															color: Colors.black,
															fontSize: 25,
															fontWeight: FontWeight.bold
														),
													),
													Padding(
														padding: const EdgeInsets.all(8.0),
														child: Container(
															decoration: BoxDecoration(
																borderRadius: BorderRadius.circular(30),
															),
															child: ListView.builder(
																shrinkWrap: true,
																physics: const BouncingScrollPhysics(),
																itemCount: maintenanceList.length,
																itemBuilder: (
																	(context, index) {
																		return MaintenanceItemCard(
																			maintenanceList[index] as MaintenanceItem
																		);
																	}
																)
															),
														),
													),
												],
											),
										),
									],
								)
							),
							SafeArea(
								child: Column(
									children: [
										Container(
											padding: const EdgeInsets.only(top: 10),
											decoration: const BoxDecoration(
												gradient: LinearGradient(
													colors: [
														Color(0xff15aaaff),
														Colors.white,
													], 
													begin: Alignment.topCenter, 
													end: Alignment.bottomCenter
												),
											),
											child: Column(
												children: [
													const Text(
														"To-Do List",
														style: TextStyle(
															color: Colors.black,
															fontSize: 25,
															fontWeight: FontWeight.bold
														),
													),
													Padding(
														padding: const EdgeInsets.all(8.0),
														child: Container(
															decoration: BoxDecoration(
																borderRadius: BorderRadius.circular(30),
															),
															child: ListView.builder(
																shrinkWrap: true,
																physics: const BouncingScrollPhysics(),
																itemCount: reminderList.length,
																itemBuilder: (
																	(context, index) {
																		return ReminderItemCard(
																			reminderList[index] as ReminderItem
																		);
																	}
																)
															),
														),
													),
												],
											),
										),
									],
								)
							)
						],
					)
				),
			),
		);
	}

	Future getPreventativeMaintenanceList() async {
		var data = await FirebaseFirestore.instance
			.collection("users")
			.doc("iftekhar.f.19@gmail.com") // emailAdd
			.collection("cars")
			.doc("NAPm33gq0rcaKIaZGAA3")
			.collection("maintenance")
			.orderBy("miles", descending: false)
			.get()
		;

		setState(() {
			maintenanceList = List.from(data.docs.map((doc) => MaintenanceItem.fromSnapshot(doc)));
		});
	}

	Future getCarRemindersList() async {
		var data = await FirebaseFirestore.instance
			.collection("users")
			.doc("iftekhar.f.19@gmail.com") // emailAdd
			.collection("cars")
			.doc("NAPm33gq0rcaKIaZGAA3") // replace with curr_car
			.collection("reminders")
			.orderBy("days", descending: false)
			.get()
		;

		setState(() {
		reminderList =
			List.from(data.docs.map((doc) => ReminderItem.fromSnapshot(doc)));
		});
	}

>>>>>>> 053e2d98845526a68825c2870065206f4b4fdb57
}

class ShowReminders extends StatelessWidget {
  final String remText;
  final String daysLeft;
  const ShowReminders(
      {super.key, required this.remText, required this.daysLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
<<<<<<< HEAD
        padding: const EdgeInsets.only(bottom: 10, right: 40, left: 30),
        child: Row(
          children: [Text(remText), const SizedBox(width: 15), Text(daysLeft)],
        ));
  }
}
=======
        // color: Colors.pink,
        padding: const EdgeInsets.only(bottom: 10, right: 40, left: 30),
        child: Container(
          child: Row(
            children: [
              Text(
                remText,
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              const SizedBox(width: 15),
              Text(
                daysLeft,
                textAlign: TextAlign.left,
              )
            ],
          ),
        )
     );
  }
}
>>>>>>> 053e2d98845526a68825c2870065206f4b4fdb57
