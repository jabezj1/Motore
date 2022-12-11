import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:motore/components/introPageComp.dart';
import 'package:motore/screens/authenticate/login.dart';
import 'package:motore/screens/authenticate/signup.dart';
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
      backgroundColor: const Color.fromRGBO(0, 71, 171, 1),
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
                  child: Lottie.network(
                      "https://assets7.lottiefiles.com/packages/lf20_asjtnqce.json"),
                ),
                Container(
                  margin: const EdgeInsets.all(30.0),
                  alignment: Alignment.centerLeft,
                  child: const IntroPara("Be your own mechanic!"),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(15.0),
                  child: Lottie.network(
                      "https://assets8.lottiefiles.com/packages/lf20_06a6pf9i.json"),
                ),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  alignment: Alignment.centerLeft,
                  child: const IntroPara("Save Your Money, \nAnd Your Car."),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: Lottie.network(
                      "https://assets6.lottiefiles.com/packages/lf20_svy4ivvy.json"),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15.0),
                  alignment: Alignment.centerLeft,
                  child: const IntroPara("Transport. \nWith. \nEase."),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          // AuthService().signInWithGoogle();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        icon: const Icon(Icons.car_rental),
                        label: const Text(
                          "Login",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(0, 71, 171, 100),
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          // AuthService().signInWithGoogle();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signup()));
                        },
                        icon: const Icon(Icons.new_label),
                        label: const Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(0, 71, 171, 100),
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GoogleAuthButton(
                  onPressed: () async {
                    AuthService().signInWithGoogle();
                  },
                  style: const AuthButtonStyle(
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
        color: const Color.fromRGBO(0, 71, 171, 1),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 40,
            ),

            // TextButton(
            //     onPressed: () => controller.jumpToPage(2),
            //     child: const Text(
            //       "SKIP",
            //       style: TextStyle(color: Colors.white),
            //     )),
            Center(
              child: SmoothPageIndicator(controller: controller, count: 3),
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () => controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut), // Image tapped
                child: Lottie.network(
                    'https://assets10.lottiefiles.com/packages/lf20_vOtfdf.json'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
