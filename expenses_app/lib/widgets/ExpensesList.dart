import 'package:flutter/material.dart';

class ExpensesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExpensesListState();
}

class _ExpensesListState extends State<ExpensesList> {
  var expensesList = [
    {
      'title': 'First expenses',
      'money': 0,
      'date': (DateTime.now().day.toString() +
          '.' +
          DateTime.now().month.toString())
    },
    {
      'title': 'Second expenses',
      'money': 0,
      'date': (DateTime.now().day.toString() +
          '.' +
          DateTime.now().month.toString())
    },
    {
      'title': 'Third expenses',
      'money': 0,
      'date': (DateTime.now().day.toString() +
          '.' +
          DateTime.now().month.toString())
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return SizedBox(
      height: media.size.height * .8,
      child: ListView.builder(
//      physics: NeverScrollableScrollPhysics(),
          itemCount: expensesList.length,
          itemBuilder: (ctx, i) {
            return getItem(i);
          }),
    );
  }

  Widget getItem(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, bottom: 10, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            Icons.info_outline,
            color: Colors.indigoAccent,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            expensesList[index]['title'],
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 18,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            expensesList[index]['money'].toString(),
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 18,
            ),
          ),
          Icon(
            Icons.attach_money,
            color: Colors.indigoAccent,
            size: 22,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            expensesList[index]['date'],
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 18,
            ),
          ),
          Icon(
            Icons.date_range,
            color: Colors.indigoAccent,
            size: 22,
          ),
        ],
      ),
    );
  }
}
