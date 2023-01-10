import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:snake_game/models/game_movement.dart';
import 'package:snake_game/models/matrix_element.dart';

class GameScreen extends StatefulWidget {
  final int rows;
  final int columns;
  //Matrix of the game
  var _matrix;

  GameScreen({Key? key, required this.rows, required this.columns})
      : super(key: key) {
    _matrix = List.generate(
        rows,
        (i) => List.generate(
            columns, (j) => MatrixElement(row: i, columns: j, value: 0),
            growable: false),
        growable: false);

    // _matrix.forEach((row) {
    //   //print("Row: " + row.toString());
    //   print(row);
  }

  @override
  State<StatefulWidget> createState() => _GameScreen_State();
}

// ignore: camel_case_types
class _GameScreen_State extends State<GameScreen> {
  int _strIndRow = 10;
  int _strIndCol = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _startGame();   
    timer = Timer.periodic(Duration(milliseconds: 500), (Timer t) => _moveSnake());
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: _getMatrixWidget(mediaQuerySize),
    );
  }

  Widget _getMatrixWidget(Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: widget._matrix.map<Widget>(
        (row) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: row.map<Widget>(
              (column) {
                return column.value == 0
                    ? Container(
                        height: size.height / widget.rows,
                        width: size.width / widget.columns,
                        child: const Text(""),
                      )
                    : Container(
                        height: size.height / widget.rows,
                        width: size.width / widget.columns,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Padding(padding: EdgeInsets.all(0)),
                      );
              },
            ).toList(),
          );
        },
      ).toList(),
    );
  }

  void _moveSnake() {
    print("Value 1 3: " + (_strIndCol + 1).toString());
    setState(() {
      _strIndCol = moveSnakeRight(widget._matrix, _strIndRow, _strIndCol, widget.columns);
    });
  }

  void _startGame(){
    setState(() {
      widget._matrix[_strIndCol][_strIndRow] = 1;
    });
  }
}
