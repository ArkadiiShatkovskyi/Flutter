import 'package:flutter/material.dart';

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
              child: Text("Expenses history")),
          Positioned(
              top: 200,
              child: Text("Expenses history")),
        ],
      ),
    );
  }
}
