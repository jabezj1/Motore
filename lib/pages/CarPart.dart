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
          backgroundColor: Colors.red,
          title: const Text(
            'Car Parts',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.map_outlined),
                      label: const Text('Find Nearby Auto Parts Stores'),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          backgroundColor: Color.fromARGB(255, 228, 111, 150),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0))),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
