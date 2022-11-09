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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Dashboard',
        ),
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
      //backgroundColor: Color(0xFF15AAAFF),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF15AAAFF), Color(0xFFADF7F2)]),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
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
                            color: const Color.fromARGB(255, 164, 160, 160),
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
                                      ImageInput(
                                          "lib/icons/mileage.png", 75, 75),
                                      WelcomeText("97,000\nMiles", 25)
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
                          WelcomeText("Reminder", 30),
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
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ))),
                          child: WelcomeText("Set a Reminder", 15),
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
      ),
    );
  }
}
