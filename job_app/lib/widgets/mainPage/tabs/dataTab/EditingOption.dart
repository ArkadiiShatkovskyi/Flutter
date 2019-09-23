import 'package:flutter/material.dart';

import 'package:ant_icons/ant_icons.dart';

class EditOption extends StatelessWidget {
  final Function function;
  final String text;
  final String buttonText;
  final TextEditingController controller;

  const EditOption.optionWithButton({
    this.function,
    this.text,
    this.buttonText,
    // ignore: avoid_init_to_null
    this.controller = null,
  });

  const EditOption.optionWithTextInput({
    // ignore: avoid_init_to_null
    this.text,
    this.controller,
    this.buttonText = '',
    // ignore: avoid_init_to_null
    this.function = null,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);

    if (controller == null)
      return Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: 75,
              padding: const EdgeInsets.only(top: 15),
              child: Text(text),
            ),
            Container(
              width: media.size.width * .35,
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: RaisedButton.icon(
                onPressed: function,
                icon: const Icon(
                  AntIcons.calendar_outline,
                  color: Colors.white,
                ),
                label: Text(
                  buttonText,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    else
      return Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: 75,
              padding: EdgeInsets.only(top: 15),
              child: Text("Rate: "),
            ),
            SizedBox(
              width: media.size.width * .3,
              child: TextFormField(
                controller: controller,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
  }
}
