import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:motore/pages/CarPart.dart';
import 'package:motore/pages/CarPartsTab.dart';
import 'package:motore/pages/Dashboard.dart';
import 'package:motore/pages/Fuel.dart';
import 'package:motore/pages/History.dart';
import 'package:motore/pages/PartTile.dart';
import 'package:motore/pages/profile.dart';

int index = 0;
dynamic defPage = Dashboard();

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.lightBlue,
            padding: EdgeInsets.all(16),
            gap: 8,
            onTabChange: (selctedIndex) {
              setState(() {
                index = selctedIndex;
              });
            },
            // EdgeInsets.symmetric(
            //     horizontal: 10, vertical: 15),
            tabs: const [
              GButton(
                icon: Icons.dashboard_customize_outlined,
                text: 'Dashboard',
              ),
              GButton(
                icon: Icons.directions_car,
                text: 'Car Parts',
              ),
              GButton(
                icon: Icons.share_location_rounded,
                text: 'Fuel',
              ),
              GButton(
                icon: Icons.history_outlined,
                text: 'History',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
      body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: getSelectedWidget(index: index)),
    );
  }
}

Widget getSelectedWidget({required int index}) {
  Widget widget;
  switch (index) {
    case 0:
      widget = Dashboard();
      break;
    case 1:
      widget = HomePage();
      break;
    case 2:
      widget = Fuel();
      break;
    case 3:
      widget = History();
      break;
    case 4:
      widget = Profile();
      break;
    default:
      widget = defPage;
      break;
  }
  return widget;
}
