import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './HistoryCard.dart';

class HistoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(bottom: media.height * .05),
      width: media.width,
      height: media.height * .8,
      child: ListView(
        children: <Widget>[
          HistoryCard(
            title: "Expenses 1",
            amount: 25,
          ),
          HistoryCard(
            title: "Expenses 2",
            amount: 25,
          ),
          HistoryCard(
            title: "Expenses 3",
            amount: 25,
          ),
          HistoryCard(
            title: "Expenses 4",
            amount: 25,
          ),
          HistoryCard(
            title: "Expenses 4",
            amount: 25,
          ),
          HistoryCard(
            title: "Expenses 4",
            amount: 25,
          ),
          HistoryCard(
            title: "Expenses 4",
            amount: 25,
          ),
          HistoryCard(
            title: "Expenses 4",
            amount: 25,
          ),
          HistoryCard(
            title: "Expenses 4",
            amount: 25,
          ),
        ],
      ),
    );
  }
}
