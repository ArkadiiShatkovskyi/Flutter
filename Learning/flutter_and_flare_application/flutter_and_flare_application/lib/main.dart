import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimationIconButton(),
    );
  }
}

class AnimationIconButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimationIconButtonState();
}

class AnimationIconButtonState extends State<AnimationIconButton> {
  String _animationName = 'Test';

  void _onButtonTap() {
    setState(() {
      _animationName = 'like_animation';
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _animationName = 'Test';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test animation with flare"),
      ),
      body: Center(
        child: GestureDetector(
            onTap: _onButtonTap,
            child: FlareActor(
              'assets/LikeButton.flr',
              fit: BoxFit.contain,
              animation: _animationName,
            ),
          ),
        ),
    );
  }
}
