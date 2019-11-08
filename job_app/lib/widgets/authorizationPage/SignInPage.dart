import 'dart:async';

import 'package:flutter/material.dart';

import 'package:ant_icons/ant_icons.dart';

import 'package:job_app/widgets/AppTheme.dart';

class SingInPage extends StatelessWidget{

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
    body: SingInPageBody())));
  }
}

class SingInPageBody extends StatefulWidget {
  @override
  State createState() => _SignInPageBodyState();
}

class _SignInPageBodyState extends State<SingInPageBody> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool _isLoading = false;


  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Center(
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              child: ListView(
                children: <Widget>[
                  Container(
                    width: media.size.width * .5,
                    height: media.size.height * .35,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 48.0,
                      child: Image.asset(
                          "assets/images/undraw_mobile_login_ikmv.png"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: media.size.width * .1,
                        right: media.size.width * .1),
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
                        left: media.size.width * .1,
                        right: media.size.width * .1),
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
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Password',
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
                        left: media.size.width * .25,
                        right: media.size.width * .25),
                    child: RaisedButton(
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(20.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () => {},
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  FlatButton(
                    child: Text("Create an account",
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w300)),
                    onPressed: () => {},
                  ),
                  _showCircularProgress(),
                ],
              ),
            ),
          );
  }

//  void

  void _showLoadingIndicator() {
    Timer(Duration(seconds: 3), () {
      setState(() {
        this._isLoading = false;
      });
    });

    setState(() {
      this._isLoading = true;
    });
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
