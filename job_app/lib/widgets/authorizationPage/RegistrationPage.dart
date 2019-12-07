import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ant_icons/ant_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:job_app/widgets/AppTheme.dart';
import './RegistrationStep.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _passwordRepeatTextController = TextEditingController();
  final _nameTextController = TextEditingController();
  final _surNameTextController = TextEditingController();
  final _pageViewController = PageController();
  var _registrationSteps;

  @override
  void initState() {
    super.initState();
    _registrationSteps = <Widget>[
      RegistrationStep(
        image: "assets/images/undraw_personal_data_29co.svg",
        textController1: _nameTextController,
        icon1: AntIcons.user,
        labelText1: 'Name',
        textController2: _surNameTextController,
        icon2: AntIcons.user,
        labelText2: 'Surname',
      ),
      RegistrationStep(
        image: "assets/images/undraw_messaging_app_ch6t.svg",
        textController1: _emailTextController,
        icon1: AntIcons.mail_outline,
        labelText1: 'Email',
        textController2: _passwordTextController,
        textController3: _passwordRepeatTextController,
        icon2: AntIcons.lock_outline,
        labelText2: 'Password',
      )
    ];
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(
              AntIcons.arrow_right,
              color: Colors.white,
            ),
            onPressed: nextPage,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: _back,
            ),
            title: Text("Create new account"),
          ),
          body: createPageView(),
        ),
      ),
    );
  }

  Widget createPageView() {
    return PageView(
      controller: _pageViewController,
      physics: NeverScrollableScrollPhysics(),
      children: _registrationSteps,
    );
  }

  void nextPage() async {
    if (_pageViewController.page == 1.0) {
      if (_passwordTextController.text != _passwordRepeatTextController.text)
        return;
      FirebaseUser user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailTextController.text,
              password: _passwordTextController.text);
      await Firestore.instance.collection('personalData').add({
        'name': _nameTextController.text,
        'surname': _surNameTextController.text,
        'user': user.uid,
      });
    } else {
      _pageViewController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
  }

  void _back() {
    if (_pageViewController.page == 1.0)
      _pageViewController.previousPage(
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    else
      Navigator.pop(context, false);
  }
}
