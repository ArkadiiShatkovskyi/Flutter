import 'package:snake_game/models/matrix_element.dart';

import 'direction_point.dart';

List<List<int>> moveSnakeRight(
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

List<List<int>> moveSnakeLeft(
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

List<List<int>> moveSnakeUp(int rows, List<MatrixElement> list, var matrix) {
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

List<List<int>> moveSnakeDown(int rows, List<MatrixElement> list, var matrix) {
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

List<dynamic> moveSnakeElementRight(
    int columns, MatrixElement element, var matrix) {
  if (element.column + 1 > columns - 1) {
    element.column = 0;
  } else {
    element.column += 1;
  }
  matrix[element.row][element.column] = 1;

  return [matrix, element];
}

List<dynamic> moveSnakeElementLeft(
    int columns, MatrixElement element, var matrix) {
  if (element.column - 1 < 0) {
    element.column = columns - 1;
  } else {
    element.column -= 1;
  }
  matrix[element.row][element.column] = 1;

  return [matrix, element];
}

List<dynamic> moveSnakeElementUp(
    int rows, MatrixElement element, var matrix) {
  if (element.row - 1 < 0) {
    element.row = rows - 1;
  } else {
    element.row -= 1;
  }
  matrix[element.row][element.column] = 1;

  return [matrix, element];
}

List<dynamic> moveSnakeElementDown(
    int rows, MatrixElement element, var matrix) {
  if (element.row + 1 > rows - 1) {
    element.row = 0;
  } else {
    element.row += 1;
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

List<MatrixElement> moveSnake(int direction, int columns, int rows,
    List<MatrixElement> list, var matrix, List<DirectionPoint> points) {
  for (MatrixElement m in list) {
    for (DirectionPoint p in points) {
      if (p.column == m.column && p.row == m.row) {
        MatrixElement tempEl = m;
        if(p.direction == 0){
          m.direction = 0;
          List<dynamic> list = moveSnakeElementRight(columns, m, matrix);
          matrix = list[0];
          m = list[1];
        } else if(p.direction == 1){
          m.direction = 1;
          List<dynamic> list = moveSnakeElementRight(columns, m, matrix);
          matrix = list[0];
          m = list[1];
        } else if(p.direction == 2){
          m.direction = 2;
          List<dynamic> list = moveSnakeElementRight(columns, m, matrix);
          matrix = list[0];
          m = list[1];
        } else {
          m.direction = 3;
          List<dynamic> list = moveSnakeElementRight(columns, m, matrix);
          matrix = list[0];
          m = list[1];
        }
        matrix[tempEl.row][tempEl.column] = 0;
      }
    }
  }
  return matrix;
}