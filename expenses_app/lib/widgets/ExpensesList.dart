import 'package:flutter/material.dart';

class ExpensesList extends StatefulWidget {

  final itemCount;

  ExpensesList(this.itemCount);

  @override
  State<StatefulWidget> createState() => ExpensesListState();
}

class ExpensesListState extends State<ExpensesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.itemCount,
        itemBuilder: (ctx, i){
        return Row(
          children: <Widget>[
            Icon(Icons.attach_money,),
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text("Expenses title")),
          ],
        );
    });
  }
}
