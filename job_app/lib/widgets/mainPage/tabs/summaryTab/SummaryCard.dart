import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final String rate;
  final double workTimePerRate;
  final double salaryPerRate;

  const SummaryCard({this.rate, this.workTimePerRate, this.salaryPerRate});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Card(
      child: Container(
        padding: EdgeInsets.only(
            left: media.size.width * .15, right: media.size.width * .15),
        child: Column(
          children: <Widget>[
            Divider(
              height: media.size.height * .05,
              color: Colors.transparent,
            ),
            Center(
                child: Text(
              rate.toString() == "Total" ? "Total" : "Job per rate: $rate",
              style: const TextStyle(fontSize: 18),
            )),
            Divider(
              height: media.size.height * .05,
            ),
            Container(
              padding: EdgeInsets.only(left: media.size.width * .07),
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
                          width: media.size.width * .35,
                        ),
                        Text(
                          workTimePerRate.toStringAsFixed(2),
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: media.size.height * .01,
              color: Colors.transparent,
            ),
            Container(
              padding: EdgeInsets.only(left: media.size.width * .07),
              child: Row(
                children: <Widget>[
                  Container(
                    child: const Text(
                      "Salary: ",
                      style: TextStyle(fontSize: 16),
                    ),
                    width: media.size.width * .35,
                  ),
                  Text(
                    salaryPerRate.toStringAsFixed(2),
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            Divider(
              height: media.size.height * .03,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
