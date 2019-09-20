import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RowWidget extends StatelessWidget {
  final icon;
  final title;
  final hint;
  final function;
  var controller;
  var textInputHint;
  final _media;

  RowWidget(this.title, this.hint, this.icon, this.function, this._media);

  RowWidget.textInput(
      this.title, this.hint, this.controller, this.textInputHint, this._media,
      {this.icon = 0, this.function = 0});

  @override
  Widget build(BuildContext context) {
    if (controller != null) {
      return Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                left: _media.size.width * .07, right: _media.size.width * .07),
            width: _media.size.width * .5,
            child: Text(title, style: TextStyle(fontSize: 16)),
          ),
          Container(
            padding: EdgeInsets.only(
              left: _media.size.width * .05,
            ),
            width: _media.size.width * .25,
            child: Text(hint),
          ),
          Container(
            width: _media.size.width * .15,
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
            padding: EdgeInsets.only(
                left: _media.size.width * .07, right: _media.size.width * .07),
            width: _media.size.width * .5,
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: _media.size.width * .05,
            ),
            width: _media.size.width * .25,
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
