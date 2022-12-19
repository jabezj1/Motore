import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motore/pages/InspectPastMaintenance.dart';
import 'package:motore/pages/InspectGas.dart';
import 'package:motore/pages/InspectExpenses.dart';

String historyType = "";

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.white,
          Colors.red,
          Color(0xff15aaaff),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Text('History',
              style: GoogleFonts.josefinSans(
                color: Colors.blue,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: false,
          elevation: 0,
          flexibleSpace: Container(
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
											height: MediaQuery.of(context).size.height / 2.5,
											width: MediaQuery.of(context).size.height / 2.5,
											child: Image.asset('lib/images/noBgAnimation.gif')
										),
									],
								),
							],
						),
						Padding(
							padding: const EdgeInsets.all(0),
							child: GestureDetector(
								onTap: () {
									Navigator.push(
										context,
										MaterialPageRoute(builder: (context) => const InspectPastMaintenance()),
									);
								},
								child: SizedBox(
									height: 140,
									width: 360,
									child: Stack(
										children: [
											Container(
												alignment: Alignment.center,
												width: MediaQuery.of(context).size.width,
												height: 111,
												decoration: BoxDecoration(
													color: Colors.white.withOpacity(0.5),
													borderRadius: BorderRadius.circular(20),
												),
											),
											Container(
												margin: const EdgeInsets.only(
													right: 220,
													bottom: 20
												),
												decoration: BoxDecoration(
													borderRadius: BorderRadius.circular(20),
													image: const DecorationImage(image: AssetImage("lib/icons/past.png"))
												),
											),
											Container(
												width: double.maxFinite,
												height: 100,
												margin: const EdgeInsets.only(left: 140, top: 10),
												child: Column(
													crossAxisAlignment: CrossAxisAlignment.center,
													children: const [
														SizedBox(height: 40),
														Text(
															"Service History",
															style: TextStyle(
																color: Colors.black,
																fontSize: 20,
																fontWeight: FontWeight.bold,
															),
														),
														SizedBox(height: 15)
													]
												),
											),
										],
									),
								),
							),
						),
						Padding(
							padding: const EdgeInsets.all(0),
							child: GestureDetector(
								onTap: () {
									Navigator.push(
										context,
										MaterialPageRoute(builder: (context) => const InspectGas()),
									);
								},
								child: SizedBox(
									height: 140,
									width: 360,
									child: Stack(
										children: [
											Container(
												alignment: Alignment.center,
												width: MediaQuery.of(context).size.width,
												height: 111,
												decoration: BoxDecoration(
													color: Colors.white.withOpacity(0.5),
													borderRadius: BorderRadius.circular(20),
												),
											),
											Container(
												margin: const EdgeInsets.only(
													right: 220,
													bottom: 20
												),
												decoration: BoxDecoration(
													borderRadius: BorderRadius.circular(20),
													image: const DecorationImage(image: AssetImage("lib/icons/oil_two.png"))
												),
											),
											Container(
												width: double.maxFinite,
												height: 100,
												margin: const EdgeInsets.only(left: 140, top: 10),
												child: Column(
													crossAxisAlignment: CrossAxisAlignment.center,
													children: const [
														SizedBox(height: 40),
														Text(
															"Gas & Trips",
															style: TextStyle(
																color: Colors.black,
																fontSize: 20,
																fontWeight: FontWeight.bold,
															),
														),
														SizedBox(height: 15)
													]
												),
											),
										],
									),
								),
							),
						),
						Padding(
							padding: const EdgeInsets.all(0),
							child: GestureDetector(
								onTap: () {
									Navigator.push(
										context,
										MaterialPageRoute(builder: (context) => const InspectExpenses()),
									);
								},
								child: SizedBox(
									height: 140,
									width: 360,
									child: Stack(
										children: [
											Container(
												alignment: Alignment.center,
												width: MediaQuery.of(context).size.width,
												height: 111,
												decoration: BoxDecoration(
													color: Colors.white.withOpacity(0.5),
													borderRadius: BorderRadius.circular(20),
												),
											),
											Container(
												margin: const EdgeInsets.only(
													right: 220,
													bottom: 20
												),
												decoration: BoxDecoration(
													borderRadius: BorderRadius.circular(20),
													image: const DecorationImage(image: AssetImage("lib/icons/expense.png"))
												),
											),
											Container(
												width: double.maxFinite,
												height: 100,
												margin: const EdgeInsets.only(left: 140, top: 10),
												child: Column(
													crossAxisAlignment: CrossAxisAlignment.center,
													children: const [
														SizedBox(height: 40),
														Text(
															"Expenses",
															style: TextStyle(
																color: Colors.black,
																fontSize: 20,
																fontWeight: FontWeight.bold,
															),
														),
														SizedBox(height: 15)
													]
												),
											),
										],
									),
								),
							),
						),
					// TODO: use stateful values
					// const HistoryWidget(
					// 	imageLink: "lib/icons/expense.png",
					// 	contTitle: "Monthly Expenses",
					// ),
					// const HistoryWidget(
					// 	imageLink: "lib/icons/oil_two.png",
					// 	contTitle: "Gas Expenses",
					// ),
					// const HistoryWidget(
					// 	imageLink: "lib/icons/past.png",
					// 	contTitle: "Maintenance History",
					// ),
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
  }) : super(key: key);

  final String imageLink;
  final String contTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const InspectPastMaintenance()),
          );
          historyType = contTitle;
        },
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        contTitle,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
