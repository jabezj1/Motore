import 'package:flutter/material.dart';
import 'package:motore/pages/History.dart';

class HistoryFourth extends StatelessWidget {
  const HistoryFourth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      // padding: const EdgeInsets.all(24.0),
      // child: Column(

      //   children: [

      //     // SizedBox(
      //     //   height: 45,
      //     // ),
      //     // Text(
      //     //   'Work in progress',
      //     //   textAlign: TextAlign.center,
      //     //   style: TextStyle(
      //     //       fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
      //     // ),
      //     // SizedBox(
      //     //   height: 100,
      //     // ),
      //     // // CircleAvatar(
      //     // //   radius: 70,
      //     // //   child: Icon(Icons.people, size: 120),
      //     // // ),
      //     // SizedBox(
      //     //   height: 100,
      //     // ),
      //     // Text(
      //     //   'We apologize for any the inconvenience',
      //     //   textAlign: TextAlign.center,
      //     //   style: TextStyle(fontSize: 40, color: Colors.white),
      //     // ),

      //     Padding(
      //       padding: const EdgeInsets.all(3.0),
      //       child: Container(
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(30),
      //           color: Color.fromARGB(255, 150, 206, 232),
      //         ),
      //         margin: const EdgeInsets.only(top: 1),
      //         height: 500,
      //         width: 400,
      //       ),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: const Text('Go Back'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 27, 156, 216),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const History()),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),

              // child: ClipRRect(
              // borderRadius: BorderRadius.circular(30),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 150, 206, 232),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(15),
                height: 250,
                width: 380,
                // color: Color.fromARGB(255, 150, 206, 232),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Cool Shop NY",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Battery Replacement",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Row(
                          children: [
                            Text(
                              " 09/07/22 - 118,087 mi",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Row(
                          children: [
                            Text(
                              " Cost: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$145.99",
                                style: (TextStyle(
                                  fontSize: 20,
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Row(
                          children: [
                            Text(
                              " Brand: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "Interstate Batteries",
                                style: (TextStyle(
                                  fontSize: 20,
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              " Warranty: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "36 months",
                                style: (TextStyle(
                                  fontSize: 20,
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              " Additional Notes",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "N/A",
                                style: (TextStyle(
                                  fontSize: 20,
                                )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),

              // child: ClipRRect(
              // borderRadius: BorderRadius.circular(30),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 150, 206, 232),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(15),
                height: 250,
                width: 380,
                // color: Color.fromARGB(255, 150, 206, 232),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Avenue X Tire Shop",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Flat Tire Repair",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Row(
                          children: [
                            Text(
                              " 09/07/22 - 118,083 mi",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Row(
                          children: [
                            Text(
                              " Cost: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$11",
                                style: (TextStyle(
                                  fontSize: 20,
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Row(
                          children: [
                            Text(
                              " Brand: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "N/A",
                                style: (TextStyle(
                                  fontSize: 20,
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              " Warranty: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "30 days",
                                style: (TextStyle(
                                  fontSize: 20,
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              " Additional Notes",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "FL Tire",
                                style: (TextStyle(
                                  fontSize: 20,
                                )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),

              // child: ClipRRect(
              // borderRadius: BorderRadius.circular(30),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 150, 206, 232),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(15),
                height: 250,
                width: 380,
                // color: Color.fromARGB(255, 150, 206, 232),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Cool Shop NY 2",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Bumper Repair",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Row(
                          children: [
                            Text(
                              " 06/07/22 - 117,457 mi",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Row(
                          children: [
                            Text(
                              " Cost: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$465",
                                style: (TextStyle(
                                  fontSize: 20,
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Row(
                          children: [
                            Text(
                              " Brand: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "OEM",
                                style: (TextStyle(
                                  fontSize: 20,
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              " Warranty: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "12 months",
                                style: (TextStyle(
                                  fontSize: 20,
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              " Additional Notes",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "Rear Bumper painted",
                                style: (TextStyle(
                                  fontSize: 20,
                                )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),

              // child: ClipRRect(
              // borderRadius: BorderRadius.circular(30),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 150, 206, 232),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(15),
                height: 250,
                width: 380,
                // color: Color.fromARGB(255, 150, 206, 232),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Cool Shop NY 2",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Fender Replacement",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Row(
                          children: [
                            Text(
                              " 06/07/22 - 117,457 mi",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Row(
                          children: [
                            Text(
                              " Cost: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$299",
                                style: (TextStyle(
                                  fontSize: 20,
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Row(
                          children: [
                            Text(
                              " Brand: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "OEM",
                                style: (TextStyle(
                                  fontSize: 20,
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              " Warranty: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "6 months",
                                style: (TextStyle(
                                  fontSize: 20,
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              " Additional Notes",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "Driver Side",
                                style: (TextStyle(
                                  fontSize: 20,
                                )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
