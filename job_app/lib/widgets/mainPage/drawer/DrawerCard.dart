import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/widgets/InfoPage.dart';
import 'package:job_app/widgets/accountPage/AccountPage.dart';
import 'package:job_app/widgets/SettingPage.dart';
import 'package:job_app/widgets/AppTheme.dart';

class DrawerCard extends StatelessWidget {
  final String drawerFont;
  final double tilesFontSize;
  final double iconsSize;
  final String text;
  final IconData icon;

  DrawerCard(this.text, this.drawerFont, this.iconsSize,
      this.tilesFontSize, this.icon);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: Icon(
            icon,
            color: styleColor,
            size: iconsSize,
          ),
          title: Text(
            text,
            style: TextStyle(
              fontFamily: drawerFont,
              fontSize: tilesFontSize,
            ),
          ),
          onTap: () {
            if (text == "About") {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => InfoWidget()));
            } else if (text == "Account") {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => AccountPage()));
            } else if (text == "Settings") {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SettingPage()));
            } else if (text == "Close") {
              _showExitDialon(context);
            }
          }),
    );
  }

  void _showExitDialon(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            title: const Text(
              "Exit from application",
            ),
            content: const Text("Are you sure you want exit from application?"),
            actions: <Widget>[
              FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  onPressed: () {
                    exit(0);
                  },
                  child: const Text(
                    "Yes",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  )),
              FlatButton(
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
