import 'package:snake_game/models/matrix_element.dart';

List<List<int>> moveSnakeRight(int columns, List<MatrixElement> list, var matrix) {
  for(MatrixElement m in list){
    if(m.column + 1 > columns - 1){
      m.column = 0;
    } else{
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

List<List<int>> moveSnakeLeft(int columns, List<MatrixElement> list, var matrix) {
  for(MatrixElement m in list){
    if(m.column - 1 < 0){
      m.column = columns - 1;
    } else{
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

List<MatrixElement> getSnakeElements(var matrix) {
  List<MatrixElement> list = [];
  int ind = 0;
  for(int i = 0; i < matrix[i].size; i++){
    for(MatrixElement e in matrix[i]){
      if(e.value == 1){
        list.add(e);
      }
    }
  }
  return list;
}