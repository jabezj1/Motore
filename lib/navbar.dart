import 'package:motore/pages/CarPart.dart';
import 'package:motore/pages/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:motore/pages/History.dart';
import 'package:motore/pages/Fuel.dart';
import 'package:motore/pages/Dashboard.dart';

//Used a pub package called curved_navigtion_bar
//Link: https://pub.dev/packages/curved_navigation_bar

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  final items = const [
    Icon(Icons.people, size: 30, color: Colors.grey),
    Icon(
      Icons.person,
      size: 30,
      color: Colors.grey,
    ),
    Icon(Icons.add, size: 30, color: Colors.grey),
    Icon(Icons.search_off_outlined, size: 30, color: Colors.grey),
    Icon(Icons.settings, size: 30, color: Colors.grey)
  ];

  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        color: Color(0xFF90CAF9),
        onTap: (selctedIndex) {
          setState(() {
            index = selctedIndex;
          });
        },
        height: 70,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
      ),
      body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: getSelectedWidget(index: index)),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const CarPart();
        break;
      case 1:
        widget = const Profile();
        break;
      case 2:
        widget = const History();
        break;
      case 3:
        widget = const Dashboard();
        break;
      case 4:
        widget = Fuel();
        break;
      default:
        widget = const CarPart();
        break;
    }
    return widget;
  }

  // @override
  // Widget build(BuildContext){
  //   return Scaffold(
  //     bottomNavigationBar: CurvedNavigationBar(
  //       final items: [
  //       Icon(Icons.home),
  //       Icon(Icons.favorite),
  //       Icon(Icons.settings,
  //       Icon(Icons.people),
  //       Icon(Icons.settings),
  //       Icon(Icons.people),

  //     ],
  //     ),
  //   );
  // }

  // int currentPageIndex = 0;

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     bottomNavigationBar: NavigationBar(
  //       onDestinationSelected: (int index) {
  //         setState(() {
  //           currentPageIndex = index;
  //         });
  //       },
  //       selectedIndex: currentPageIndex,
  //       destinations: const <Widget>[
  //         NavigationDestination(
  //           icon: Icon(Icons.dashboard_rounded),
  //           label: 'Explore',
  //         ),
  //         NavigationDestination(
  //           icon: Icon(Icons.commute),
  //           label: 'Commute',
  //         ),
  //         NavigationDestination(
  //           selectedIcon: Icon(Icons.bookmark),
  //           icon: Icon(Icons.bookmark_border),
  //           label: 'Saved',
  //         ),
  //       ],
  //     ),
  //     body: <Widget>[
  //       Container(
  //         color: Colors.red,
  //         alignment: Alignment.center,
  //         child: const Text('Page 1'),
  //       ),
  //       Container(
  //         color: Colors.green,
  //         alignment: Alignment.center,
  //         child: const Text('Page 2'),
  //       ),
  //       Container(
  //         color: Colors.blue,
  //         alignment: Alignment.center,
  //         child: const Text('Page 3'),
  //       ),
  //     ][currentPageIndex],
  //   );
  // }
}
