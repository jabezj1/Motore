import 'package:flutter/material.dart';
import 'package:motore/pages/history_second.dart';
import 'package:motore/pages/history_third.dart';
import 'package:motore/pages/history_fourth.dart';

const List<String> list = <String>[
  ' Car One',
  ' Car Two',
  ' Car Three',
  ' Car Four',
];

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  "History",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                  //Fredoka One
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage("lib/icons/car.png"),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              DropdownButton<String>(
                //value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.blueAccent,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  // setState(() {
                  //   dropdownValue = value!;
                  // }
                  //);
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: HistoryWidget(
                  value: "lib/icons/expense.png",
                  value2: "Monthly Expenses",
                  value3: "Your Monthly Expenses are: \n",
                  value4: "\$523",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: HistoryWidget(
                  value: "lib/icons/oil_two.png",
                  value2: "Oil Changes",
                  value3: "Last Oil Change: \n",
                  value4: "09/14/22",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: HistoryWidget(
                  value: "lib/icons/past.png",
                  value2: "Past Maintenances",
                  value3: "Your Last Maintenance: \n",
                  value4: "10/04/22",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({
    Key? key,
    required this.value,
    required this.value2,
    required this.value3,
    required this.value4,
  }) : super(key: key);
  final String value;
  final String value2;
  final String value3;
  final String value4;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HistorySecond()),
      ),
      child: Container(
        height: 140,
        width: 360,
        //
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 111,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF15AAAFF),
                  Color(0xFFADF7F2),
                ]),
                //color: Color.fromARGB(255, 150, 206, 232),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 30,
                    offset: Offset(8, 10),
                    color: Color.fromARGB(255, 133, 178, 214),
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              width: 350,
              margin: const EdgeInsets.only(
                right: 220,
                bottom: 20,
              ),

              //color: Colors.redAccent.withOpacity(0.2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(value),
                  //fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 100,
              //color: Colors.redAccent.withOpacity(0.3),
              margin: const EdgeInsets.only(left: 140, top: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      value2,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    RichText(
                        text: TextSpan(
                            text: value3,
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                          TextSpan(
                              text: value4,
                              style: TextStyle(
                                //color: Colors.blue,
                                fontSize: 16,
                              ))
                        ]))
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
