import 'dart:async';

import './DBProvider.dart';
import './Expense.dart';

class ExpenseBloc{
  final _expenseController = StreamController<List<dynamic>>.broadcast();
  get expenses => _expenseController.stream;

  ExpenseBloc(){
    getExpenses();
  }

  getExpenses() async {
    _expenseController.sink.add(await DBProvider.db.getExpenses());
  }

  deleteExpense(int id){
    DBProvider.db.deleteExpense(id);
    getExpenses();
  }

  addExpense(Expense expense){
    DBProvider.db.newExpense(expense);
    getExpenses();
  }

  dispose(){
    _expenseController.close();
  }
}