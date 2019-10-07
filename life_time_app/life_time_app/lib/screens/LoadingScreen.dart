import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flare_flutter/flare_actor.dart';

class LoadingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: FlareActor(
          'assets/animation/ActivityAnimation.flr',
          fit: BoxFit.cover,
          animation: 'activity',
        ),
      ),
    );
  }
}