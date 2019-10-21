import 'package:flutter/material.dart';

import '../widgets/ExpensesList.dart';

class ExpensesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Your expenses",
          style: TextStyle(
            fontSize: 22,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: ExpensesList(5),
    );
  }
}
