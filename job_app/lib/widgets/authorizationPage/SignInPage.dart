import 'dart:async';

import 'package:flutter/material.dart';

import 'package:ant_icons/ant_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:job_app/widgets/authorizationPage/Authorization.dart';
import 'package:job_app/widgets/authorizationPage/RegistrationPage.dart';
import 'package:job_app/widgets/mainPage/MainPage.dart';
import '../AppTheme.dart';

class SingInPage extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: appTheme,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
                appBar: AppBar(
                  title: Text("Sign In"),
                ),
                body: SignInPageBody(navigatorKey))));
  }
}

class SignInPageBody extends StatefulWidget {
  SignInPageBody(GlobalKey key);

  @override
  State createState() => _SignInPageBodyState();
}

class _SignInPageBodyState extends State<SignInPageBody> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool _isLoading = false;
  Authorization _db = Authorization();

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    _db.getUser().then((user) {
      if (user != null) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MainPage()));
      }
    });
  }

  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        child: ListView(
          children: <Widget>[
            Container(
              width: media.size.width * .5,
              height: media.size.height * .35,
              margin: const EdgeInsets.only(bottom: 20),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 48.0,
                child: SvgPicture.asset(
                    "assets/images/undraw_mobile_login_ikmv.svg"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: media.size.width * .1, right: media.size.width * .1),
              child: TextFormField(
                maxLines: 1,
                maxLength: 30,
                obscureText: false,
                decoration: InputDecoration(
                  icon: Icon(
                    AntIcons.mail_outline,
                    color: Theme.of(context).primaryColor,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                controller: _emailTextController,
              ),
            ),
            Divider(
              color: Colors.transparent,
              height: media.size.height * .01,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: media.size.width * .1, right: media.size.width * .1),
              child: TextFormField(
                maxLines: 1,
                maxLength: 20,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(
                    AntIcons.lock_outline,
                    color: Theme.of(context).primaryColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                controller: _passwordTextController,
              ),
            ),
            Divider(
              color: Colors.transparent,
              height: media.size.height * .01,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: media.size.width * .25, right: media.size.width * .25),
              child: ElevatedButton(
                onPressed: _signInWithEmail,
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(20.0),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                ),
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            TextButton(
              child: Text("Create an account",
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).primaryColor)),
              onPressed: _showRegistrationPage,
            ),
            _showCircularProgress(),
          ],
        ),
      ),
    );
  }

  void _signInWithEmail() async {
    _db.setIsLoading();
    setState(() {
      _isLoading = _db.setToLoad();
    });
    _db
        .signInWithEmail(
            _emailTextController.text, _passwordTextController.text, widget.key)
        .then((answer) {
      if (answer == true) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MainPage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 2),
          content: Text("Wrong password or email"),
          backgroundColor: Theme.of(context).primaryColor,
        ));
      }
    });
    if (this.mounted) {
      Timer(Duration(seconds: 3), () {
        setState(() {
          _db.stopLoading();
          _isLoading = _db.setToLoad();
        });
      });
    }
  }

  void _showRegistrationPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RegistrationPage()));
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }
}
