import 'package:expenses_management/models/Expense.dart';
import 'package:flutter/material.dart';

import './DBProvider.dart';

class ExpensesProvider with ChangeNotifier {
  List<Expense> _listOfExpenses = [];

  ExpensesProvider() {
    _getExpenses();
  }

  List<Expense> get listOfExpenses {
    return _listOfExpenses;
  }

  void _getExpenses() async {
    _listOfExpenses = await DBProvider.db.getExpenses();
    notifyListeners();
  }

  void addExpense ({
    DateTime date,
    String category,
    double amount,
    String title,
  }) async {
    await DBProvider.db.addNewExpense(
      Expense(
        amount: amount,
        category: category,
        dateDay: date.day,
        dateMonth: date.month,
        dateYear: date.year,
        title: title,
      ),
    );
    notifyListeners();
  }
}
