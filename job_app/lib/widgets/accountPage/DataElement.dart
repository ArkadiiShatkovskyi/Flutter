import 'package:flutter/material.dart';

class DataElement extends StatelessWidget {
  final _dataText;
  final _text;

  DataElement(this._text, this._dataText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200,
            alignment: Alignment.centerLeft,
            child: Text(
              _text,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
            ),
            padding: EdgeInsets.only(left: 75, right: 15, top: 15, bottom: 15),
          ),
          Container(
            alignment: Alignment.centerLeft,
            width: 200,
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Text(_dataText),
          ),
        ],
      ),
    );
  }
}
