import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RowWidget extends StatelessWidget {
  final icon;
  final title;
  final hint;
  final function;
  var controller;
  var textInputHint;

  RowWidget(this.title, this.hint, this.icon, this.function);

  RowWidget.textInput(this.title, this.hint,
      this.controller, this.textInputHint, {this.icon = 0, this.function = 0});

  @override
  Widget build(BuildContext context) {
    if (controller != null) {
      return Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 25, right: 15),
            width: 200,
            child: Text(title, style: TextStyle(fontSize: 16)),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 15,
            ),
            width: 100,
            child: Text(hint),
          ),
          Container(
            width: 60,
            child: TextField(
              maxLength: 15,
              controller: controller,
              obscureText: false,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: textInputHint,
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 25, right: 15),
            width: 200,
            child: Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 15,
            ),
            width: 100,
            child: Text(hint),
          ),
          IconButton(
            icon: Icon(
              icon,
            ),
            iconSize: 40,
            onPressed: () {
              function(context);
            },
          ),
        ],
      );
    }
  }
}
