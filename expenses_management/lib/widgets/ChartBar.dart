import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../models/ExpensesPerDay.dart';
import '../models/ExpensesChart.dart';

class ChartBar extends StatelessWidget {
  final List<ExpensesPerDay> data = [
    ExpensesPerDay(
      day: "Mon",
      money: 50,
      barColor: charts.ColorUtil.fromDartColor(Colors.purpleAccent),
    ),
    ExpensesPerDay(
      day: "Tue",
      money: 30,
      barColor: charts.ColorUtil.fromDartColor(Colors.indigo),
    ),
    ExpensesPerDay(
      day: "Wen",
      money: 40,
      barColor: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    ExpensesPerDay(
      day: "Thu",
      money: 25,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    ExpensesPerDay(
      day: "Fri",
      money: 121,
      barColor: charts.ColorUtil.fromDartColor(Colors.orange),
    ),
    ExpensesPerDay(
      day: "Sat",
      money: 15,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    ExpensesPerDay(
      day: "Sun",
      money: 63,
      barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ExpensesChart(
          data: data,
        ),
      ),
    );
  }
}
