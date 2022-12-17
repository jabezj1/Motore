import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motore/main.dart';
import 'package:motore/pages/CarInfo.dart';
import 'package:motore/pages/ReminderItem.dart';
import 'package:motore/pages/ReminderItemCard.dart';
import 'package:motore/pages/carMakes.dart';
import 'package:motore/pages/carModel.dart';
import 'package:motore/pages/carSpecCard.dart';
import 'package:motore/pages/createCarProfile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motore/pages/MaintenanceItem.dart';
import 'package:motore/pages/MaintenanceItemCard.dart';
import 'package:motore/pages/createMaintenanceHistory.dart';
import 'package:motore/pages/createNewMaintenance.dart';
import 'package:motore/pages/createToDo.dart';

String sellNick = " ";
List<Object> reminderList = [];
List<Object> maintenanceList = [];

class Dashboard extends StatefulWidget {
	Dashboard({Key? key}) : super(key: key);

	@override
	State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
	String? username = FirebaseAuth.instance.currentUser?.displayName; // name of the authenticated user
	String? emailAdd = FirebaseAuth.instance.currentUser?.email; // email of the authenticated user
	String carNick = sellNick; // nickname of the car the user picked in Profile page
	@override
	void didChangeDependencies() {
		super.didChangeDependencies();
		getLatestCarData();
    	getPreventativeMaintenanceList();
		getCarRemindersList();
	}

	@override
	Widget build(BuildContext context) {
		return DecoratedBox(
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
			child: Scaffold(
				extendBodyBehindAppBar: true,
				backgroundColor: Colors.transparent,
				body: SingleChildScrollView(
				child: Container(
					child: SafeArea(
                		child: Column(
              				children: [
                				const SizedBox(height: 25),
                					Text(
                  						"Hello, $username",
										style: GoogleFonts.josefinSans(
											fontSize: 30, 
											fontWeight: FontWeight.bold
										),
                					),
									Column(
									children: [
										Container(
											height: MediaQuery.of(context).size.height / 3,
											width: MediaQuery.of(context).size.width / 0.5,
											decoration: BoxDecoration(
												image: DecorationImage(
													image: NetworkImage(
														"https://cdn-01.imagin.studio/getImage?customer=usmotore&make=$sellMake&modelFamily=$sellModel",
													), // displays picture of selected car from Profile
												)
											),
										),
                    					Container(
                      						padding: const EdgeInsets.all(8),
											width: MediaQuery.of(context).size.width,
											child: Text(
												carNick,
												textAlign: TextAlign.center,
												style: GoogleFonts.getFont(
													'Permanent Marker',
													color: Colors.black,
													fontSize: 36,
													fontWeight: FontWeight.w900,
													fontStyle: FontStyle.italic,
                        						),
                      						),
                    					),
                  					],
                				),
                				SafeArea(
                    				child: Column(
                  						children: [
											ExpansionTile(
												collapsedIconColor: Colors.black,
												iconColor: Colors.black,
												title: const Text(
													"Upcoming Maintenance",
													textAlign: TextAlign.center,
													style: TextStyle(
														color: Colors.black,
														fontSize: 25,
														fontWeight: FontWeight.bold
													),
												),
											children: [
												Container(
                      							padding: const EdgeInsets.only(top: 10),
                      							child: Column(
                        							children: [
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
																		itemBuilder: ((context, index) {
																			return MaintenanceItemCard(
																				maintenanceList[index] as MaintenanceItem
																			);
                                  										})
																	),
                            									),
                          									),
                        								],
                      								),
                    							),
											],)
                    						
                  							],
                						)
									),
                					SafeArea(
                    					child: Column(
                  							children: [
                    							Container(
                      								padding: const EdgeInsets.only(top: 10),
                      								child: Column(
                        								children: [
															ExpansionTile(
																title: const Text(
																	"To-Do List",
																	textAlign: TextAlign.center,
																	style: TextStyle(
																		color: Colors.black,
																		fontSize: 25,
																		fontWeight: FontWeight.bold
																	),
																),
																children: [
																	ElevatedButton(
																onPressed: () {
																	getCarRemindersList();
																	Navigator.push(
																		context,
																		MaterialPageRoute(
																			builder: (context) =>
																				const createToDo(title: "")
																		)
																	);
																},
                              									child: const Text("Add To-Do")
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
																		itemBuilder: ((context, index) {
																			return ReminderItemCard(
																				reminderList[index] as ReminderItem
																			);
																		})
																	),
																),
															),
																],
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
        		),
      		),
    	);
  	}

	Future getPreventativeMaintenanceList() async {
		var data = await FirebaseFirestore.instance
			.collection("users")
			.doc(FirebaseAuth.instance.currentUser?.email) // emailAdd
			.collection("cars")
			.doc(sellNick)
			.collection("maintenance")
			.orderBy("miles", descending: false)
			.get();

		setState(() {
			maintenanceList = List.from(data.docs.map((doc) => MaintenanceItem.fromSnapshot(doc)));
			// getPreventativeMaintenanceList();

			// Calling the above code will force-update the list,
			// but this is reading recursively, which is not good!
		});

		print("Getting maint. list...");
		print(maintenanceList);
	}

	Future getCarRemindersList() async {
		var data = await FirebaseFirestore.instance
			.collection("users")
			.doc(FirebaseAuth.instance.currentUser?.email) // emailAdd
			.collection("cars")
			.doc(sellNick) // replace with curr_car
			.collection("reminders")
			.orderBy("days", descending: false)
			.get();

		setState(() {
			reminderList = List.from(data.docs.map((doc) => ReminderItem.fromSnapshot(doc)));
		});
	}

	Future getLatestCarData() async {
		FirebaseFirestore.instance
			.collection('users')
			.doc(FirebaseAuth.instance.currentUser?.email)
			.get()
			.then((DocumentSnapshot documentSnapshot) {
			if (documentSnapshot.exists) {
				print('Document data: ${documentSnapshot.data()}');
				sellNick = documentSnapshot.get("selected-nick");
				sellMake = documentSnapshot.get("selected-make");
				sellModel = documentSnapshot.get("selected-model");
				print(sellNick);
				print(sellMake);
				print(sellModel);
			} else {
				print('Document does not exist on the database');
			}
    		});
	}
}

// class ShowReminders extends StatelessWidget {
//   final String remText;
//   final String daysLeft;
//   const ShowReminders(
//       {super.key, required this.remText, required this.daysLeft});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         // color: Colors.pink,
//         padding: const EdgeInsets.only(bottom: 10, right: 40, left: 30),
//         child: Container(
//           child: Row(
//             children: [
//               Text(
//                 remText,
//                 style: const TextStyle(
//                   fontSize: 30,
//                 ),
//               ),
//               const SizedBox(width: 15),
//               Text(
//                 daysLeft,
//                 textAlign: TextAlign.left,
//               )
//             ],
//           ),
//         ));
//   }
// }