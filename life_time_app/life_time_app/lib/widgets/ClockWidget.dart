import 'package:flutter/material.dart';

class ClockWidget extends StatefulWidget {
  final width;
  final height;

  ClockWidget({this.height, this.width});

  @override
  State<StatefulWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget>
    with SingleTickerProviderStateMixin {
  var hours;
  var minutes;
  var seconds;
  AnimationController controller;

  @override
  void initState() {
    hours = DateTime.now().hour.toString();
    minutes = DateTime.now().minute.toString();
    seconds = DateTime.now().second.toString();
    controller =
        AnimationController(vsync: this, duration: Duration(minutes: 1));
    controller.addListener(() {
      if (controller.isCompleted) {
        controller.reverse();
      } else if (controller.isDismissed) {
        controller.forward();
      }
      setState(() {
        hours = DateTime.now().hour.toString();
        minutes = DateTime.now().minute.toString();
        seconds = DateTime.now().second.toString();
      });
    });
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: widget.width * .3,
        right: widget.width * .3,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        color: Colors.black38,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: widget.width / 3.5,
              child: Center(
                child: Text(
                  getHours(),
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'IndieFlower',
                      fontSize: 50),
                ),
              ),
            ),
            const Text(
              ":",
              style: TextStyle(
                  color: Colors.white, fontFamily: 'IndieFlower', fontSize: 50),
            ),
            Container(
              width: widget.width / 3.5,
              child: Center(
                child: Text(
                  getMinutes(),
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'IndieFlower',
                      fontSize: 50),
                ),
              ),
            ),
            const Text(
              ":",
              style: TextStyle(
                  color: Colors.white, fontFamily: 'IndieFlower', fontSize: 50),
            ),
            Container(
              width: widget.width / 3.5,
              child: Center(
                child: Text(
                  getSeconds(),
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'IndieFlower',
                      fontSize: 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getTime() {
    return "${hours.toString().padLeft(2, '0')} : ${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}";
  }

  String getHours() {
    return "${hours.toString().padLeft(2, '0')}";
  }

  String getMinutes() {
    return "${minutes.toString().padLeft(2, '0')}";
  }

  String getSeconds() {
    return "${seconds.toString().padLeft(2, '0')}";
  }
}
