import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/ExpensesProvider.dart';
import '../widgets/HistoryCard.dart';
import '../widgets/ChartBarForWeek.dart';
import './AddExpenses.dart';

class ExpensesPerWeek extends StatefulWidget {
  @override
  _ExpensesPerWeekState createState() => _ExpensesPerWeekState();
}

class _ExpensesPerWeekState extends State<ExpensesPerWeek> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses app"),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AddExpenses())),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            bottom: media.height * .44,
            right: 0.0,
            left: 0.0,
            child: SizedBox(
              width: media.width,
              height: media.height * .4,
              child: Container(
                child: Center(
                  child: Consumer<ExpensesProvider>(
                    builder: (BuildContext context, ExpensesProvider db, _) {
                      return ChartBarForWeek(db.listOfExpenses);
                    },
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: media.height * .44,
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
            child: SizedBox(
              width: media.width,
              height: media.height * .8,
              child: Consumer<ExpensesProvider>(
                builder: (BuildContext context, ExpensesProvider db, _) {
                  return ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: db.listOfExpenses
                        .map(
                          (e) => HistoryCard(
                            title: e.title,
                            amount: e.amount,
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
