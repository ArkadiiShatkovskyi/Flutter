import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final Function onPressAction;

  const ButtonWidget(
      {Key? key, required this.buttonText, required this.onPressAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 75,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(255, 90, 114, 253),
          ),
          overlayColor: MaterialStateProperty.all<Color>(
            Colors.amberAccent,
          ),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(35),
              ),
            ),
          ),
        ),
        onPressed: () => onPressAction(context),
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
