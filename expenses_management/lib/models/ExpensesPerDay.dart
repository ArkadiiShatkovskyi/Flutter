import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class ExpensesPerDay {
  final String day;
  int money;
  final charts.Color barColor;
  final DateTime date;

  ExpensesPerDay(
      {@required this.day,
        @required this.money,
        @required this.barColor,
        @required this.date,
      });
}