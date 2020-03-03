import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class ExpensesPerDay {
  final String day;
  final int money;
  final charts.Color barColor;

  ExpensesPerDay(
      {@required this.day,
        @required this.money,
        @required this.barColor});
}