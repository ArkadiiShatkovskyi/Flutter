import 'package:flutter/material.dart';
import 'package:snake_game/screens/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Snake game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(playGame: _playTheGame, exitGame: _exitFromTheGame),
    );
  }

  void _playTheGame() {}

  void _exitFromTheGame() {}
}
