import 'package:flutter/material.dart';

import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GestureDetector(
        child: FlareActor(
          'assets/animation/ActivityAnimation.flr',
          fit: BoxFit.cover,
          animation: 'activity',
        ),
      ),
    );
  }
}
