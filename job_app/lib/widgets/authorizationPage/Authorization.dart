import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import './SignInPage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Authorization {
  String user;
  bool _isLoading = false;

  Future<bool> signInWithEmail(email, password, navigatorKey) async {
    FirebaseUser user;
    try {
      user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      this._isLoading = false;
      print(e.toString());
//      print("wrong pass");
    }
    this._isLoading = false;
    return user != null;
  }

  void signOut(context) async {
    try {
      await FirebaseAuth.instance.signOut();
      //await widget.auth.signOut();
    } catch (e) {
      print(e);
    } finally {
      FirebaseAuth.instance.currentUser().then((firebaseUser) {
        if (firebaseUser == null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SingInPage()));
        }
      });
    }
  }

  Future<bool> signUpWithEmail(email, password) async {
    FirebaseUser user;
    try {
      user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print(e.toString());
    }
    return user != null;
  }

  Future<FirebaseUser> getUser() async {
    return await _auth.currentUser();
  }

  bool setToLoad() {
    return _isLoading;
  }

  void setIsLoading() {
    this._isLoading = true;
  }

  void stopLoading(){
    this._isLoading = false;
  }
}
