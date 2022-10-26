import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:motore/components/introPageComp.dart';
import 'package:motore/screens/authenticate/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../services/auth.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final controller = PageController();
  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 71, 171, 1),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: PageView(
          controller: controller,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(30.0),
                  child: lottieComp(
                      "https://assets7.lottiefiles.com/packages/lf20_asjtnqce.json"),
                ),
                Container(
                  margin: const EdgeInsets.all(30.0),
                  alignment: Alignment.centerLeft,
                  child: introPara("Be your own mechanic!"),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(15.0),
                  child: lottieComp(
                      "https://assets3.lottiefiles.com/packages/lf20_fiik04re.json"),
                ),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  alignment: Alignment.centerLeft,
                  child: introPara("Track Your Car Expences!"),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: lottieComp(
                      "https://assets6.lottiefiles.com/packages/lf20_svy4ivvy.json"),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15.0),
                  alignment: Alignment.centerLeft,
                  child: introPara("Transport. \nWith. \nEase."),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 280,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      // AuthService().signInWithGoogle();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    icon: Icon(Icons.car_rental),
                    label: Text(
                      "Login",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(0, 71, 171, 100),
                      shape: StadiumBorder(),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GoogleAuthButton(
                  onPressed: () async {
                    AuthService().signInWithGoogle();
                  },
                  style: AuthButtonStyle(
                    iconType: AuthIconType.secondary,
                  ),
                ),
                // AppleAuthButton(
                //   onPressed: () async {},
                //   style: AuthButtonStyle(
                //     iconType: AuthIconType.secondary,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Color.fromRGBO(0, 71, 171, 1),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextButton(
            //     onPressed: () => controller.jumpToPage(2),
            //     child: const Text(
            //       "SKIP",
            //       style: TextStyle(color: Colors.white),
            //     )),
            Center(
              child: SmoothPageIndicator(controller: controller, count: 3),
            ),
            // TextButton(
            //     onPressed: () => controller.nextPage(
            //         duration: const Duration(milliseconds: 500),
            //         curve: Curves.easeInOut),
            //     child:
            //         const Text("NEXT", style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}
