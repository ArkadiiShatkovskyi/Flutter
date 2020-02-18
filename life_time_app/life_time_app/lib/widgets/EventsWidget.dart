import 'package:flutter/material.dart';

import './EventWidget.dart';

class EventsWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        primary: false,
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 1,
        children: <Widget>[
          EventWidget(0),
          EventWidget(1),
          EventWidget(2),
          EventWidget(3),
          EventWidget(3),
          EventWidget(2),
          EventWidget(0),
          EventWidget(1),
          EventWidget(2),
          EventWidget(3),
          EventWidget(3),
          EventWidget(2),
        ],
      ),
    );
  }
}
