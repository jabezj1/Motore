import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  final toggleView;
  Signup({this.toggleView});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(elevation: 0),
      resizeToAvoidBottomInset: false,

      body: Container(
          margin: const EdgeInsets.all(24),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _header(context),
                  _inputFields(context),
                  _googleAOth(context),
                  _appleAOth(context),
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
      children: const [
        Text(
          "Sign Up",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
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
            hintText: "Username",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.person),
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
        TextField(
          decoration: InputDecoration(
            hintText: "Retype Password",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.password_outlined),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
          ),
          obscureText: true,
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () async {
            // if (_formKey.currentState!.validate()) {
            //   dynamic result =
            //       await _auth.signUpWithEmailAndPassword(email, password);
            //   if (result == null) {
            //     setState(() => error = 'Please Provide a Valid Email');
            //   }
            // }
          },
          child: const Text(
            "Create Account",
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
          style: const TextStyle(color: Colors.red, fontSize: 14.0),
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
              print('Google Pressed');
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
        const Text("Already have an account?"),
        TextButton(
            onPressed: () {
              widget.toggleView();
            },
            child: const Text("Login")),
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
