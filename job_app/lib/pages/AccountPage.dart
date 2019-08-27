import 'package:flutter/material.dart';
import 'package:job_app/items/StyleSettings.dart';
import 'package:job_app/pages/mainPage/MainPage.dart';

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
            title: Text("Account"),
            backgroundColor: styleColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MainPage())),
            )),
        body: Text("Account Page here"),
      ),
    );
  }
}
