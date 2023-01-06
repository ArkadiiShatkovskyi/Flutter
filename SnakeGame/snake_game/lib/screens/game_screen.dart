import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  final int rows;
  final int columns;
  //Matrix of the game
  var _matrix;

  GameScreen({Key? key, required this.rows, required this.columns})
      : super(key: key) {
    _matrix = List.generate(
        rows, (i) => List.generate(columns, (j) => 0, growable: false),
        growable: false);

    _matrix.forEach((row) {
      //print("Row: " + row.toString());
      print(row);
    });
  }

  @override
  State<StatefulWidget> createState() => _GameScreen_State();
}

// ignore: camel_case_types
class _GameScreen_State extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getMatrixWidget(),
    );
  }

  Widget _getMatrixWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: widget._matrix.map<Widget>(
        (row) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: row.map<Widget>(
              (column) {
                return Container(
                  child: Text(column.toString()),
                );
              },
            ).toList(),
          );
        },
      ).toList(),
    );
  }
}
