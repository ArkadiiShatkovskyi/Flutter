import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './screens/ExpensesPerWeekScreen.dart';
import './screens/SignUpScreen.dart';

import './models/ExpensesProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ExpensesProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.indigo,
          accentColor: Colors.orangeAccent,
        ),
        debugShowCheckedModeBanner: false,
        home: ExpensesPerWeek(),
        // home: SignUpScreen(),
      ),
    );
  }
}
