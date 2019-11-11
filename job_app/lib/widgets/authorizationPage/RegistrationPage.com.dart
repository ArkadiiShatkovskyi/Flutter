import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ant_icons/ant_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:job_app/widgets/AppTheme.dart';
import './FieldWidget.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _nameTextController = TextEditingController();
  final _surNameTextController = TextEditingController();

//  Authorization _db = Authorization();

  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(child: Icon(AntIcons.arrow_right, color: Colors.white,), onPressed: () => {},),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          appBar: AppBar(
            title: Text("Create new account"),
          ),
          body: Center(
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: media.size.width * .5,
                    height: media.size.height * .3,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: SvgPicture.asset(
                        "assets/images/undraw_personal_data_29co.svg"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FieldWidget(
                      width: media.size.width,
                      icon: AntIcons.user,
                      textController: _nameTextController,
                      labelText: 'Name'),
                  SizedBox(height: 10),
                  FieldWidget(
                      width: media.size.width,
                      icon: AntIcons.user,
                      textController: _surNameTextController,
                      labelText: 'Surname'),
                  SizedBox(height: 10),
                 /* FieldWidget(
                      width: media.size.width,
                      icon: AntIcons.mail_outline,
                      textController: _emailTextController,
                      labelText: 'Email'),
                  SizedBox(height: 10),
                  FieldWidget(
                      width: media.size.width,
                      icon: AntIcons.lock_outline,
                      textController: _passwordTextController,
                      labelText: 'Password'),
                  SizedBox(height: 10),*/
                  /*Container(
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
                        "Create an account",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
