import 'package:flutter/material.dart';
import 'package:motore/pages/History.dart';

class HistoryThird extends StatelessWidget {
  const HistoryThird({Key? key}) : super(key: key);

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
                height: 400,
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
                          "September 2022",
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
                          "This month's total:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),

                        SizedBox(
                          height: 11,
                        ),

                        Text(" ____________________"),
                        SizedBox(
                          height: 10,
                        ),

                        Row(
                          children: [
                            Text(
                              " Suspension repair: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$500",
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
                              " Gas fill-up: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$69.69",
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
                              " Gas fill-up: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$58.23",
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
                              " Speeding ticket: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$120",
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
                              " Flat tire: ",
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
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              " Car Wash: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$30",
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
                              " Red Light Ticket: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$50",
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
                              " Gas Fill-up: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$41.89",
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
                              " Flat tire: ",
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
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              " A/C Recharge: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$39.99",
                                style: (TextStyle(
                                  fontSize: 20,
                                )),
                              ),
                            ),
                          ],
                        ),

                        // Text(
                        //   "Click to see more ->",
                        //   textAlign: TextAlign.left,
                        // ),
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
                height: 400,
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
                          "August 2022",
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
                          "This month's total:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),

                        SizedBox(
                          height: 11,
                        ),

                        Text(" ____________________"),
                        SizedBox(
                          height: 10,
                        ),

                        Row(
                          children: [
                            Text(
                              " Suspension repair: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$500",
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
                              " Gas fill-up: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$69.69",
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
                              " Gas fill-up: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$58.23",
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
                              " Parking ticket: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$120",
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
                              " Oil Change: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$75",
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
                              " Car Wash: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$30",
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
                              " Gas Fill-up: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$41.89",
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
                              " Paint correction: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$149.99",
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
                              " Tune-up: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$94.99",
                                style: (TextStyle(
                                  fontSize: 20,
                                )),
                              ),
                            ),
                          ],
                        ),

                        // Text(
                        //   "Click to see more ->",
                        //   textAlign: TextAlign.left,
                        // ),
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
                height: 400,
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
                          "July 2022",
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
                          "This month's total:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),

                        SizedBox(
                          height: 11,
                        ),

                        Text(" ____________________"),
                        SizedBox(
                          height: 10,
                        ),

                        Row(
                          children: [
                            Text(
                              " Suspension repair: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$500",
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
                              " Gas fill-up: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$69.69",
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
                              " Gas fill-up: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$58.23",
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
                              " Parking ticket: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$120",
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
                              " Oil Change: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$75",
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
                              " Car Wash: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$30",
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
                              " Gas Fill-up: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$41.89",
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
                              " Paint correction: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$149.99",
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
                              " Tune-up: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$94.99",
                                style: (TextStyle(
                                  fontSize: 20,
                                )),
                              ),
                            ),
                          ],
                        ),

                        // Text(
                        //   "Click to see more ->",
                        //   textAlign: TextAlign.left,
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(3.0),
            //   child: Text(
            //     "Montly Expenses",
            //     style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(3.0),
            //   child: Container(
            //     //borderRadius: BorderRadius.circular(30),
            //     child: Container(
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(30),
            //         color: Color.fromARGB(255, 150, 206, 232),
            //       ),

            //       margin: const EdgeInsets.all(3),
            //       height: 500,
            //       width: 380,

            //       // ignore: prefer_const_constructors

            //       child: Text(
            //         "August 2022",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 25,
            //           fontWeight: FontWeight.bold,
            //         ),

            //       ),

            //     ),

            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
