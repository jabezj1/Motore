import 'package:flutter/material.dart';
import 'package:motore/screens/authenticate/signup.dart';
import 'package:motore/services/auth.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(elevation: 0),
      resizeToAvoidBottomInset: false,

      body: Container(
          margin: const EdgeInsets.all(50),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _header(context),
                  _inputFields(context),
                  _googleAOth(context),
                  _appleAOth(context),
                  _bottomComponents(context),
                ],
              ))
          // small change
          //another change
          ),
    );
  }

  _header(context) {
    return Column(
      children: const [PageName("Login")],
    );
  }

  _inputFields(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
            decoration: InputDecoration(
              hintText: "Email Address",
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.email_outlined),
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
              hintText: "Password",
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.password_outlined),
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
        ElevatedButton.icon(
          onPressed: () async {
            AuthService().logInWithEmailAndPassword(email, password);

            // AuthService().signInWithGoogle();
          },
          icon: const Icon(Icons.car_rental),
          label: const Text(
            "Login",
            style: TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
        const SizedBox(height: 12.0),
        Text(
          error,
          //style: TextStyle(color: Colors.red, fontSize: 14.0),
        )
      ],
    );
  }

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

  _appleAOth(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        GestureDetector(
            onTap: () {
              // AuthService().signInWithApple();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      //margin: const EdgeInsets.all(3),

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
                            image: AssetImage('lib/icons/apple.png'),
                            alignment: Alignment.centerLeft),
                      ),
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Sign in with Apple",
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text("New Here?"),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Signup()),
              );
            },
            child: const Text("Sign Up")),
        Container(
            alignment: Alignment.bottomCenter,
            child: const SizedBox(
              width: 200.0,
              height: 200.0,
              // child: Image.asset(
              //   'assets/images/Motore_logo.png',
              // )
            )),
      ],
    );
  }
}
