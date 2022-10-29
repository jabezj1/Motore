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
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(35),
                              bottomLeft: Radius.circular(35),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HistoryWidget(
                    value: 'Monthly Expenses',
                    value2: 'AVERAGE Monthly Expenses:',
                    value3: '\$1035',
                    value4: 'See More'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HistoryWidget(
                    value: 'Oil Changes',
                    value2: 'Last Oil Change:',
                    value3: '08/16/22',
                    value4: 'See More'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HistoryWidget(
                    value: 'Past Maintenance',
                    value2: 'Battery Replacement',
                    value3: '08/12/22',
                    value4: 'See More'),
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
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 150, 206, 232),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF04589A),
                offset: Offset(8, 8),
                blurRadius: 6,
              )
            ]),
        margin: const EdgeInsets.only(top: 1),
        height: 170,
        width: 355,
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
              value,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value2,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              value3,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
