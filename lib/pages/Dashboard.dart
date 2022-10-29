import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:motore/pages/Credit_card_info.dart';

import 'dashboard_2.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Padding(
          //   padding: EdgeInsets.all(12),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: <Widget>[
          //       Icon(
          //         Icons.menu,
          //         color: Colors.grey,
          //         size: 50.0,
          //       ),
          //       Image.asset(
          //         "lib/icons/insurance.png",
          //         width: 50.0,
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Dashboard",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Center(
                child: Wrap(
              spacing: 60,
              runSpacing: 20,
              children: [
                SizedBox(
                  width: 360,
                  height: 160,
                  child: Card(
                    color: Color(0xFFE0E0E0),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Image.asset(
                              "lib/icons/insurance.png",
                              width: 64,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Driver",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 360,
                  height: 160,
                  child: Card(
                    color: Color(0xFFE0E0E0),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Image.asset(
                              "lib/icons/car-service.png",
                              width: 64,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Car Service",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            // GestureDetector(
                            //   child: Text("Add card"),
                            //   onTap: () {
                            //     Navigator.of(context).pushReplacement(
                            //         MaterialPageRoute(
                            //             builder: (BuildContext context) =>
                            //                 Dashboard2()));
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 360,
                  height: 160,
                  child: Card(
                    color: Color(0xFFE0E0E0),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Image.asset(
                              "lib/icons/expenses.png",
                              width: 64,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Expense",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Total : 465.18",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            // GestureDetector(
                            //   child: Text("Add card"),
                            //   onTap: () {
                            //     Navigator.of(context).pushReplacement(
                            //         MaterialPageRoute(
                            //             builder: (BuildContext context) =>
                            //                 Credit_card()));
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   width: 160,
                //   height: 160,
                //   child: Card(
                //     color: Color(0xFFE0E0E0),
                //     elevation: 2,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(8)),
                //     child: Center(
                //       child: Padding(
                //         padding: const EdgeInsets.all(8),
                //         child: Column(
                //           children: [
                //             Image.asset(
                //               "lib/icons/insurance.png",
                //               width: 64,
                //             ),
                //             SizedBox(
                //               height: 10,
                //             ),
                //             Text(
                //               "Driver",
                //               style: TextStyle(
                //                 color: Colors.black,
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 20,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   width: 160,
                //   height: 160,
                //   child: Card(
                //     color: Color(0xFFE0E0E0),
                //     elevation: 2,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(8)),
                //     child: Center(
                //       child: Padding(
                //         padding: const EdgeInsets.all(8),
                //         child: Column(
                //           children: [
                //             Image.asset(
                //               "lib/icons/insurance.png",
                //               width: 64,
                //             ),
                //             SizedBox(
                //               height: 10,
                //             ),
                //             Text(
                //               "Driver",
                //               style: TextStyle(
                //                 color: Colors.black,
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 20,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   width: 160,
                //   height: 160,
                //   child: Card(
                //     color: Color(0xFFE0E0E0),
                //     elevation: 2,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(8)),
                //     child: Center(
                //       child: Padding(
                //         padding: const EdgeInsets.all(8),
                //         child: Column(
                //           children: [
                //             Image.asset(
                //               "lib/icons/insurance.png",
                //               width: 64,
                //             ),
                //             SizedBox(
                //               height: 10,
                //             ),
                //             Text(
                //               "Driver",
                //               style: TextStyle(
                //                 color: Colors.black,
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 20,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            )),
          )
        ],
      )),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Container(
  //       padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
  //       child: GridView.count(
  //         crossAxisCount: 2,
  //         padding: EdgeInsets.all(3.0),
  //         children: <Widget>[
  //           makeDashboardItem("Ordbog", Icons.book),
  //           makeDashboardItem("Alphabet", Icons.alarm),
  //           makeDashboardItem("Alphabet", Icons.alarm),
  //           makeDashboardItem("Alphabet", Icons.alarm),
  //           makeDashboardItem("Alphabet", Icons.alarm),
  //           makeDashboardItem("Alphabet", Icons.alarm)
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Card makeDashboardItem(String title, IconData icon) {
  //   return Card(
  //       elevation: 1.0,
  //       margin: EdgeInsets.all(8.0),
  //       child: Container(
  //         decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
  //         child: InkWell(
  //           onTap: () {},
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.stretch,
  //             mainAxisSize: MainAxisSize.min,
  //             verticalDirection: VerticalDirection.down,
  //             children: <Widget>[
  //               SizedBox(height: 50.0),
  //               Center(
  //                   child: Icon(
  //                 icon,
  //                 size: 40.0,
  //                 color: Colors.black,
  //               )),
  //               SizedBox(height: 20.0),
  //               Center(
  //                 child: Text(title,
  //                     style: TextStyle(fontSize: 18.0, color: Colors.black)),
  //               )
  //             ],
  //           ),
  //         ),
  //       ));
  // }
}
