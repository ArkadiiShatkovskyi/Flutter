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
//    dividerColor: styleColor,
    buttonColor: styleColor,
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

/*mixin AppTheme implements ThemeData {
  Color get styleColor {
    return _hexToColor("#7d93fe");
  }

  Color _hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  ThemeData get theme {
    return ThemeData(
        primaryColor: this.styleColor,
        dividerColor: this.styleColor,
        buttonColor: this.styleColor,
        iconTheme: IconThemeData(color: this.styleColor),
        textTheme: TextTheme(
          title: TextStyle(
            fontFamily: 'CourgetteRegular',
            fontSize: 20,
          ),
        ),
        appBarTheme: AppBarTheme(
          color: this.styleColor,
          textTheme: ThemeData.light().textTheme.copyWith(
                  title:
                      TextStyle(fontSize: 20, fontFamily: 'CourgetteRegular'),
                ),
          ),
        );
  }
}*/
