import 'package:flutter/material.dart';

import '../widgets/ExpensesList.dart';
import '../widgets/CategoriesWidget.dart';

class ExpensesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Expenses",
            style: TextStyle(
              fontSize: 22,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        body: Column(children: <Widget>[
            CategoriesWidget(),
//        ExpensesList(5),
        ]),
      ),
    );
  }
}
