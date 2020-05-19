import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;

import '../models/Expense.dart';
import '../models/ExpensesPerDay.dart';

// ignore: must_be_immutable
class ChartBarForWeek extends StatelessWidget {
  Map<int, Map> data = {
    1: {
      'day': "Mon",
      'money': 0.0,
      'barColor': charts.ColorUtil.fromDartColor(Colors.purpleAccent),
      'date': DateTime.now()
          .subtract(Duration(days: DateTime.now().weekday - DateTime.monday))
          .toUtc(),
    },
    2: {
      'day': "Tue",
      'money': 0.0,
      'barColor': charts.ColorUtil.fromDartColor(Colors.indigo),
      'date': DateTime.now()
          .subtract(Duration(days: DateTime.now().weekday - DateTime.tuesday))
          .toUtc(),
    },
    3: {
      'day': "Wen",
      'money': 0.0,
      'barColor': charts.ColorUtil.fromDartColor(Colors.yellow),
      'date': DateTime.now()
          .subtract(Duration(days: DateTime.now().weekday - DateTime.wednesday))
          .toUtc(),
    },
    4: {
      'day': "Thu",
      'money': 0.0,
      'barColor': charts.ColorUtil.fromDartColor(Colors.green),
      'date': DateTime.now()
          .subtract(Duration(days: DateTime.now().weekday - DateTime.thursday))
          .toUtc(),
    },
    5: {
      'day': "Fri",
      'money': 0.0,
      'barColor': charts.ColorUtil.fromDartColor(Colors.orange),
      'date': DateTime.now()
          .subtract(Duration(days: DateTime.now().weekday - DateTime.friday))
          .toUtc(),
    },
    6: {
      'day': "Sat",
      'money': 0.0,
      'barColor': charts.ColorUtil.fromDartColor(Colors.blue),
      'date': DateTime.now()
          .subtract(Duration(days: DateTime.now().weekday - DateTime.saturday))
          .toUtc(),
    },
    7: {
      'day': "Sun",
      'money': 0.0,
      'barColor': charts.ColorUtil.fromDartColor(Colors.redAccent),
      'date': DateTime.now()
          .subtract(Duration(days: DateTime.now().weekday - DateTime.sunday))
          .toUtc(),
    },
  };

  final List<Expense> listOfExpenses;
  List<ExpensesPerDay> chartPerDaysData = List();

  ChartBarForWeek(this.listOfExpenses) {
    _convertDataFromProvider(listOfExpenses);
    this.data.forEach((k, v) {
      chartPerDaysData.add(
        //Creating list of static data for chart
        ExpensesPerDay(
          day: v['day'],
          money: v['money'],
          barColor: v['barColor'],
          date: v['date'],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ExpensesPerDay, String>> series = [
      charts.Series(
          id: "Subscribers",
          data: chartPerDaysData,
          domainFn: (ExpensesPerDay series, _) => series.day,
          measureFn: (ExpensesPerDay series, _) => series.money,
          colorFn: (ExpensesPerDay series, _) => series.barColor)
    ];

    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: charts.BarChart(series, animate: true),
          ),
        ),
      ),
    );
  }

  void _convertDataFromProvider(List<Expense> list) {
    for (Expense e in list) {
      int day = e.getDate().weekday;
      this.data.update(day, (value) {
        if (!_datesEquals(value['date'], e.getDate())) {
          return value;
        }
        value.update('money', (_) => (value['money'] + e.amount));
        return value;
      });
    }
  }

  bool _datesEquals(DateTime date1, DateTime date2) {
    return (date1.day == date2.day &&
        date1.month == date2.month &&
        date1.year == date2.year);
  }
}
