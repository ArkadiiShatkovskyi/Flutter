import 'package:flutter/material.dart';

class ConfirmLogOutDialog extends StatelessWidget {
  final Function funFirstAnswer;
  final Function funSecondAnswer;

  const ConfirmLogOutDialog({this.funFirstAnswer, this.funSecondAnswer});

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
            textColor: Theme.of(context).primaryColor,
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
            color: Theme.of(context).primaryColor,
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
