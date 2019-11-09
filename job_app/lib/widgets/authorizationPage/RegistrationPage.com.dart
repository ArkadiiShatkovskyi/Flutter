import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ant_icons/ant_icons.dart';

import 'package:job_app/widgets/AppTheme.dart';

class RegistrationPage extends StatelessWidget {
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
                  title: Text("Create new account"),
                ),
                body: RegistrationPageBody(navigatorKey))));
  }
}

class RegistrationPageBody extends StatefulWidget {
  RegistrationPageBody(GlobalKey key);

  @override
  State createState() => _RegistrationPageBodyState();
}

class _RegistrationPageBodyState extends State<RegistrationPageBody> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
//  Authorization _db = Authorization();

  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        child: ListView(
          children: <Widget>[
            Container(
              child: Center(
                child: Text(
                  "Create an account",
                  style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
                ),
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
                  left: media.size.width * .25, right: media.size.width * .25),
              child: RaisedButton(
                textColor: Colors.white,
                padding: const EdgeInsets.all(20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                onPressed: () => {},
                child: Text(
                  "Create an account",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
