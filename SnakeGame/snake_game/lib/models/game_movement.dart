import 'package:snake_game/models/matrix_element.dart';

int moveSnakeRight(var matrix, int _strIndRow, int _strIndCol, int columns) {
  //print("Value 1 3: " + (_strIndCol + 1).toString());
  if (_strIndCol == 1) {
    if (matrix[_strIndRow][columns - 1].value == 1) {
      matrix[_strIndRow][columns - 1].value = 0;
    }
    matrix[_strIndRow][_strIndCol - 1].value = 0;

    matrix[_strIndRow][_strIndCol].value = 1;
    matrix[_strIndRow][_strIndCol + 1].value = 1;
  } else if (_strIndCol + 1 < columns) {
    if (_strIndCol - 1 >= 0) {
      matrix[_strIndRow][_strIndCol - 1].value = 0;
    }
    matrix[_strIndRow][_strIndCol].value = 1;
    matrix[_strIndRow][_strIndCol + 1].value = 1;
  } else if (_strIndCol + 1 >= columns) {
    if (_strIndCol - 1 >= 0 && _strIndCol - 1 < columns) {
      matrix[_strIndRow][_strIndCol - 1].value = 0;
    }

    _strIndCol = 0;
    matrix[_strIndRow][_strIndCol].value = 1;
  }
  _strIndCol = _strIndCol + 1;

  return _strIndCol;
}

int moveSnakeLeft(var matrix, int _strIndRow, int _strIndCol, int columns) {
  //print("Value 1 3: " + (_strIndCol + 1).toString());

  //moveRight
  if(_strIndCol == 0){

  }
  _strIndCol = _strIndCol + 1;

  return _strIndCol;
}

List<MatrixElement> getSnakeElements(var matrix){
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