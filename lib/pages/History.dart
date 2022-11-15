import 'package:flutter/material.dart';
import 'package:motore/pages/InspectPastMaintenance.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'History',
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      height: 120,
                      decoration: const BoxDecoration(
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
            const SizedBox(
              width: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(0),
              child: HistoryWidget(
                value: "lib/icons/expense.png",
                value2: "Monthly Expenses",
                value3: "Your Monthly Expenses are: \n",
                value4: "\$523",
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(0),
              child: HistoryWidget(
                value: "lib/icons/oil_two.png",
                value2: "Oil Changes",
                value3: "Last Oil Change: \n",
                value4: "09/14/22",
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(0),
              child: HistoryWidget(
                value: "lib/icons/past.png",
                value2: "Past Maintenance",
                value3: "Your Last Maintenance: \n",
                value4: "10/04/22",
              ),
            ),
          ],
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
        MaterialPageRoute(builder: (context) => const InspectPastMaintenance()),
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
                gradient: const LinearGradient(colors: [
                  Color(0xff15aaaff),
                  Color(0xFFADF7F2),
                ]),
                //color: Color.fromARGB(255, 150, 206, 232),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
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
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                        text: TextSpan(
                            text: value3,
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                          TextSpan(
                              text: value4,
                              style: const TextStyle(
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
