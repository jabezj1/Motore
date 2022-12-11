import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../navbar.dart';
import '../../services/auth.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  final toggleView;
  Signup({this.toggleView});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(elevation: 0),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,

      body: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 48,
                  ),
                  _header(context),
                  SizedBox(
                    height: 5,
                  ),
                  _inputFields(context),
                  _signup_button(context),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                    indent: 30,
                    endIndent: 30,
                  ),
                  _googleAOth(context),
                  // _appleAOth(context),
                  _loginInfo(context),
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
          "Sign Up",
          style: GoogleFonts.arsenal(
            textStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Schyler'),
          ),
        ),
        //Text("Enter details to get started"),
      ],
    );
  }

  _inputFields(ontext) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: "Enter Username",
            hintStyle: GoogleFonts.arsenal(
              color: Colors.grey[350],
            ),
            labelStyle: const TextStyle(
              color: Colors.black,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            // fillColor: Colors.grey,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            filled: true,
            floatingLabelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Theme.of(context).errorColor
                  : Colors.black26;
              return TextStyle(color: color, letterSpacing: 1.3);
            }),

            prefixIcon: Align(
                widthFactor: 1.5,
                heightFactor: 1.5,
                child: ImageIcon(
                  AssetImage('lib/icons/user.png'),
                  size: 35,
                  // color: Colors.black,
                )),
            labelText: 'Username',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
          ),
          validator: (String? val) {
            if (val!.isEmpty) {
              return "Please Enter a Username";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
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
        const SizedBox(
          height: 10,
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
        const SizedBox(
          height: 10,
        ),
        TextField(
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
            floatingLabelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
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
            labelText: 'Retype Password',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
          ),
          obscureText: true,
        ),
        // ElevatedButton(
        // onPressed: () async {
        // if (_formKey.currentState!.validate()) {
        //   dynamic result =
        //       await _auth.signUpWithEmailAndPassword(email, password);
        //   if (result == null) {
        //     setState(() => error = 'Please Provide a Valid Email');
        //   }
        // }
        // },
        //   child: const Text(
        //     "Create Account",
        //     style: TextStyle(fontSize: 20),
        //   ),
        //   style: ElevatedButton.styleFrom(
        //     shape: const StadiumBorder(),
        //     padding: const EdgeInsets.symmetric(vertical: 16),
        //   ),
        // ),
        const SizedBox(height: 5.0),
        Text(
          error,
          style: const TextStyle(color: Colors.red, fontSize: 14.0),
        )
      ],
    );
  }

  _signup_button(context) {
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
                        dynamic result = await AuthService()
                            .signUpWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(
                              () => error = 'Please Provide a Valid Email');
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Navigation()));
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
                          "Sign Up",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )),
              ),
        // SizedBox(
        //   height: 10,
        // ),
        // Text(
        //   error,
        //   //style: TextStyle(color: Colors.red, fontSize: 14.0),
        // )
      ],
    );
  }

  _googleAOth(context) {
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

  // return ElevatedButton(
  //   onPressed: () async {
  //     dynamic result = await _auth.signInAnon();
  //     if (result == null) {
  //       print('Error loging in!');
  //     } else {
  //       print('Signed in');
  //       print(result);
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
  // );

  // _googleAOth(context) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: <Widget>[
  //       GestureDetector(
  //         onTap: () => debugPrint('LOGIN With Google'),
  //         child: Container(
  //           height: 60.0,
  //           width: 60.0,
  //           decoration: const BoxDecoration(
  //             shape: BoxShape.circle,
  //             color: Colors.white,
  //             boxShadow: [
  //               BoxShadow(
  //                   color: Colors.black26,
  //                   offset: Offset(0, 2),
  //                   blurRadius: 6.0),
  //             ],
  //              image: DecorationImage(
  //                  image: AssetImage('assets/images/google.png')),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  _loginInfo(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Already have an account?",
          style: GoogleFonts.poppins(fontSize: 15),
        ),
        TextButton(
            onPressed: () {
              widget.toggleView();
            },
            child: Text(
              "Login",
              style: GoogleFonts.poppins(
                fontSize: 15,
              ),
            )),
        Image.asset(
          'lib/icons/BreakCheck_logo.png',
          height: 150,
          width: 200,
          // fit: BoxFit.fitWidth,
          // alignment: Alignment.center,
        )
      ],
    );
  }
}
