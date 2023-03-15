import 'package:flutter/material.dart';
import 'package:snake_game/models/matrix_element.dart';

import 'direction_point.dart';

List<dynamic> moveSnake(int direction, int columns, int rows,
    List<MatrixElement> listOfME, var matrix, List<DirectionPoint> points) {

  if(points.length == 0){
    //print("Points added: Points! :)");

    for (int i = 0; i < listOfME.length; i++) {
      if(direction == 0){
        matrix = _moveSnakeRight(columns, listOfME, matrix);
      }else if(direction == 1){
        matrix = _moveSnakeLeft(columns, listOfME, matrix);
      }else if(direction == 2){
        matrix = _moveSnakeUp(rows, listOfME, matrix);
      }else if(direction == 3){
        matrix = _moveSnakeDown(rows, listOfME, matrix);
      }
    }
    return [matrix];
  }else{
    //print("No Points!");
    return _moveSnakeWithPoints(direction,columns,rows,listOfME,matrix,points);
  }

}

List<List<int>> _moveSnakeRight(
    int columns, List<MatrixElement> list, var matrix) {
  for (MatrixElement m in list) {
    if (m.column + 1 > columns - 1) {
      m.column = 0;
    } else {
      m.column += 1;
    }
    matrix[m.row][m.column] = 1;
  }
  int col = list[list.length - 1].column;
  int row = list[list.length - 1].row;

  col = col - 1 < 0 ? columns - 1 : col - 1;
  matrix[row][col] = 0;

  return matrix;
}

List<List<int>> _moveSnakeLeft(
    int columns, List<MatrixElement> list, var matrix) {
  for (MatrixElement m in list) {
    if (m.column - 1 < 0) {
      m.column = columns - 1;
    } else {
      m.column -= 1;
    }
    matrix[m.row][m.column] = 1;
  }
  int col = list[list.length - 1].column;
  int row = list[list.length - 1].row;

  col = col + 1 > columns - 1 ? 0 : col + 1;
  matrix[row][col] = 0;

  return matrix;
}

List<List<int>> _moveSnakeUp(int rows, List<MatrixElement> list, var matrix) {
  for (MatrixElement m in list) {
    if (m.row - 1 < 0) {
      m.row = rows - 1;
    } else {
      m.row -= 1;
    }
    matrix[m.row][m.column] = 1;
  }
  int col = list[list.length - 1].column;
  int row = list[list.length - 1].row;

  row = row + 1 > rows - 1 ? 0 : row + 1;
  matrix[row][col] = 0;

  return matrix;
}

List<List<int>> _moveSnakeDown(int rows, List<MatrixElement> list, var matrix) {
  for (MatrixElement m in list) {
    if (m.row + 1 > rows - 1) {
      m.row = 0;
    } else {
      m.row += 1;
    }
    matrix[m.row][m.column] = 1;
  }
  int col = list[list.length - 1].column;
  int row = list[list.length - 1].row;

  row = row - 1 < 0 ? rows - 1 : row - 1;
  matrix[row][col] = 0;

  return matrix;
}

List<dynamic> _moveSnakeElementRight(
    int columns, MatrixElement element, var matrix) {
  if (element.column + 1 > columns - 1) {
    element.column = 0;
  } else {
    element.column += 1;
  }
  matrix[element.row][element.column] = 1;

  return [matrix, element];
}

List<dynamic> _moveSnakeElementLeft(
    int columns, MatrixElement element, var matrix) {
  if (element.column - 1 < 0) {
    element.column = columns - 1;
  } else {
    element.column -= 1;
  }
  matrix[element.row][element.column] = 1;

  return [matrix, element];
}

List<dynamic> _moveSnakeElementUp(
    int rows, MatrixElement element, var matrix) {
  if (element.row - 1 < 0) {
    element.row = rows - 1;
  } else {
    element.row -= 1;
  }
  matrix[element.row][element.column] = 1;

  return [matrix, element];
}

List<dynamic> _moveSnakeElementDown(
    int rows, MatrixElement element, var matrix) {
  if (element.row + 1 > rows - 1) {
    element.row = 0;
  } else {
    element.row = 1;
  }
  matrix[element.row][element.column] = 1;

  return [matrix, element];
}

List<MatrixElement> getSnakeElements(var matrix) {
  List<MatrixElement> list = [];
  int ind = 0;
  for (int i = 0; i < matrix[i].size; i++) {
    for (MatrixElement e in matrix[i]) {
      if (e.value == 1) {
        list.add(e);
      }
    }
  }
  return list;
}

List<dynamic> _moveSnakeWithPoints(int direction, int columns, int rows,
    List<MatrixElement> listOfME, var matrix, List<DirectionPoint> points){
  bool lastElement = false;

  for (int i = 0; i < listOfME.length; i++) {
    for (int p = 0; p < points.length; p++) {
      print("Element: " +  i.toString() + ", Point: " + p.toString());
      if (points[p].column == listOfME[i].column && points[p].row == listOfME[i].row) {
        final tempEl =  [listOfME[i].row, listOfME[i].column];

        if(points[p].direction == 0){
          print("Moving right?");
          listOfME[i].direction = 0;
          List<dynamic> list = _moveSnakeElementRight(columns, listOfME[i], matrix);
          matrix = list[0];
          listOfME[i] = list[1];

        } else if(points[p].direction == 1){
          print("Moving left?");
          listOfME[i].direction = 1;
          List<dynamic> list = _moveSnakeElementLeft(columns, listOfME[i], matrix);
          matrix = list[0];
          listOfME[i] = list[1];

        } else if(points[p].direction == 2){
          print("Moving up?");
          listOfME[i].direction = 2;
          List<dynamic> list = _moveSnakeElementUp(rows, listOfME[i], matrix);
          matrix = list[0];
          listOfME[i] = list[1];
        } else {
          print("Moving down?");
          listOfME[i].direction = 3;
          List<dynamic> list = _moveSnakeElementDown(rows, listOfME[i], matrix);
          matrix = list[0];
          listOfME[i] = list[1];
        }

        if(i == listOfME.length - 1){
          lastElement = true;
        }

        matrix[tempEl[0]][tempEl[1]] = 0;
      } else {
        final tempEl =  [listOfME[i].row, listOfME[i].column];
        if(listOfME[i].direction == 0) {
          List<dynamic> list = _moveSnakeElementRight(columns, listOfME[i], matrix);
          matrix = list[0];
          listOfME[i] = list[1];
        } else if(listOfME[i].direction == 1) {
          List<dynamic> list = _moveSnakeElementLeft(columns, listOfME[i], matrix);
          matrix = list[0];
          listOfME[i] = list[1];
        } else if(listOfME[i].direction == 2) {
          List<dynamic> list = _moveSnakeElementUp(columns, listOfME[i], matrix);
          matrix = list[0];
          listOfME[i] = list[1];
        } else if (listOfME[i].direction == 3){
          List<dynamic> list = _moveSnakeElementDown(columns, listOfME[i], matrix);
          matrix = list[0];
          listOfME[i] = list[1];
        }

        matrix[tempEl[0]][tempEl[1]] = 0;

        if(i == listOfME.length - 1){
          lastElement = true;
        }
      }
    }
  }

  if(lastElement){
    points.removeAt(0);
  }

  // for(int c = 0; c < matrix.length; c++){
  //   print(matrix[c].toString());
  // }
  //print(matrix.toString());
  return [matrix, points];
}