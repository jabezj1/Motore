import 'package:flutter/material.dart';
import 'package:motore/pages/history_second.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              "History",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              //borderRadius: BorderRadius.circular(30),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(255, 150, 206, 232),
                ),
                margin: const EdgeInsets.only(top: 1),
                height: 40,
                width: 380,

                // ignore: prefer_const_constructors

                child: const Text(
                  "Set a Reminder",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
              margin: const EdgeInsets.only(top: 1),
              height: 170,
              width: 380,
              // color: Color.fromARGB(255, 150, 206, 232),
              child: Column(
                children: [
                  Icon(
                    Icons.attach_money_rounded,
                    color: Colors.red,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Monthly Expenses",
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
                    "Your monthly expenses are:",
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

                  ElevatedButton(
                    child: const Text('See more'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 150, 206, 232),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HistorySecond()),
                      );
                    },
                  ),
                  // Text(
                  //   "Click to see more ->",
                  //   textAlign: TextAlign.left,
                  // ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 150, 206, 232),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),

              margin: const EdgeInsets.only(top: 1),
              height: 170,
              width: 380,
              // color: Color.fromARGB(255, 150, 206, 232),
              child: Column(
                children: [
                  Icon(
                    Icons.car_repair,
                    color: Colors.red,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Oil Changes",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Your last oil change:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(" ____________________"),
                  SizedBox(
                    height: 22,
                  ),
                  Text(
                    "Click to see more ->",
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 150, 206, 232),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              margin: const EdgeInsets.only(top: 1),
              height: 170,
              width: 380,
              // color: Color.fromARGB(255, 150, 206, 232),
              child: Column(
                children: [
                  Icon(
                    Icons.engineering,
                    color: Colors.red,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Past Maintenance",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Your last maintenance:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(" ____________________"),
                  SizedBox(
                    height: 22,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // children: <Widget>[
                    //   SignupButton(),
                    // ],
                  ),
                  Text(
                    "Click to see more ->",
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// The Sign up in Widget Button
// class SignupButton extends StatelessWidget {
//   const SignupButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           SizedBox(height: 20.0, width: 10.0),
//           Text(
//             "Signup",
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 20.0, width: 20.0),
//         ],
//       ),
//       onPressed: () {
//         Navigator.pushNamed(context, '/');
//       },
//       style: TextButton.styleFrom(
//         elevation: 0,
//         // backgroundColor: Color(0xFFFFBA01), //0xFFCCCCCC
//       ),
//     );
//   }
// }
