import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

import '../widgets/HistoryList.dart';
import '../widgets/ChartBarForWeek.dart';
import '../models/ExpensesProvider.dart';
import './AddExpenses.dart';

class ExpensesPerWeek extends StatefulWidget {
  @override
  _ExpensesPerWeekState createState() => _ExpensesPerWeekState();
}

class _ExpensesPerWeekState extends State<ExpensesPerWeek> {
  Map<int, Object> data;

  @override
  void initState() {
    data = {
      1: {
        'day': "Mon",
        'money': 0,
        'barColor': charts.ColorUtil.fromDartColor(Colors.purpleAccent),
        'date': getDayOfTheWeek(DateTime.monday),
      },
      2: {
        'day': "Tue",
        'money': 0,
        'barColor': charts.ColorUtil.fromDartColor(Colors.indigo),
        'date': getDayOfTheWeek(DateTime.tuesday),
      },
      3: {
        'day': "Wen",
        'money': 0,
        'barColor': charts.ColorUtil.fromDartColor(Colors.yellow),
        'date': getDayOfTheWeek(DateTime.wednesday),
      },
      4: {
        'day': "Thu",
        'money': 0,
        'barColor': charts.ColorUtil.fromDartColor(Colors.green),
        'date': getDayOfTheWeek(DateTime.thursday),
      },
      5: {
        'day': "Fri",
        'money': 0,
        'barColor': charts.ColorUtil.fromDartColor(Colors.orange),
        'date': getDayOfTheWeek(DateTime.friday),
      },
      6: {
        'day': "Sat",
        'money': 0,
        'barColor': charts.ColorUtil.fromDartColor(Colors.blue),
        'date': getDayOfTheWeek(DateTime.saturday),
      },
      7: {
        'day': "Sun",
        'money': 0,
        'barColor': charts.ColorUtil.fromDartColor(Colors.redAccent),
        'date': getDayOfTheWeek(DateTime.sunday),
      },
    };

    super.initState();
  }

  DateTime getDayOfTheWeek(dayOfWeek) {
    DateTime date = DateTime.now();
    var result =
        date.subtract(Duration(days: date.weekday - dayOfWeek)).toUtc();
    /* var day = result.day;
    var month = result.month;
    var year = result.year;*/
//    print("Date: " + result.toString());
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    // Data provider
    final expensesDB = Provider.of<ExpensesProvider>(context);
    final expenses = expensesDB.listOfExpenses;

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
                  child: ChartBarForWeek(data),
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
