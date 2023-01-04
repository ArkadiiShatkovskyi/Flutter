import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snake_game/widgets/button_widget.dart';

import 'game_screen.dart';

class HomePage extends StatelessWidget {

  // ignore: prefer_const_constructors_in_immutables
  const HomePage({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Snake game"), centerTitle: true),
      // ignore: prefer_const_constructors
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget(buttonText: "Play", onPressAction: _playTheGame),
            const Padding(
              padding: EdgeInsets.all(20),
            ),
            ButtonWidget(buttonText: "Exit", onPressAction: _exitFromTheGame),
          ],
        ),
      ),
    );
  }

    void _playTheGame(BuildContext context) {
     Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const GameScreen(
          matrixWidth: 10,
          matrixHeight: 20,
        ),
      ),
    );
  }

  void _exitFromTheGame(BuildContext context) {
    SystemNavigator.pop();
  }
}
