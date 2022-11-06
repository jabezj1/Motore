import 'package:flutter/material.dart';
import 'package:motore/pages/CarPartsTab.dart';
import 'package:motore/pages/Tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // my tabs
  List<Widget> myTabs = [
    // engine & transmmission tab
    MyTab(
      iconPath: 'lib/icons/engine.png',
    ),

    // wheels & suspension tab
    MyTab(
      iconPath: 'lib/icons/suspension.png',
    ),

    // electrical tab
    MyTab(
      iconPath: 'lib/icons/battery.png',
    ),

    // interior tab
    MyTab(
      iconPath: 'lib/icons/interior.png',
    ),

    // exterior tab
    MyTab(
      iconPath: 'lib/icons/exterior.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Car Parts',
          ),
          centerTitle: false,
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF15AAAFF),
                Color(0xFFADF7F2),
              ]),
            ),
          ),
        ),
        body: Column(
          children: [
            // i want to eat
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 36.0, vertical: 18),
              child: Row(
                children: [
                  Text(
                    'Looking for',
                    style: TextStyle(fontSize: 24, color: Colors.grey[600]),
                  ),
                  Text(
                    ' PARTS?',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

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
            )
          ],
        ),
      ),
    );
  }
}
