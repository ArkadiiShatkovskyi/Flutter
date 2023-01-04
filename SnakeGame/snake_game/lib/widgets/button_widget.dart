import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final Function onPressAction;

  ButtonWidget(
      {Key? key, required this.buttonText, required this.onPressAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 90, 114, 253),
        onPrimary: Colors.amber,
      ),
      onPressed: () => onPressAction,
      child: Text(
        buttonText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
