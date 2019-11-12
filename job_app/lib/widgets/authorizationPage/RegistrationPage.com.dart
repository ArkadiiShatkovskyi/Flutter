import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ant_icons/ant_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:job_app/widgets/AppTheme.dart';
import './FieldWidget.dart';
import './RegistrationStep.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _nameTextController = TextEditingController();
  final _surNameTextController = TextEditingController();
  final _pageViewController = PageController();

  var _registrationSteps = <Widget>[
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
      image: "assets/images/undraw_personal_data_29co.svg",
      textController1: _emailTextController,
      icon1: AntIcons.mail_outline,
      labelText1: 'Email',
      textController2: _passwordTextController,
      icon2: AntIcons.lock_outline,
      labelText2: 'Password',
    )
  ];

  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
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
            onPressed: () => {},
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget createPageView() {
    return PageView(
      controller: _pageViewController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[],
    );
  }
}
