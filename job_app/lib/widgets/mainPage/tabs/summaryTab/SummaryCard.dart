import 'package:flutter/material.dart';

import 'package:job_app/items/StyleSettings.dart';

class SummaryCard extends StatelessWidget{

  final String rate;
  final double workTimePerRate;
  final double salaryPerRate;

  SummaryCard({this.rate, this.workTimePerRate, this.salaryPerRate});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(left: 75, right: 75),
        child: Column(
          children: <Widget>[
            Divider(
              height: 30,
              color: Colors.transparent,
            ),
            Center(
                child: Text(
                  rate.toString() == "Total" ? "Total" : "Job per rate: $rate",
                  style: TextStyle(fontSize: 18),
                )),
            Divider(
              height: 30,
              color: styleColor,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: const Text(
                            "Time worked: ",
                            style: TextStyle(fontSize: 16),
                          ),
                          width: 170,
                        ),
                        Text(
                          workTimePerRate.toStringAsFixed(2),
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 10,
              color: Colors.transparent,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: const Text(
                      "Salary: ",
                      style: TextStyle(fontSize: 16),
                    ),
                    width: 170,
                  ),
                  Text(
                    salaryPerRate.toStringAsFixed(2),
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            Divider(
              height: 30,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}