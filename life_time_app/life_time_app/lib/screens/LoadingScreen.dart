import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flare_flutter/flare_actor.dart';

import './TimeScreen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => TimeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: FlareActor(
          'assets/animation/LoadingAnimation.flr',
          fit: BoxFit.cover,
          animation: 'activity',
        ),
      ),
    );
  }
}
