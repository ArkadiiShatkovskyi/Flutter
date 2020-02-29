import 'package:flutter/material.dart';

import '../widgets/HistoryList.dart';

class ExpensesHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses app"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
              top: media.height * .05,
              left: media.width * 0.3,
              right: media.width * 0.3,
              child: Center(child: Text("Expenses history"))),
          Positioned(
            top: media.height * .1,
            child: HistoryList(),
          ),
        ],
      ),
    );
  }
}
