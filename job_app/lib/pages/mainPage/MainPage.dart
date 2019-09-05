import 'package:flutter/material.dart';
import 'package:job_app/items/StyleSettings.dart';
import "package:ant_icons/ant_icons.dart";

import '../authorizationPage/Authorization.dart';
import '../mainPage/tabs/dataTab/DataTab.dart';
import '../mainPage/drawer/DrawerMenu.dart';
import '../mainPage/tabs/AddTab.dart';
import '../mainPage/tabs/SummaryTab.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedTabIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Authorization _db = Authorization();
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      DataTab(), //DATA TABLE TAB
      SummaryTab(), //SUMMARY TAB
      AddTab(), //ADD TAB
    ];

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(accentColor: styleColor, primaryColor: styleColor),
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          drawer: MenuDrawer(2),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(AntIcons.database_outline),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assessment),
                title: Text('Summary'),
              ),
              BottomNavigationBarItem(
                icon: Icon(AntIcons.file_add_outline),
                title: Text('Add work'),
              ),
            ],
            currentIndex: _selectedTabIndex,
            selectedItemColor: styleColor,
            onTap: _onItemTapped,
          ),
          appBar: AppBar(
            title: Text("Your work"),
            backgroundColor: styleColor,
            actions: <Widget>[
              FlatButton(
                  child: Icon(AntIcons.logout_outline, color: Colors.white),
                  onPressed: _signOut)
            ],
          ),
          body: _widgetOptions.elementAt(_selectedTabIndex),
          key: scaffoldKey,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _signOut() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            title: const Text("Log out?"),
            content: const Text("You will be logged out from this account"),
            actions: <Widget>[
              FlatButton(
                  textColor: styleColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  onPressed: () {
                    _db.signOut(context);
                  },
                  child: const Text(
                    "Yes",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  )),
              FlatButton(
                  color: styleColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "No",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  )),
            ],
          );
        });
  }
}
