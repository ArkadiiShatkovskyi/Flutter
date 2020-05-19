import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/ExpensesProvider.dart';
import '../widgets/HistoryList.dart';
import '../widgets/ChartBarForWeek.dart';
import './AddExpenses.dart';

class ExpensesPerWeek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses app"),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: media.height * 0.08,
          child: Padding(
            padding: EdgeInsets.only(
              left: media.width * 0.05,
              right: media.width * 0.05,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
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
            top: 0,
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
            top: media.height * .38,
            child: HistoryList(),
          ),
        ],
      ),
    );
  }
}
