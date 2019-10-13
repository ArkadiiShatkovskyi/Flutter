import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
                top: 25,
                right: media.width - 60,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(icon: Icon(Icons.menu, color: Colors.white,), color: Colors.white,)),
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
                    /*gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.lightBlueAccent,
                        Colors.blueAccent,
                      ],
                    ),*/
//                color: Colors.black54,
//                border: Border.all(color: Colors.black),
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
                        SizedBox(
                          height: media.height * .2,
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            margin:
                                EdgeInsets.only(left: 40, right: 40, bottom: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                    child: Text(
                                  "Title of the card",
                                  style: TextStyle(fontSize: 20),
                                )),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text("some text"),
                                    Text("123 4124 412"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
//                      width: media.width * .9,
                          height: media.height * .2,
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            margin:
                                EdgeInsets.only(left: 40, right: 40, bottom: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                    child: Text(
                                  "Title of the card",
                                  style: TextStyle(fontSize: 20),
                                )),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text("some text"),
                                    Text("123 4124 412"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
//                      width: media.width * .9,
                          height: media.height * .2,
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            margin:
                                EdgeInsets.only(left: 40, right: 40, bottom: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                    child: Text(
                                  "Title of the card",
                                  style: TextStyle(fontSize: 20),
                                )),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text("some text"),
                                    Text("123 4124 412"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
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
