import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;

import '../widgets/HistoryList.dart';
import '../models/ExpensesPerDay.dart';
import '../widgets/ExpensesChart.dart';

class ExpensesHistory extends StatelessWidget {
//  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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

  getThisWeek() {
    int day = DateTime.now().weekday;
    getDayOfTheWeek(DateTime.monday);
  }

  void getDayOfTheWeek(dayOfWeek) {
    DateTime date = DateTime.now();
    var result =
        date.subtract(Duration(days: date.weekday - dayOfWeek)).toUtc();
    var day = result.day;
    var month = result.month;
    var year = result.year;
    print("Date: " +
        day.toString() +
        "." +
        month.toString() +
        "." +
        year.toString());
  }

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
        onPressed: () => showBottomSheet(
          context: context,
          builder: (context) => Container(child: _showBottomSheet()),
        ),
        child: Icon(Icons.add),
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
                  child: ExpensesChart(
                    data: data,
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

  Widget _showBottomSheet() {
    return Container(
      height: 200,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("Text1"),
              Text("Text1"),
            ],
          ),
        ],
      ),
    );
  }
}
