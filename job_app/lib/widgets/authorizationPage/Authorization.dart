import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import './SignInPage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Authorization {
  String user;
  bool _isLoading = false;

  Future<bool> signInWithEmail(email, password, navigatorKey) async {

    User user;
    /**  NEW CODE **/
    //this._isLoading = false;

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
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
    /**
    try {
      user = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      )).user;
    } catch (e) {
      this._isLoading = false;
      print(e.toString());
    }
    this._isLoading = false;
    return user != null;
    **/
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
      /**
      FirebaseAuth.instance.currentUser().then((firebaseUser) {
        if (firebaseUser == null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SingInPage()));
        }
      });
      **/
    }
  }

  Future<bool> signUpWithEmail(email, password) async {
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
