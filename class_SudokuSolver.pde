class SudokuMaker {

// Funktion til at lave en Sudoku plade
  int[][] makeSudoku(int[][] mat) {
    solveSudokuRec(mat, 0, 0);
    return mat;
  }


  
  // returnerer sand hvis det kunne lade sig gøre
  // rekursiv funktion
  boolean solveSudokuRec(int[][] mat, int row, int col) {

    // Terminerings regl
    if (row == 8 && col == 9) {
      return true;
    }

    // Hvis vi er færdig med den ene kollonne gå til den næste
    if (col == 9) {
      row++;
      col = 0;
    }

    // Hvis der er et tal i cellen gå videre ! betyder ikke. det er en negering
    if (mat[row][col] != 0) {
      return solveSudokuRec(mat, row, col + 1);
    }

    for (int num = 1; num <= 9; num++) {
      // Er det sikker at placere tallet her?
      if (isSafe(mat, row, col, num)) {
        mat[row][col] = num;
        if (solveSudokuRec(mat, row, col + 1))
        {
          return true;
        }
        mat[row][col] = 0;
      }
    }
    // hvis det ikke var muligt at placere tallet 
    return false;
  }



  // funktion til at se om det er sikker at placere num i mat[row][col]
  boolean isSafe(int[][] mat, int row, int col, int num) {

    // Check om num findes i række
    for (int x = 0; x < 9; x++)
      if (mat[row][x] == num)
        return false;

    // Check om num findes i kollonne
    for (int x = 0; x < 9; x++)
      if (mat[x][col] == num)
        return false;

    // Check om num findes i 3x3 sub-matrix
    // jeg bruger modulo operator % for at finde den rigte blok
    int startRow = row - (row % 3), startCol = col - (col % 3);

    for (int i = 0; i < 3; i++)
      for (int j = 0; j < 3; j++)
        if (mat[i + startRow][j + startCol] == num)
          return false;

    return true;
  }
}
