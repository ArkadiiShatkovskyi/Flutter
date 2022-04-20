import 'package:flutter/material.dart';

import "package:ant_icons/ant_icons.dart";

import '../authorizationPage/Authorization.dart';
import '../mainPage/tabs/dataTab/DataTab.dart';
import '../mainPage/drawer/DrawerMenu.dart';
import 'tabs/addTab/AddTab.dart';
import 'tabs/summaryTab/SummaryTab.dart';
import '../ConfirmMessage.dart';
import '../AppTheme.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedTabIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Authorization _db = Authorization();
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
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          drawer: DrawerMenu(),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(AntIcons.database_outline),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.assessment),
                label: 'Summary',
              ),
              BottomNavigationBarItem(
                icon: const Icon(AntIcons.file_add_outline),
                label: 'Add work',
              ),
            ],
            currentIndex: _selectedTabIndex,
            onTap: _onItemTapped,
          ),
          appBar: AppBar(
            title: const Text("Your work"),
            actions: <Widget>[
              TextButton(
                  child:
                      const Icon(AntIcons.logout_outline, color: Colors.white),
                  onPressed: _signOut)
              /**
                  FlatButton(
                  child:
                  const Icon(AntIcons.logout_outline, color: Colors.white),
                  onPressed: _signOut)
               */
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
        return ConfirmMessage(
          title: "Log out?",
          message: "You will be logged out from this account",
          funFirstAnswer: () {
            _db.signOut(context);
          },
          funSecondAnswer: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
