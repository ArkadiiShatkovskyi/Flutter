import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final String month;
  final String rate;
  final double workTime;
  final double salary;

  const SummaryCard.workPerRate({
    this.rate,
    this.workTime,
    this.salary,
    this.month = '',
  });

  const SummaryCard.workPerMonth({
    this.month,
    this.workTime,
    this.salary,
    this.rate = '',
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
              left: media.size.width * .15, right: media.size.width * .15),
          child: Column(
            children: <Widget>[
              Divider(
                height: media.size.height * .02,
                color: Colors.transparent,
              ),
              Center(
                  child: Text(
                month == ''
                    ? rate.toString() == "Total" ? "Total" : "Job per rate: $rate"
                    : "Per Month: $month",
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
                            workTime.toStringAsFixed(2),
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
                      salary.toStringAsFixed(2),
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
      ),
    );
  }
}
