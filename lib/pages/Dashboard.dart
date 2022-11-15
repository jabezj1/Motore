import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>[
  ' Fatin',
  ' Navait',
  ' Kevin',
  ' Jabez',
];

imageInput(String path, double h, double w) {
  return Image.asset(
    path,
    height: h,
    width: w,
    fit: BoxFit.fill,
  );
}

WelcomeText(String text, double size, Color coloring) {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Text(
      text,
      style: TextStyle(
        color: coloring,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.left,
    ),
  );
}

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  String? username = FirebaseAuth.instance.currentUser?.displayName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Dashboard'),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff15aaaff),
              Color(0xFFADF7F2),
            ]),
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 5,
            ),
            WelcomeText("Welcome back, user", 30, Colors.black),
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
                          color: const Color.fromARGB(255, 164, 160, 160),
                        ),
                        child: Column(
                          children: <Widget>[
                            ListView(
                              shrinkWrap: true,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: WelcomeText("Car Stats", 30, Colors.white),
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    imageInput("lib/icons/car2.png", 85, 150),
                                    imageInput("lib/icons/mileage.png", 75, 75),
                                    WelcomeText(
                                        "97,000\nMiles", 25, Colors.white)
                                  ],
                                )),
                            const SizedBox(
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
            const SizedBox(
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
                      color: const Color.fromARGB(255, 164, 160, 160),
                    ),
                    child: Column(
                      children: <Widget>[
                        WelcomeText("Reminder", 30, Colors.white),
                        Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          width: 85,
                          height: 85,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 49, 187, 58),
                          ),
                          child: Column(
                            children: <Widget>[
                              WelcomeText("56", 25, Colors.white),
                            ],
                          ),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: WelcomeText(
                                "Days until next oil change", 12, Colors.white))
                      ],
                    ),
                  ),
                  const SizedBox(
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
                        child: WelcomeText("Set a Reminder", 15, Colors.white),
                      )),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 175,
                        height: 190,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(255, 164, 160, 160),
                        ),
                        child: Column(
                          children: <Widget>[
                            WelcomeText(" Expenses", 25, Colors.white),
                            WelcomeText("\$4000", 30, Colors.white),
                            Align(
                              alignment: Alignment.centerRight,
                              child:
                                  WelcomeText("This Month", 15, Colors.white),
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
