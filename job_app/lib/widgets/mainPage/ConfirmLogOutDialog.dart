import 'package:flutter/material.dart';

import 'package:job_app/items/StyleSettings.dart';

class ConfirmLogOutDialog extends StatelessWidget {
  final Function funFirstAnswer;
  final Function funSecondAnswer;

  ConfirmLogOutDialog({this.funFirstAnswer, this.funSecondAnswer});

  @override
  Widget build(BuildContext context) {
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
            onPressed: funFirstAnswer,
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
            onPressed: funSecondAnswer,
            child: const Text(
              "No",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )),
      ],
    );
  }
}
