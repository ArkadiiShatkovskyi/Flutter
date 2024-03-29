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
  List<List<int>> _matrix = [];

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
      const Duration(milliseconds: 500),
      (Timer t) {
        setState(() {
          _direction = _snakeElements[0].direction;
          //print("Running...");
          //print("Points: " + _directionPoints.length.toString());
          List list = moveSnake(_direction, widget.columns, widget.rows,
              _snakeElements, widget._matrix, _directionPoints);

            widget._matrix = list[0];
            if (list.length > 1) {
              _directionPoints = list[1];
            }
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
              onPressed: _direction != 0 && _direction != 1 ? _moveToTheRight : (){},
              icon: const Icon(
                Icons.arrow_right,
                color: Colors.purple,
                size: 35,
              ),
            ),
            IconButton(
              onPressed: _direction != 0 && _direction != 1 ? _moveToTheLeft : (){},
              icon: const Icon(
                Icons.arrow_left,
                color: Colors.purple,
                size: 35,
              ),
            ),
            IconButton(
              onPressed: _direction != 3 && _direction != 2 ? _moveUp : (){},
              icon: const Icon(
                Icons.arrow_drop_up,
                color: Colors.purple,
                size: 35,
              ),
            ),
            IconButton(
              onPressed: _direction != 3 && _direction != 2 ? _moveDown : (){},
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

    int column = _strIndCol;
    int row = _strIndRow;

    setState(() {
      _snakeElements.add(
        MatrixElement(
          row: row,
          column: column,
          value: 1,
          direction: 2,
        ),
      );
      _snakeElements.add(
        MatrixElement(
          row: row + 1,
          column: column,
          value: 1,
          direction: 2,
        ),
      );
      widget._matrix[row][column] = 1;
      widget._matrix[row + 1][column] = 1;
    });
  }

  void _moveToTheRight() {
    setState(() {
      print("Points added: [c=" +
          _snakeElements[0].column.toString() +
          ",r:" +
          _snakeElements[0].row.toString() +
          "]");
      _direction = 0;
      _directionPoints.add(DirectionPoint(
          column: _snakeElements[0].column,
          direction: 0,
          row: _snakeElements[0].row));
    //snakeMovement();
    //widget._matrix = moveSnakeRight(widget.columns, _snakeElements, widget._matrix);

    });
  }

  void _moveToTheLeft() {
    setState(() {
      print("Points added: [c=" +
          _snakeElements[0].column.toString() +
          ",r:" +
          _snakeElements[0].row.toString() +
          "]");
      _direction = 1;
      _directionPoints.add(DirectionPoint(
          column: _snakeElements[0].column,
          direction: 1,
          row: _snakeElements[0].row));
      //widget._matrix = moveSnakeLeft(widget.columns, _snakeElements, widget._matrix);
    });
  }

  void _moveUp() {
    setState(() {
      print("Points added: [c=" +
          _snakeElements[0].column.toString() +
          ",r:" +
          _snakeElements[0].row.toString() +
          "]");
      _direction = 2;
      _directionPoints.add(DirectionPoint(
          column: _snakeElements[0].column,
          direction: 2,
          row: _snakeElements[0].row));
      //widget._matrix = moveSnakeRight(widget.columns, _snakeElements, widget._matrix);
    });
  }

  void _moveDown() {
    setState(() {
      print("Points added: [c=" +
          _snakeElements[0].column.toString() +
          ",r:" +
          _snakeElements[0].row.toString() +
          "]");
      _direction = 3;
      _directionPoints.add(DirectionPoint(
          column: _snakeElements[0].column,
          direction: 3,
          row: _snakeElements[0].row));
      //widget._matrix = moveSnakeRight(widget.columns, _snakeElements, widget._matrix);
    });
  }
}
