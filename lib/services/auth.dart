import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:motore/models/myuser.dart';
import 'package:motore/navbar.dart';
import 'package:motore/navbar.dart';
import 'package:motore/screens/authenticate/login.dart';

class AuthService {
	// final FirebaseAuth _auth = FirebaseAuth.instance;
	handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
			if (snapshot.hasData) {
				return NavigationExample();
			} else {
				return Login();
			}
        }
    );
}

signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
  	    accessToken: googleAuth.accessToken,
    	idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
}

signOut() {
    FirebaseAuth.instance.signOut();
}

  //create user obj based on FirebaseUser
  // MyUser? _userFromFirebaseUser(User user) {
  //   return user != null ? MyUser(uid: user.uid) : null;
  // }

  // // Auth change user stream
  // Stream<MyUser> get user {
  //   return _auth
  //       .authStateChanges()
  //       .map((User? user) => _userFromFirebaseUser(user!)!);
  // }

  // // sign in anon
  // Future signInAnon() async {
  //   try {
  //     UserCredential result = await _auth.signInAnonymously();
  //     User? user = result.user;
  //     return _userFromFirebaseUser(user!);
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  // //sign in with email password

  // Future logInWithEmailAndPassword(String email, String password) async {
  //   try {
  //     UserCredential result = await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     User? user = result.user;
  //     return _userFromFirebaseUser(user!);
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  // //register with email password

  // Future signUpWithEmailAndPassword(String email, String password) async {
  //   try {
  //     UserCredential result = await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     User? user = result.user;
  //     return _userFromFirebaseUser(user!);
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  // //sign out
  // Future signOut() async {
  //   try {
  //     return await _auth.signOut();
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
}
