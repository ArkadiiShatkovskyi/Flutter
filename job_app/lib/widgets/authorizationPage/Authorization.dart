import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import './SignInPage.dart';

class Authorization {
  String user;
  bool _isLoading = false;

  Future<bool> signInWithEmail(email, password, navigatorKey) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User user;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      this._isLoading = false;
      print(e.toString());
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
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
      User user = FirebaseAuth.instance.currentUser;
      if(user == null){
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SingInPage()));
      }
    }
  }

  Future<bool> signUpWithEmail(email, password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User user;
    try {
      user = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      )) as User;
    } catch (e) {
      print(e.toString());
    }
    return user != null;
  }

  Future<User> getUser() async {
    await Firebase.initializeApp();
    FirebaseAuth _auth = FirebaseAuth.instance;
    return _auth.currentUser;
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
