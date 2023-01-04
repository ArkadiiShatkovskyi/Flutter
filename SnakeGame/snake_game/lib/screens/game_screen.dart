import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  final int matrixWidth;
  final int matrixHeight;

  const GameScreen(
      {Key? key, required this.matrixWidth, required this.matrixHeight})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _GameScreen_State();
}

// ignore: camel_case_types
class _GameScreen_State extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text("Game Screen"),
      ),
    );
  }
}
