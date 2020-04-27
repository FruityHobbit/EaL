import 'package:firebase_auth/firebase_auth.dart';
import 'package:full_app/login_page/LoginPage.dart';
import 'package:full_app/AfterLoginPage/home.dart';
import 'package:flutter/material.dart';

class AuthService {
  //Handle Authentication
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Home();
        } else {
          return LoginPage();
        }
      },
    );
  }

  //Sign Out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //Sign in
  signIn(email, password) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) {
      print('Signed in');
    }).catchError((e) {
      print(e);
    });
  }
}
