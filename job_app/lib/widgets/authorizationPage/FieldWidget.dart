import 'package:flutter/material.dart';

class FieldWidget extends StatelessWidget {
  final width;
  final textController;
  final icon;
  final labelText;

  FieldWidget({this.width, this.textController, this.icon, this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: width * .1, right: width * .1),
      child: TextFormField(
        maxLines: 1,
        maxLength: 30,
        obscureText: false,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          labelText: labelText,
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        controller: textController,
      ),
    );
  }
}
