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
    return Material(
      color: Colors.transparent,
      child: Container(
        width: widget.width,
        height: widget.height,
        child: Center(
          child: Text(
            getTime(),
            style: TextStyle(color: Colors.black, fontSize: 50),
          ),
        ),
      ),
    );
  }

  String getTime() {
    return "${hours.toString().padLeft(2, '0')} : ${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}";
  }
}
