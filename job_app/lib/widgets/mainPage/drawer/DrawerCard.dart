import 'dart:io';

import 'package:flutter/material.dart';

import 'package:job_app/widgets/InfoPage.dart';
import 'package:job_app/widgets/ConfirmMessage.dart';

class DrawerCard extends StatelessWidget {
  final String font;
  final double tilesFontSize;
  final double iconsSize;
  final String text;
  final IconData icon;

  const DrawerCard(
      {this.text, this.font, this.iconsSize, this.tilesFontSize, this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).primaryColor,
          size: iconsSize,
        ),
        title: Text(
          text,
          style: TextStyle(
            fontFamily: font,
            fontSize: tilesFontSize,
          ),
        ),
        onTap: () {
          if (text == "About") {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => InfoWidget()));
          } else if (text == "Close") {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ConfirmMessage(
                  title: "Exit from application",
                  message: "Are you sure you want exit from application?",
                  funFirstAnswer: () => exit(0),
                  funSecondAnswer: () => Navigator.of(context).pop(),
                );
              },
            );
          }
        },
      ),
    );
  }
}
