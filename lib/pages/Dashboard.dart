// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// // import 'package:motore/pages/Credit_card_info.dart';

// import 'dashboard_2.dart';

// class Dashboard extends StatelessWidget {
//   const Dashboard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//           child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           // Padding(
//           //   padding: EdgeInsets.all(12),
//           //   child: Row(
//           //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //     children: <Widget>[
//           //       Icon(
//           //         Icons.menu,
//           //         color: Colors.grey,
//           //         size: 50.0,
//           //       ),
//           //       Image.asset(
//           //         "lib/icons/insurance.png",
//           //         width: 50.0,
//           //       ),
//           //     ],
//           //   ),
//           // ),
//           SizedBox(
//             height: 30,
//           ),
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.all(18.0),
//               child: Text(
//                 "Dashboard",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.start,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: Center(
//                 child: Wrap(
//               spacing: 60,
//               runSpacing: 20,
//               children: [
//                 SizedBox(
//                   width: 360,
//                   height: 160,
//                   child: Card(
//                     color: Color(0xFFE0E0E0),
//                     elevation: 2,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8)),
//                     child: Center(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8),
//                         child: Column(
//                           children: [
//                             Image.asset(
//                               "lib/icons/insurance.png",
//                               width: 64,
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               "Driver",
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 360,
//                   height: 160,
//                   child: Card(
//                     color: Color(0xFFE0E0E0),
//                     elevation: 2,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8)),
//                     child: Center(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8),
//                         child: Column(
//                           children: [
//                             Image.asset(
//                               "lib/icons/car-service.png",
//                               width: 64,
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               "Car Service",
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 2,
//                             ),
//                             // GestureDetector(
//                             //   child: Text("Add card"),
//                             //   onTap: () {
//                             //     Navigator.of(context).pushReplacement(
//                             //         MaterialPageRoute(
//                             //             builder: (BuildContext context) =>
//                             //                 Dashboard2()));
//                             //   },
//                             // ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 360,
//                   height: 160,
//                   child: Card(
//                     color: Color(0xFFE0E0E0),
//                     elevation: 2,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8)),
//                     child: Center(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8),
//                         child: Column(
//                           children: [
//                             Image.asset(
//                               "lib/icons/expenses.png",
//                               width: 64,
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               "Expense",
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20,
//                               ),
//                             ),
//                             SizedBox(height: 5),
//                             Text(
//                               "Total : 465.18",
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w300,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 2,
//                             ),
//                             // GestureDetector(
//                             //   child: Text("Add card"),
//                             //   onTap: () {
//                             //     Navigator.of(context).pushReplacement(
//                             //         MaterialPageRoute(
//                             //             builder: (BuildContext context) =>
//                             //                 Credit_card()));
//                             //   },
//                             // ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 // SizedBox(
//                 //   width: 160,
//                 //   height: 160,
//                 //   child: Card(
//                 //     color: Color(0xFFE0E0E0),
//                 //     elevation: 2,
//                 //     shape: RoundedRectangleBorder(
//                 //         borderRadius: BorderRadius.circular(8)),
//                 //     child: Center(
//                 //       child: Padding(
//                 //         padding: const EdgeInsets.all(8),
//                 //         child: Column(
//                 //           children: [
//                 //             Image.asset(
//                 //               "lib/icons/insurance.png",
//                 //               width: 64,
//                 //             ),
//                 //             SizedBox(
//                 //               height: 10,
//                 //             ),
//                 //             Text(
//                 //               "Driver",
//                 //               style: TextStyle(
//                 //                 color: Colors.black,
//                 //                 fontWeight: FontWeight.bold,
//                 //                 fontSize: 20,
//                 //               ),
//                 //             ),
//                 //           ],
//                 //         ),
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//                 // SizedBox(
//                 //   width: 160,
//                 //   height: 160,
//                 //   child: Card(
//                 //     color: Color(0xFFE0E0E0),
//                 //     elevation: 2,
//                 //     shape: RoundedRectangleBorder(
//                 //         borderRadius: BorderRadius.circular(8)),
//                 //     child: Center(
//                 //       child: Padding(
//                 //         padding: const EdgeInsets.all(8),
//                 //         child: Column(
//                 //           children: [
//                 //             Image.asset(
//                 //               "lib/icons/insurance.png",
//                 //               width: 64,
//                 //             ),
//                 //             SizedBox(
//                 //               height: 10,
//                 //             ),
//                 //             Text(
//                 //               "Driver",
//                 //               style: TextStyle(
//                 //                 color: Colors.black,
//                 //                 fontWeight: FontWeight.bold,
//                 //                 fontSize: 20,
//                 //               ),
//                 //             ),
//                 //           ],
//                 //         ),
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//                 // SizedBox(
//                 //   width: 160,
//                 //   height: 160,
//                 //   child: Card(
//                 //     color: Color(0xFFE0E0E0),
//                 //     elevation: 2,
//                 //     shape: RoundedRectangleBorder(
//                 //         borderRadius: BorderRadius.circular(8)),
//                 //     child: Center(
//                 //       child: Padding(
//                 //         padding: const EdgeInsets.all(8),
//                 //         child: Column(
//                 //           children: [
//                 //             Image.asset(
//                 //               "lib/icons/insurance.png",
//                 //               width: 64,
//                 //             ),
//                 //             SizedBox(
//                 //               height: 10,
//                 //             ),
//                 //             Text(
//                 //               "Driver",
//                 //               style: TextStyle(
//                 //                 color: Colors.black,
//                 //                 fontWeight: FontWeight.bold,
//                 //                 fontSize: 20,
//                 //               ),
//                 //             ),
//                 //           ],
//                 //         ),
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//               ],
//             )),
//           )
//         ],
//       )),
//     );
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     body: Container(
//   //       padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
//   //       child: GridView.count(
//   //         crossAxisCount: 2,
//   //         padding: EdgeInsets.all(3.0),
//   //         children: <Widget>[
//   //           makeDashboardItem("Ordbog", Icons.book),
//   //           makeDashboardItem("Alphabet", Icons.alarm),
//   //           makeDashboardItem("Alphabet", Icons.alarm),
//   //           makeDashboardItem("Alphabet", Icons.alarm),
//   //           makeDashboardItem("Alphabet", Icons.alarm),
//   //           makeDashboardItem("Alphabet", Icons.alarm)
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

//   // Card makeDashboardItem(String title, IconData icon) {
//   //   return Card(
//   //       elevation: 1.0,
//   //       margin: EdgeInsets.all(8.0),
//   //       child: Container(
//   //         decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
//   //         child: InkWell(
//   //           onTap: () {},
//   //           child: Column(
//   //             crossAxisAlignment: CrossAxisAlignment.stretch,
//   //             mainAxisSize: MainAxisSize.min,
//   //             verticalDirection: VerticalDirection.down,
//   //             children: <Widget>[
//   //               SizedBox(height: 50.0),
//   //               Center(
//   //                   child: Icon(
//   //                 icon,
//   //                 size: 40.0,
//   //                 color: Colors.black,
//   //               )),
//   //               SizedBox(height: 20.0),
//   //               Center(
//   //                 child: Text(title,
//   //                     style: TextStyle(fontSize: 18.0, color: Colors.black)),
//   //               )
//   //             ],
//   //           ),
//   //         ),
//   //       ));
//   // }
// }

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:motore/pages/Credit_card_info.dart';

import 'dashboard_2.dart';

const List<String> list = <String>[
  ' Fatin',
  ' Navait',
  ' Kevin',
  ' Jabez',
];

ImageInput(String path, double h, double w) {
  return new Image.asset(
    path,
    height: h,
    width: w,
    fit: BoxFit.fill,
  );
}

WelcomeText(String text, double size) {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.left,
    ),
  );
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF15AAAFF),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            WelcomeText("Dashboard", 30),
            WelcomeText("Welcome Back, Kevin", 20),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Center(
                child: Column(
                  children: [
                    Container(
                        width: 410,
                        height: 245,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromARGB(255, 164, 160, 160),
                        ),
                        child: Column(
                          children: <Widget>[
                            ListView(
                              shrinkWrap: true,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: WelcomeText("Car Stats", 30),
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    ImageInput("lib/icons/car2.png", 85, 150),
                                    ImageInput("lib/icons/mileage.png", 75, 75),
                                    WelcomeText("97,000\nMiles", 25)
                                  ],
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: DropdownButton<String>(
                                //value: dropdownValue,
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style: const TextStyle(color: Colors.red),
                                underline: Container(
                                  height: 2,
                                  color: Colors.redAccent,
                                ),
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  // setState(() {
                                  //   dropdownValue = value!;
                                  // }
                                  //);
                                },
                                items: list.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(255, 164, 160, 160),
                    ),
                    child: Column(
                      children: <Widget>[
                        WelcomeText("Reminder", 30),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          width: 85,
                          height: 85,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 49, 187, 58),
                          ),
                          child: Column(
                            children: <Widget>[
                              WelcomeText("56", 25),
                            ],
                          ),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child:
                                WelcomeText("Days until next oil change", 12))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                          child: ElevatedButton(
                        onPressed: (() => debugPrint("Setting a Reminder")),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        child: WelcomeText("Set a Reminder", 15),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 175,
                        height: 190,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromARGB(255, 164, 160, 160),
                        ),
                        child: Column(
                          children: <Widget>[
                            WelcomeText(" Expenses", 25),
                            WelcomeText("\$4000", 30),
                            Align(
                              alignment: Alignment.centerRight,
                              child: WelcomeText("This Month", 15),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
