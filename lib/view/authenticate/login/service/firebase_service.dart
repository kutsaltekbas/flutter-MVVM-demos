import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseServices {
  static final FirebaseServices _instance = FirebaseServices._init();

  static FirebaseServices get instance => _instance;
  late FirebaseAuth auth = FirebaseAuth.instance;
  bool userSignIn = false;
  FirebaseServices._init();
  Future<void> loginFirebase(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        userSignIn = true;
      }
    });

  }
}
