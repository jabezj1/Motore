import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motore/pages/CarPartsTab.dart';
import 'package:motore/pages/Tab.dart';
import 'package:motore/pages/Profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // my tabs
  List<Widget> myTabs = [
    // engine & transmmission tab
    const MyTab(
      iconPath: 'lib/icons/engine.png',
    ),

    // wheels & suspension tab
    const MyTab(
      iconPath: 'lib/icons/suspension.png',
    ),

    // electrical tab
    const MyTab(
      iconPath: 'lib/icons/battery.png',
    ),

    // interior tab
    const MyTab(
      iconPath: 'lib/icons/interior.png',
    ),

    // exterior tab
    const MyTab(
      iconPath: 'lib/icons/exterior.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.red,
          title: Text(
            'Car Parts',
            style: GoogleFonts.josefinSans(
                fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                // color: Colors.red,
                // gradient: LinearGradient(colors: [
                //   Colors.red,
                //   Color(0xff15aaaff),
                // ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                // gradient: LinearGradient(colors: [
                //   Color(0xFF15AAAFF),
                //   Color(0xFFADF7F2),
                // ]),
                ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.red,
              Color(0xff15aaaff),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            // gradient: LinearGradient(
            //     begin: Alignment.bottomLeft,
            //     end: Alignment.bottomRight,
            //     colors: [Color(0xFF15AAAFF), Color(0xFFADF7F2)]),
          ),
          child: Column(
            children: [
              // i want to eat

              // tab bar
              TabBar(tabs: myTabs),

              // tab bar view
              Expanded(
                child: TabBarView(
                  children: [
                    // engine page
                    EngineTab(),

                    // wheel page
                    WheelTab(),

                    // battery page
                    BatteryTab(),

                    // interior page
                    InteriorTab(),

                    // exterior page
                    ExteriorTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
