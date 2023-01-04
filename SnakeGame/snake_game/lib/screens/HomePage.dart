import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Function playGame;
  final Function exitGame;

  // ignore: prefer_const_constructors_in_immutables
  HomePage({required this.playGame, required this.exitGame});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Snake game"), centerTitle: true),
      body: Center(
        child: const Text(
          "Hello there",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
    );
  }
}
