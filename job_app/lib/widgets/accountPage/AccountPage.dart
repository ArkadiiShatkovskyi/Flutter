import 'package:flutter/material.dart';
import 'package:job_app/widgets/mainPage/MainPage.dart';
import 'package:ant_icons/ant_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_app/widgets/authorizationPage/Authorization.dart';
import './DataElement.dart';
import 'package:job_app/widgets/AppTheme.dart';

class AccountPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AccountPageState();
  }
}

class _AccountPageState extends State<AccountPage> {
  var _name = '';
  var _surname = '';
  var _birthDate = '';
  var _email = '';

  @override
  void initState() {
    super.initState();
    Authorization _authorization = Authorization();
    _authorization.getUser().then((currUser) {
      _email = currUser.email;
      _getPersonalData(currUser.uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Text("Account page"),
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
            )),
        Divider(
          height: 15,
        ),
        DataElement("Name", _name.toString()),
        Divider(
          height: 15,
        ),
        DataElement("Surname", _surname.toString()),
        Divider(
          height: 15,
        ),
        DataElement("Birth Day", _birthDate.toString()),
        Divider(
          height: 15,
        ),
        DataElement("Email", _email.toString()),
      ],
    );
  }

  void _getPersonalData(String user) async {
    var document = await Firestore.instance
        .collection('personalData')
        .document(user)
        .get();
    setState(() {
      _name = document['name'];
      _surname = document['surname'];
      _birthDate = document['birthDay'];
    });
  }
}
