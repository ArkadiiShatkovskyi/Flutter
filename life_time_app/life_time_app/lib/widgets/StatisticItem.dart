import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatisticItem extends StatelessWidget {
  final height;
  final item;

  const StatisticItem(this.height, this.item);

  List get statistics {
    return [
      {
        'title': "This is CARD 1",
        'text': '12321412412',
        'image': 'assets/images/cat.jpeg'
      },
      {
        'title': "This is CARD 2",
        'text': '12321412412',
        'image': 'assets/images/dog.jpg'
      },
      {
        'title': "This is CARD 3",
        'text': '12321412412',
        'image': 'assets/images/raccoon.jpeg'
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        margin: EdgeInsets.only(left: 40, right: 40, bottom: 30),
        child: cardBodyTest(),
        /*Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Text(
              statistics[item]['title'],
              style: TextStyle(fontSize: 20),
            )),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("some text"),
                Text(statistics[item]['text']),
              ],
            ),
          ],
        ),*/
      ),
    );
  }

  Widget cardBodyTest() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: Image.asset(
        statistics[item]['image'],
      ),
    );
  }
}
