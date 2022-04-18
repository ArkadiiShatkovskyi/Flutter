import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ant_icons/ant_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:job_app/widgets/AppTheme.dart';
import 'package:job_app/widgets/mainPage/MainPage.dart';
import './RegistrationStep.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _passwordRepeatTextController = TextEditingController();
  Widget _registrationStep;

  @override
  void initState() {
    super.initState();
    _registrationStep = RegistrationStep(
      image: "assets/images/undraw_messaging_app_ch6t.svg",
      textController1: _emailTextController,
      icon1: AntIcons.mail_outline,
      labelText1: 'Email',
      textController2: _passwordTextController,
      textController3: _passwordRepeatTextController,
      icon2: AntIcons.lock_outline,
      labelText2: 'Password',
      btnFunction: validateData,
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context, false),
            ),
            title: Text("Create new account"),
          ),
          body: _registrationStep,
        ),
      ),
    );
  }

  void validateData(context) async {
    if (_passwordTextController.text != _passwordRepeatTextController.text)
      return;
    try {
      User user = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _emailTextController.text,
                  password: _passwordTextController.text))
          .user;
      if (user != null) {
        Scaffold.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 2),
          content:
          Text("Nice to meet you. By Arek :)"),
          backgroundColor: Theme.of(context).primaryColor,
        ));
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MainPage()));
      }
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 2),
        content:
            Text("Wrong email format. Password must be at least 6 characters"),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    }
  }
}
