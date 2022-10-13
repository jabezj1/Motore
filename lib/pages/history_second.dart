import 'package:flutter/material.dart';
import 'package:motore/pages/History.dart';

class HistorySecond extends StatelessWidget {
  const HistorySecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          "Oil Change @ 116,092 miles",
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
                          "08/16/22",
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
                              " Cost: ",
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
                          height: 9,
                        ),
                        Row(
                          children: [
                            Text(
                              " Oil Type ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "Full Synthetic",
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
                              " Location: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "At home",
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
                              " Shop: ",
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
                          "Oil Change @ 110,988 miles",
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
                          "02/11/22",
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
                              " Cost: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$115",
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
                              " Oil Type ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "Full Synthetic",
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
                              " Location: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "123 Main St",
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
                              " Shop: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "Jonny's Auto Repair",
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
                          "Oil Change @ 104,760 miles",
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
                          "08/23/21",
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
                              " Cost: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "\$85",
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
                              " Oil Type ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "Full Synthetic",
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
                              " Location: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "8759 18th St, Brooklyn",
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
                              " Shop: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "Grease Auto Repair",
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
