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

List<List<int>> moveSnakeElementRight(
    int columns, MatrixElement element, var matrix) {
  if (element.column + 1 > columns - 1) {
    element.column = 0;
  } else {
    element.column += 1;
  }
  matrix[element.row][element.column] = 1;

  return matrix;
}

List<List<int>> moveSnakeElementLeft(
    int columns, MatrixElement element, var matrix) {
  if (element.column - 1 < 0) {
    element.column = columns - 1;
  } else {
    element.column -= 1;
  }
  matrix[element.row][element.column] = 1;

  return matrix;
}

List<List<int>> moveSnakeElementUp(
    int rows, MatrixElement element, var matrix) {
  if (element.row - 1 < 0) {
    element.row = rows - 1;
  } else {
    element.row -= 1;
  }
  matrix[element.row][element.column] = 1;

  return matrix;
}

List<List<int>> moveSnakeElementDown(
    int rows, MatrixElement element, var matrix) {
  if (element.row + 1 > rows - 1) {
    element.row = 0;
  } else {
    element.row += 1;
  }
  matrix[element.row][element.column] = 1;

  return matrix;
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
        if (direction == 0) {
          moveSnakeRight(columns, list, matrix);
        } else if (direction == 1) {
          moveSnakeLeft(columns, list, matrix);
        } else if (direction == 2) {
        } else {}
      }
    }
  }

  return matrix;
}
