import 'package:flutter/material.dart';
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
          margin: EdgeInsets.all(50),
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
      children: [const pageName("Log in")],
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
              prefixIcon: Icon(Icons.email_outlined),
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
          height: 10,
        ),
        TextFormField(
            decoration: InputDecoration(
              hintText: "Password",
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: Icon(Icons.password_outlined),
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
        SizedBox(
          height: 10,
        ),
        ElevatedButton.icon(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              print('object');
              dynamic result = await AuthService()
                  .logInWithEmailAndPassword(email, password);
              if (result == null) {
                setState(() => error = 'Log In Failed, Please try Again');
              }
            }
            // AuthService().signInWithGoogle();
          },
          icon: Icon(Icons.car_rental),
          label: Text(
            "Login",
            style: TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        ),
        SizedBox(height: 12.0),
        Text(
          error,
          style: TextStyle(color: Colors.red, fontSize: 14.0),
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
              padding: EdgeInsets.symmetric(vertical: 0.05),
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
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6.0),
                        ],
                        image: DecorationImage(
                            image: AssetImage('lib/icons/google.png'),
                            alignment: Alignment.centerLeft),
                      ),
                      child: Align(
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

  _appleAOth(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        GestureDetector(
            onTap: () {
              print('Google Pressed');
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
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
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6.0),
                        ],
                        image: DecorationImage(
                            image: AssetImage('lib/icons/apple.png'),
                            alignment: Alignment.centerLeft),
                      ),
                      child: Align(
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
        Text("New Here?"),
        TextButton(
            onPressed: () {
              widget.toggleView();
            },
            child: Text("Sign Up")),
        Container(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
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
