import 'package:flutter/material.dart';

import './screens/ExpensesPerWeekScreen.dart';
import './screens/SignUpScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.orangeAccent,
      ),
      debugShowCheckedModeBanner: false,
     home: ExpensesPerWeek(),
      // home: SignUpScreen(),
    );
  }
}