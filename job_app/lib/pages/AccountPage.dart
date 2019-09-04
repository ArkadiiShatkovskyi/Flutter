import 'package:flutter/material.dart';
import 'package:job_app/items/StyleSettings.dart';
import 'package:job_app/pages/mainPage/MainPage.dart';
import 'package:ant_icons/ant_icons.dart';

class AccountPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AccountPageState();
  }
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Text("Account page"),
            backgroundColor: styleColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MainPage())),
            )),
        body: _createBody(),
      ),
    );
  }

  Widget _createBody() {
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(top: 30),
            width: double.infinity,
            child: Icon(
              AntIcons.user,
              size: 100,
              color: styleColor,
            )),
        Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Icon(
                  Icons.details,
                  color: styleColor,
                  size: 50,
                ),
                padding: EdgeInsets.only(left: 30, right: 20, top: 30),
              ),
              Container(
                padding: EdgeInsets.only(left: 30, right: 20, top: 30),
                child: Text("Your info"),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Icon(
                  Icons.details,
                  color: styleColor,
                  size: 50,
                ),
                padding: EdgeInsets.only(left: 30, right: 20, top: 30),
              ),
              Container(
                padding: EdgeInsets.only(left: 30, right: 20, top: 30),
                child: Text("Your info"),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Icon(
                  Icons.details,
                  color: styleColor,
                  size: 50,
                ),
                padding: EdgeInsets.only(left: 30, right: 20, top: 30),
              ),
              Container(
                padding: EdgeInsets.only(left: 30, right: 20, top: 30),
                child: Text("Your info"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
