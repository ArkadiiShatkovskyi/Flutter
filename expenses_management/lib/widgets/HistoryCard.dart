import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';

class HistoryCard extends StatelessWidget {
  final title;
  final amount;

  const HistoryCard({this.title, this.amount});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Container(
      padding:
          EdgeInsets.only(left: media.width * .05, right: media.width * .05),
      width: media.width,
      height: media.height * .1,
      child: Card(
        elevation: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(title.toString()),
            Container(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.attach_money,
                    color: Theme.of(context).primaryColor,
                  ),
                  Text(amount.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
