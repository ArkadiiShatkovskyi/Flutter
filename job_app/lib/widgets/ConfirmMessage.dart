import 'package:flutter/material.dart';

class ConfirmMessage extends StatelessWidget {
  final Function funFirstAnswer;
  final Function funSecondAnswer;
  final String title;
  final String message;

  const ConfirmMessage(
      {this.title, this.message, this.funFirstAnswer, this.funSecondAnswer});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
            foregroundColor:  MaterialStateProperty.all(Colors.white),
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          onPressed: funFirstAnswer,
          child: const Text(
            "Yes",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor:  MaterialStateProperty.all(Colors.white),
            backgroundColor:
            MaterialStateProperty.all(Theme.of(context).primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          onPressed: funSecondAnswer,
          child: const Text(
            "No",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
