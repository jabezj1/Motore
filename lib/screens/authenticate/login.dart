// import 'package:flutter/material.dart';
// import 'package:motore/services/auth.dart';
// import 'package:motore/components/basicPage.dart';
// import 'package:provider/provider.dart';

// class Login extends StatefulWidget {
//   final toggleView;
//   Login({this.toggleView});

//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   // final AuthService _auth = AuthService();
//   final _formKey = GlobalKey<FormState>();

//   //text feild state
//   String email = '';
//   String password = '';
//   String error = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //appBar: AppBar(elevation: 0),
//       resizeToAvoidBottomInset: false,

//       body: Container(
//           margin: const EdgeInsets.all(50),
//           child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   _header(context),
//                   _inputFields(context),
//                   _googleAOth(context),
//                   _appleAOth(context),
//                   _bottomComponents(context),
//                 ],
//               ))
//           // small change
//           //another change
//           ),
//     );
//   }

//   _header(context) {
//     return Column(
//       children: const [PageName("Login")],
//     );
//   }

//   _inputFields(context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         TextFormField(
//             decoration: InputDecoration(
//               hintText: "Email Address",
//               fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
//               filled: true,
//               prefixIcon: const Icon(Icons.email_outlined),
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(18),
//                   borderSide: BorderSide.none),
//             ),
//             validator: (String? val) {
//               if (val!.isEmpty) {
//                 return "Please Enter an Email";
//               }
//               return null;
//             },
//             onChanged: (val) {
//               setState(() => email = val);
//             }),
//         const SizedBox(
//           height: 10,
//         ),
//         TextFormField(
//             decoration: InputDecoration(
//               hintText: "Password",
//               fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
//               filled: true,
//               prefixIcon: const Icon(Icons.password_outlined),
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(18),
//                   borderSide: BorderSide.none),
//             ),
//             obscureText: true,
//             validator: (String? val) {
//               if (val!.length < 6) {
//                 return "Password must at least 6 characters long ";
//               }
//               return null;
//             },
//             onChanged: (val) {
//               setState(() => password = val);
//             }),
//         const SizedBox(
//           height: 10,
//         ),
//         ElevatedButton.icon(
//           onPressed: () async {
//             AuthService().logInWithEmailAndPassword(email, password);

//             // AuthService().signInWithGoogle();
//           },
//           icon: const Icon(Icons.car_rental),
//           label: const Text(
//             "Login",
//             style: TextStyle(fontSize: 20),
//           ),
//           style: ElevatedButton.styleFrom(
//             shape: const StadiumBorder(),
//             padding: const EdgeInsets.symmetric(vertical: 16),
//           ),
//         ),
//         const SizedBox(height: 12.0),
//         Text(
//           error,
//           //style: TextStyle(color: Colors.red, fontSize: 14.0),
//         )
//       ],
//     );
//   }

//   _googleAOth(context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         GestureDetector(
//             onTap: () {
//               AuthService().signInWithGoogle();
//             },
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 0.05),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Container(
//                       margin: const EdgeInsets.all(3),
//                       height: 45.0,
//                       width: 140,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         shape: BoxShape.rectangle,
//                         color: Colors.white,
//                         boxShadow: const [
//                           BoxShadow(
//                               color: Colors.black26,
//                               offset: Offset(0, 2),
//                               blurRadius: 6.0),
//                         ],
//                         image: const DecorationImage(
//                             image: AssetImage('lib/icons/google.png'),
//                             alignment: Alignment.centerLeft),
//                       ),
//                       child: const Align(
//                         alignment: Alignment.centerRight,
//                         child: Text(
//                           "Sign in with Google",
//                           style: TextStyle(
//                               fontSize: 10, fontWeight: FontWeight.bold),
//                         ),
//                       )),
//                 ],
//               ),
//             )),
//       ],
//     );
//   }

//   _appleAOth(context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         GestureDetector(
//             onTap: () {
//               // AuthService().signInWithApple();
//             },
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 15),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Container(
//                       //margin: const EdgeInsets.all(3),

//                       height: 45.0,
//                       width: 140,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         shape: BoxShape.rectangle,
//                         color: Colors.white,
//                         boxShadow: const [
//                           BoxShadow(
//                               color: Colors.black26,
//                               offset: Offset(0, 2),
//                               blurRadius: 6.0),
//                         ],
//                         image: const DecorationImage(
//                             image: AssetImage('lib/icons/apple.png'),
//                             alignment: Alignment.centerLeft),
//                       ),
//                       child: const Align(
//                         alignment: Alignment.centerRight,
//                         child: Text(
//                           "Sign in with Apple",
//                           style: TextStyle(
//                               fontSize: 10, fontWeight: FontWeight.bold),
//                         ),
//                       )),
//                 ],
//               ),
//             )),
//       ],
//     );
//   }

//   _bottomComponents(context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         const Text("New Here?"),
//         TextButton(
//             onPressed: () {
//               widget.toggleView();
//             },
//             child: const Text("Sign Up")),
//         Container(
//             alignment: Alignment.bottomCenter,
//             child: const SizedBox(
//               width: 200.0,
//               height: 200.0,
//               // child: Image.asset(
//               //   'assets/images/Motore_logo.png',
//               // )
//             )),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:motore/screens/authenticate/signup.dart';
import 'package:motore/services/auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motore/components/basicPage.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  final toggleView;
  Login({this.toggleView});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text feild state
  String email = '';
  String password = '';
  String error = '';

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: AppBar(elevation: 0),
      resizeToAvoidBottomInset: false,

      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  _header(context),
                  SizedBox(
                    height: 20,
                  ),
                  _inputFields(context),
                  // _googleAOth(context),
                  // _appleAOth(context),
                  SizedBox(
                    height: 30,
                  ),
                  _login_button(context),
                  SizedBox(
                    height: 0,
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                    indent: 30,
                    endIndent: 30,
                  ),
                  _google(context),
                  // roundedRectButton('Login', [Colors.red, Colors.blue], true),
                  _bottomComponents(context),
                  // _footer(context),
                ],
              ))
          // small change
          //another change
          ),
    );
  }

  _header(context) {
    return Column(
      children: [
        Text(
          "Login",
          style: GoogleFonts.arsenal(
            textStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Schyler'),
          ),
          //   TextStyle(
          //       fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Schyler'),
          // ),
          //Text("Enter details to get started"),
        )
      ],
    );
  }

  _inputFields(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
            decoration: InputDecoration(
              hintText: "Enter your Email Address",
              hintStyle: GoogleFonts.arsenal(
                color: Colors.grey[350],
              ),
              labelStyle: const TextStyle(
                color: Colors.black,
              ),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
              ),
              filled: true,
              floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                  (Set<MaterialState> states) {
                final Color color = states.contains(MaterialState.error)
                    ? Theme.of(context).errorColor
                    : Colors.black26;
                return TextStyle(color: color, letterSpacing: 1.3);
              }),
              prefixIcon: Align(
                  widthFactor: 1.5,
                  heightFactor: 1.5,
                  child: ImageIcon(
                    AssetImage('lib/icons/email.png'),
                    size: 35,
                    // color: Colors.black,
                  )),
              labelText: 'Email',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
            ),
            validator: (String? val) {
              if (val!.isEmpty) {
                return "Please Enter an Email";
              }
              return null;
            },
            onChanged: (val) {
              setState(() => email = val);
            }),
        SizedBox(
          height: 25,
        ),
        TextFormField(
            decoration: InputDecoration(
              hintText: "Enter Password",
              hintStyle: TextStyle(color: Colors.grey[350]),
              labelStyle: const TextStyle(
                color: Colors.black,
              ),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
              ),
              filled: true,
              floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                  (Set<MaterialState> states) {
                final Color color = states.contains(MaterialState.error)
                    ? Theme.of(context).errorColor
                    : Colors.black26;
                return TextStyle(color: color, letterSpacing: 1.3);
              }),
              prefixIcon: Align(
                widthFactor: 1.5,
                heightFactor: 1.5,
                child: ImageIcon(
                  AssetImage('lib/icons/unlock.png'),
                  size: 35,
                  // color: Colors.black,
                ),
              ),
              labelText: 'Password',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
            ),
            obscureText: true,
            validator: (String? val) {
              if (val!.length < 6) {
                return "Password must at least 6 characters long ";
              }
              return null;
            },
            onChanged: (val) {
              setState(() => password = val);
            }),
        // SizedBox(
        //   height: 10,
        // ),

        // ElevatedButton(
        //   onPressed: () async {
        //     if (_formKey.currentState!.validate()) {
        //       print('object');
        //       dynamic result =
        //           await _auth.logInWithEmailAndPassword(email, password);
        //       if (result == null) {
        //         setState(() => error = 'Log In Failed, Please try Again');
        //       }
        //     }
        //   },
        //   child: Text(
        //     "Login",
        //     style: TextStyle(fontSize: 20),
        //   ),
        //   style: ElevatedButton.styleFrom(
        //     shape: StadiumBorder(),
        //     padding: EdgeInsets.symmetric(vertical: 16),
        //   ),
        // ),
        // SizedBox(height: 12.0),
        // Text(
        //   error,
        //   style: TextStyle(color: Colors.red, fontSize: 14.0),
        // )
      ],
    );
  }

  _google(context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              child: GestureDetector(
                onTap: () async {
                  AuthService().signInWithGoogle();
                },
                child: Image.asset(
                  'lib/icons/google.png',
                  // fit: BoxFit.fitWidth,
                  // alignment: Alignment.center,
                ),
              ),
            ),
          ],
        ));
  }

  //login button component
  _login_button(context) {
    return Column(
      children: [
        loading
            ? Row(children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 24,
                ),
                Text('Please wait...'),
              ])
            : Container(
                child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        loading = true;
                      });
                      await Future.delayed(Duration(seconds: 4));
                      if (_formKey.currentState!.validate()) {
                        print('object');
                        dynamic result = await AuthService()
                            .logInWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(
                              () => error = 'Log In Failed, Please try Again');
                        }
                      }
                      setState(() {
                        loading = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        )),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient:
                              LinearGradient(colors: [Colors.red, Colors.blue]),
                          borderRadius: BorderRadius.circular(40)),
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )),
              ),
        SizedBox(
          height: 30,
        ),
        Text(
          error,
          //style: TextStyle(color: Colors.red, fontSize: 14.0),
        )
      ],
    );
  }

  // _login_button(context) {
  //   return Container(
  //     alignment: Alignment.center,
  //     width: MediaQuery.of(context).size.width / 1.7,
  //     decoration: ShapeDecoration(
  //       shape:
  //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
  //       gradient: LinearGradient(
  //           colors: [Colors.blue, Colors.red],
  //           begin: Alignment.topLeft,
  //           end: Alignment.bottomRight),
  //     ),
  //     child: ElevatedButton(
  //       onPressed: () async {
  //         if (_formKey.currentState!.validate()) {
  //           print('object');
  //           dynamic result =
  //               await _auth.logInWithEmailAndPassword(email, password);
  //           if (result == null) {
  //             setState(() => error = 'Log In Failed, Please try Again');
  //           }
  //         }
  //       },
  //       child: Text(
  //         "Login",
  //         style: TextStyle(
  //             fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
  //       ),
  //       style: ElevatedButton.styleFrom(
  //         padding: EdgeInsets.only(top: 16, bottom: 16),
  //         primary: Colors.transparent,
  //         onSurface: Colors.transparent,
  //         // shadowColor: Colors.transparent,
  //       ),

  //       // style: ElevatedButton.styleFrom(
  //       //   shape: StadiumBorder(),
  //       //   padding: EdgeInsets.symmetric(vertical: 16),
  //       // ),
  //     ),
  //   );
  //   SizedBox(height: 12.0);
  //   Text(
  //     error,
  //     style: TextStyle(color: Colors.red, fontSize: 14.0),
  //   );
  // }

  _googleAOth(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        GestureDetector(
            onTap: () {
              AuthService().signInWithGoogle();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.all(3),
                      height: 45.0,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6.0),
                        ],
                        image: const DecorationImage(
                            image: AssetImage('lib/icons/google.png'),
                            alignment: Alignment.centerLeft),
                      ),
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Sign in with Google",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
            )),
      ],
    );
  }

  _bottomComponents(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "New Here?",
          style: GoogleFonts.poppins(fontSize: 15),
        ),
        SizedBox(
          height: 0,
        ),
        TextButton(
            onPressed: () async {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Signup()));
            },
            child: Text(
              "Sign Up",
              style: GoogleFonts.poppins(
                fontSize: 15,
              ),
            )),
        Image.asset(
          'lib/icons/BreakCheck_logo.png',
          height: 200,
          width: 200,
        )
      ],
    );
  }
}

// Button for testing purposes
