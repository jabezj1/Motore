import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:motore/pages/InspectPastMaintenance.dart';
import 'package:motore/pages/createHistoryEntry.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.red,
          Color(0xff15aaaff),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: const Text(
            'History',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: Container(
              // decoration: const BoxDecoration(
              //   gradient: LinearGradient(colors: [
              //     Color(0xff15aaaff),
              //     Color(0xFFADF7F2),
              //   ]),
              // ),
              ),
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              // alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 25),
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
                              // gradient: LinearGradient(
                              //     colors: [
                              //       Colors.red,
                              //       Color(0xff15aaaff),
                              //     ],
                              //     begin: Alignment.topCenter,
                              //     end: Alignment.bottomCenter),
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
                  SizedBox(
                    height: 160,
                  ),
                  // SizedBox(
                  //   height: 170,
                  //   width: 170,
                  //   child: OverflowBox(
                  //     // minHeight: 170,
                  //     // minWidth: 170,
                  //     child: Lottie.network(
                  //         'https://assets1.lottiefiles.com/packages/lf20_hvZQkG.json'),
                  //   ),
                  // ),

                  // TODO: use stateful values
                  const HistoryWidget(
                      imageLink: "lib/icons/expense.png",
                      contTitle: "Monthly Expenses",
                      descText: "This month's expenses: \n",
                      value: "5000"),
                  const HistoryWidget(
                      imageLink: "lib/icons/oil_two.png",
                      contTitle: "Gas Expenses",
                      descText: "Last fuelup cost: \n",
                      value: "50"),
                  const HistoryWidget(
                      imageLink: "lib/icons/past.png",
                      contTitle: "Maintenance History",
                      descText: "Date of last maintenance: \n",
                      value: "01/01/01"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({
    Key? key,
    required this.imageLink,
    required this.contTitle,
    required this.descText,
    required this.value,
  }) : super(key: key);

  final String imageLink;
  final String contTitle;
  final String descText;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const InspectPastMaintenance()),
        ),
        child: SizedBox(
          height: 140,
          width: 360,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 111,
                // color: Colors.white.withOpacity(0.5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  //   gradient: const LinearGradient(colors: [
                  //     Color(0xff15aaaff),
                  //     Color(0xFFADF7F2),
                  //   ]),
                  borderRadius: BorderRadius.circular(20),
                  //   boxShadow: const [
                  //     BoxShadow(
                  //       blurRadius: 30,
                  //       offset: Offset(8, 10),
                  //       color: Color.fromARGB(255, 133, 178, 214),
                  //     ),
                  //   ],
                ),
              ),
              Container(
                // height: 400,
                // width: 350,
                margin: const EdgeInsets.only(
                  right: 220,
                  bottom: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: AssetImage(imageLink)),
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 100,
                margin: const EdgeInsets.only(left: 140, top: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contTitle,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      RichText(
                          text: TextSpan(
                              text: descText,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              children: [
                            TextSpan(
                                text: value,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ))
                          ]))
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
