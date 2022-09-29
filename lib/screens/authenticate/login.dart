import 'package:flutter/material.dart';
import 'package:motore/services/auth.dart';

class Login extends StatefulWidget {
  final toggleView;
  Login({this.toggleView});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
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
      children: [
        Text(
          "Login",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        //Text("Enter details to get started"),
      ],
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
                return "Password is incorrect ";
              }
              return null;
            },
            onChanged: (val) {
              setState(() => password = val);
            }),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              print('object');
              dynamic result =
                  await _auth.logInWithEmailAndPassword(email, password);
              if (result == null) {
                setState(() => error = 'Log In Failed, Please try Again');
              }
            }
          },
          child: Text(
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            print('Google Pressed');
          },
          child: Container(
            height: 60.0,
            width: 60.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0),
              ],
              // image: DecorationImage(
              //     image: AssetImage('assets/images/google.png')),
            ),
          ),
        ),
      ],
    );

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
