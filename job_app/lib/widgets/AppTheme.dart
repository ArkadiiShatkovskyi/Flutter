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
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: styleColor),
    //accentColor: styleColor, //deprecated
    //buttonColor: styleColor,
    inputDecorationTheme: InputDecorationTheme(focusColor: styleColor),
    iconTheme: IconThemeData(color: styleColor),
    textTheme: TextTheme(
      headline6: TextStyle(
        //title
//        fontFamily: 'CourgetteRegular',
        fontSize: 20,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: styleColor,
      toolbarTextStyle: ThemeData.light()
          .textTheme
          .copyWith(
            headline6: TextStyle(
              //title
              fontSize: 20,
            ),
          )
          .bodyText2,
      titleTextStyle: ThemeData.light()
          .textTheme
          .copyWith(
            headline6: TextStyle(
              //title
              fontSize: 20,
            ),
          )
          .headline6,
    ),
  );
}
