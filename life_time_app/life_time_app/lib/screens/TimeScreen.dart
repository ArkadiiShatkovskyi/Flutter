import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../widgets/EventsWidget.dart';
import '../widgets/ClockWidget.dart';

class TimeScreen extends StatefulWidget {
  @override
  _TimeScreenState createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  final date = DateTime.now();
  int itemCount;
  var _xPosition;

  @override
  void initState() {
    super.initState();
    this.itemCount = 0;
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
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
                    onPressed: () {},
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
                      "Time",
                      style: TextStyle(fontSize: 24),
                    )),
                    Center(
                        child: Text(
                      "Date ${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}",
                      style: TextStyle(fontSize: 18),
                    )),
                  ],
                )),
            Positioned(
              top: media.height * 0.2,
              left: media.width * .1,
              right: media.width * .1,
              child: ClockWidget(
                width: media.width * 0.5,
                height: media.height * 0.125,
              ),
            ),
            Positioned(
              top: media.height * 0.4,
              bottom: 0,
              child: Container(
                width: media.width,
                height: media.height * .55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                ),
                child: EventsWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
