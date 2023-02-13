import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:snake_game/models/direction_point.dart';
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
        rows, (i) => List.generate(columns, (j) => 0, growable: false),
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
  List<MatrixElement> _snakeElements = [];
  List<DirectionPoint> _directionPoints = [];
  int _direction = 2;
  //  Direction
  //  0 - Right
  //  1 - Lelf
  //  2 - Up
  //  3 - Down

  @override
  void initState() {
    super.initState();
    _startGame();

    timer = Timer.periodic(
      Duration(milliseconds: 500),
      (Timer t) {
        setState(() {
          widget._matrix = moveSnake(_direction, widget.columns, widget.rows, _snakeElements, widget._matrix, _directionPoints)[0];
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_right,
                color: Colors.purple,
                size: 35,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_left,
                color: Colors.purple,
                size: 35,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_drop_up,
                color: Colors.purple,
                size: 35,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.purple,
                size: 35,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget._matrix.map<Widget>(
          (row) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: row.map<Widget>(
                (column) {
                  return column == 0
                      ? Container(
                          height: (mediaQuerySize.height / widget.rows) - 2,
                          width: mediaQuerySize.width / widget.columns,
                          child: const Text(""),
                        )
                      : Container(
                          height: (mediaQuerySize.height / widget.rows) - 2,
                          width: mediaQuerySize.width / widget.columns,
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
      ),
    );
  }

  void _startGame() {
    setState(() {
      _snakeElements.add(
        MatrixElement(
          row: _strIndRow,
          column: _strIndCol,
          value: 1,
          direction: 0,
        ),
      );
      _snakeElements.add(
        MatrixElement(
          row: _strIndRow + 1,
          column: _strIndCol,
          value: 1,
          direction: 0,
        ),
      );
      widget._matrix[_strIndRow][_strIndCol] = 1;
      widget._matrix[_strIndRow + 1][_strIndCol] = 1;
    });
  }

  void _moveToTheRight() {
    setState(() {
      _directionPoints.add(DirectionPoint(
          column: _snakeElements[0].column,
          direction: 0,
          row: _snakeElements[0].row));
      //widget._matrix = moveSnakeRight(widget.columns, _snakeElements, widget._matrix);
    });
  }

  void _moveToTheLeft() {
    setState(() {
      _directionPoints.add(DirectionPoint(
          column: _snakeElements[0].column,
          direction: 0,
          row: _snakeElements[0].row));
      //widget._matrix = moveSnakeLeft(widget.columns, _snakeElements, widget._matrix);
    });
  }

  void _moveUp() {
    setState(() {
      _directionPoints.add(DirectionPoint(
          column: _snakeElements[0].column,
          direction: 2,
          row: _snakeElements[0].row));
      //widget._matrix = moveSnakeRight(widget.columns, _snakeElements, widget._matrix);
    });
  }

  void _moveDown() {
    setState(() {
      _directionPoints.add(DirectionPoint(
          column: _snakeElements[0].column,
          direction: 3,
          row: _snakeElements[0].row));
      //widget._matrix = moveSnakeRight(widget.columns, _snakeElements, widget._matrix);
    });
  }
}
