import 'package:flutter/material.dart';
import 'package:motore/navbar.dart';
import 'package:motore/pages/History.dart';
import 'package:motore/pages/createHistoryEntry.dart';

class InspectPastMaintenance extends StatelessWidget {
  const InspectPastMaintenance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
				automaticallyImplyLeading: false,
				title: const Text(
					'Past Maintenance',
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CreateHistoryEntry(
                        title: "a",
                      )),
            );
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 27, 156, 216),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NavigationExample()),
                );
              },
              child: const Text('Go Back'),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),

              // child: ClipRRect(
              // borderRadius: BorderRadius.circular(30),
              child: HistorySec(
                value: "Oil Change @ 116,092 miles",
                value2: "08/16/22",
                value3: " Cost: ",
                value4: "\$75",
                value5: " Oil Type ",
                value6: "Full Synthetic",
                value7: " Location: ",
                value8: "At home",
                value9: " Shop: ",
                value10: "N/A",
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),

              // child: ClipRRect(
              // borderRadius: BorderRadius.circular(30),
              child: HistorySec(
                value: "Oil Change @ 116,092 miles",
                value2: "08/16/22",
                value3: " Cost: ",
                value4: "\$75",
                value5: " Oil Type ",
                value6: "Full Synthetic",
                value7: " Location: ",
                value8: "At home",
                value9: " Shop: ",
                value10: "N/A",
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),

              // child: ClipRRect(
              // borderRadius: BorderRadius.circular(30),
              child: HistorySec(
                value: "Oil Change @ 116,092 miles",
                value2: "08/16/22",
                value3: " Cost: ",
                value4: "\$75",
                value5: " Oil Type ",
                value6: "Full Synthetic",
                value7: " Location: ",
                value8: "At home",
                value9: " Shop: ",
                value10: "N/A",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HistorySec extends StatelessWidget {
  const HistorySec({
    Key? key,
    required this.value,
    required this.value2,
    required this.value3,
    required this.value4,
    required this.value5,
    required this.value6,
    required this.value7,
    required this.value8,
    required this.value9,
    required this.value10,
  }) : super(key: key);
  final String value;
  final String value2;
  final String value3;
  final String value4;
  final String value5;
  final String value6;
  final String value7;
  final String value8;
  final String value9;
  final String value10;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 150, 206, 232),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0,
              spreadRadius: 5.0,
              offset: Offset(
                5.0,
                5.0,
              ),
            )
          ]),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      height: 250,
      width: 380,
      // color: Color.fromARGB(255, 150, 206, 232),
      child: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Text(
                value,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                value2,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              Row(
                children: [
                  Text(
                    value3,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      value4,
                      style: (const TextStyle(
                        fontSize: 20,
                      )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 9,
              ),
              Row(
                children: [
                  Text(
                    value5,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      value6,
                      style: (const TextStyle(
                        fontSize: 20,
                      )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 9,
              ),
              Row(
                children: [
                  Text(
                    value7,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      value8,
                      style: (const TextStyle(
                        fontSize: 20,
                      )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 9,
              ),
              Row(
                children: [
                  Text(
                    value9,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      value10,
                      style: (const TextStyle(
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
    );
  }
}
