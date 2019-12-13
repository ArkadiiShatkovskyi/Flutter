import 'package:flutter/material.dart';

Color get styleColor {
  return _hexToColor("#7d93fe");
}

Color _hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

ThemeData get appTheme {
  return ThemeData(
    primaryColor: styleColor,
    accentColor: styleColor,
    buttonColor: styleColor,
    inputDecorationTheme: InputDecorationTheme(focusColor: styleColor),
    iconTheme: IconThemeData(color: styleColor),
    textTheme: TextTheme(
      title: TextStyle(
        fontFamily: 'CourgetteRegular',
        fontSize: 20,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: styleColor,
      textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(fontSize: 20, fontFamily: 'CourgetteRegular'),
          ),
    ),
  );
}
