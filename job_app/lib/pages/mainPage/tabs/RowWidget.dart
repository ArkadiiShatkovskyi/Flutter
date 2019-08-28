import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget{

  Widget _child;
  var _padding;
  var _width;
  var _style;
  var _text;

  TextContainer(child, {padding = 0, width = 0, style = 0, text = 0}){
    this._child = child;
    this._padding = padding;
    this._width = width;
    this._style = style;
    this._text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      if(this._padding != 0) padding: _padding,

    );
  }

}