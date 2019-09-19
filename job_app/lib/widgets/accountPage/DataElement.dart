import 'package:flutter/material.dart';

class DataElement extends StatelessWidget {
  final _dataText;
  final _text;

  DataElement(this._text, this._dataText);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: media.size.width * .5,
            alignment: Alignment.centerLeft,
            child: Text(
              _text,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
            ),
            padding: EdgeInsets.only(left: media.size.width * .15, top: media.size.height * .01, bottom: media.size.height * .01),
          ),
          Container(
            alignment: Alignment.centerLeft,
            width: media.size.width * .5,
            padding: EdgeInsets.only(top: media.size.height * .01, bottom: media.size.height * .01),
            child: Text(_dataText),
          ),
        ],
      ),
    );
  }
}
