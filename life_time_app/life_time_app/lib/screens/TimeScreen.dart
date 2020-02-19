import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../widgets/EventsWidget.dart';
import '../widgets/ClockWidget.dart';
import '../widgets/DrawerMenu.dart';
import '../screens/AddScreen.dart';

class TimeScreen extends StatefulWidget {
  @override
  _TimeScreenState createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  final date = DateTime.now();
  var scaffoldKey = GlobalKey<ScaffoldState>();
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
      key: scaffoldKey,
      drawer: DrawerMenu(),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: media.height * 0.08,
          child: Padding(
            padding: EdgeInsets.only(
              left: media.width * 0.05,
              right: media.width * 0.05,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => scaffoldKey.currentState.openDrawer(),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddScreen()));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SizedBox(
        width: media.width,
        height: media.height,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: media.height * .05,
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
              top: media.height * 0.15,
              left: media.width * .1,
              right: media.width * .1,
              child: ClockWidget(
                width: media.width * 0.5,
                height: media.height * 0.125,
              ),
            ),
            Positioned(
              top: media.height * 0.3,
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
