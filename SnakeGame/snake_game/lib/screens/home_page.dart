import 'package:flutter/material.dart';
import 'package:snake_game/widgets/button_widget.dart';

class HomePage extends StatelessWidget {
  final Function playGame;
  final Function exitGame;

  // ignore: prefer_const_constructors_in_immutables
  const HomePage({Key? key, required this.playGame, required this.exitGame})
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
            ButtonWidget(buttonText: "Play", onPressAction: playGame),
            const Padding(
              padding: EdgeInsets.all(20),
            ),
            ButtonWidget(buttonText: "Exit", onPressAction: exitGame),
          ],
        ),
      ),
    );
  }
}
