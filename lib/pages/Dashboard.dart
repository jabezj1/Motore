import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  String? username = FirebaseAuth
      .instance.currentUser?.displayName; // name of the authenticated user
  String? emailAdd = FirebaseAuth
      .instance.currentUser?.email; // email of the authenticated user
  String carNick =
      sellNick; // nickname of the car the user picked in Profile page

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getCarRemindersList();
    getPreventativeMaintenanceList();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.red,
          Color(0xff15aaaff),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   automaticallyImplyLeading: false,
        //   title: Text('Dashboard',
        //       style: GoogleFonts.roboto(
        //         fontSize: 25,
        //         fontWeight: FontWeight.bold,
        //       )),
        //   centerTitle: true,
        //   elevation: 0,
        // ),
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
                      fontSize: 30, fontWeight: FontWeight.bold),
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
                      )),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          // gradient: LinearGradient(
                          //     colors: [Colors.white, Colors.red],
                          //     begin: Alignment.topCenter,
                          //     end: Alignment.bottomCenter),
                          ),
                      child: Text(
                        carNick,
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
                      child: Column(
                        children: [
                          const Text(
                            "Upcoming Maintenance",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const createNewMaintenance(
                                                title: "")));
                              },
                              child: Text("Add Maintenance")),
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
                                        maintenanceList[index]
                                            as MaintenanceItem);
                                  })),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
                SafeArea(
                    child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10),

                      // ),
                      child: Column(
                        children: [
                          const Text(
                            "To-Do List",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const createToDo(title: "")));
                              },
                              child: Text("Add To-Do")),
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
                                        reminderList[index] as ReminderItem);
                                  })),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            )),
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
        .doc("NAPm33gq0rcaKIaZGAA3")
        .collection("maintenance")
        .orderBy("miles", descending: false)
        .get();

    setState(() {
      maintenanceList =
          List.from(data.docs.map((doc) => MaintenanceItem.fromSnapshot(doc)));
    });
  }

  Future getCarRemindersList() async {
    var data = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.email) // emailAdd
        .collection("cars")
        .doc("NAPm33gq0rcaKIaZGAA3") // replace with curr_car
        .collection("reminders")
        .orderBy("days", descending: false)
        .get();

    setState(() {
      reminderList =
          List.from(data.docs.map((doc) => ReminderItem.fromSnapshot(doc)));
    });
  }
}

class ShowReminders extends StatelessWidget {
  final String remText;
  final String daysLeft;
  const ShowReminders(
      {super.key, required this.remText, required this.daysLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ));
  }
}
