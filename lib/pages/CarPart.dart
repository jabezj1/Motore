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
          title: const Text(
            'Car Parts',
          ),
          centerTitle: true,
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
                  const EdgeInsets.symmetric(horizontal: 36.0, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
							ElevatedButton.icon(
								onPressed: () {
								
								},
								icon: const Icon(Icons.map_outlined),
								label: const Text(
								  'Find Nearby Auto Parts Stores'
								),
								style: ElevatedButton.styleFrom(
									padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0), 
									backgroundColor: Colors.green,
									shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))
								),
							)
						],
              ),
            )

          ],
        ),
      ),
    );
  }
}
