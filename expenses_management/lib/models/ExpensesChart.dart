import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../models/ExpensesPerDay.dart';


class ExpensesChart extends StatelessWidget {
  final List<ExpensesPerDay> data;

  ExpensesChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ExpensesPerDay, String>> series = [
      charts.Series(
          id: "Subscribers",
          data: data,
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
}