import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../widgets/StatisticItem.dart';

class TimeScreen extends StatelessWidget {
  final date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      /* bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), title: Text("Add")),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), title: Text("Calendar")),
        ]
      ),*/
      body: SizedBox(
        width: media.width,
        height: media.height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 10,
              right: media.width - 60,
              child: Container(
                  decoration: BoxDecoration(
//                      color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    color: Colors.white,
                  )),
            ),
            Positioned(
                top: media.height / 10,
                left: media.width / 4,
                right: media.width / 4,
                child: Column(
                  children: <Widget>[
                    Center(
                        child: Text(
                      "Your time left",
                      style: TextStyle(fontSize: 24),
                    )),
                    Center(
                        child: Text(
                      "Date ${date.day}:${date.month}:${date.year}",
                      style: TextStyle(fontSize: 18),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      Icons.access_time,
                      size: 150,
                    ),
                  ],
                )),
            Positioned(
              bottom: 0,
              child: Container(
                width: media.width,
                height: media.height * .55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 0),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      StatisticItem(media.height * .5, 1),
                      /***  HERE WRITE */
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
