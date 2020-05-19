import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';

import '../models/ExpensesProvider.dart';
import './HistoryCard.dart';

class HistoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Container(
      width: media.width,
      height: media.height * .8,
      child: Consumer<ExpensesProvider>(
        builder: (BuildContext context, ExpensesProvider db, _) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: db.listOfExpenses.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return HistoryCard(
                title: db.listOfExpenses[index].title,
                amount: db.listOfExpenses[index].amount,
              );
            },
          );
        },
      ),
    );
  }
}
