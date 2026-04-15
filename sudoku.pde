SudokuSolver sudo = new SudokuSolver(); //<>// //<>//

int[][] mat = new int[9][9];


void setup() {
  size(800, 800);
  initArray();
  textSize(20);
  textAlign(CENTER, CENTER);
  fill(0);
}


void draw() {
  background(227);
  drawGrid();
  drawNumbers();
}

void mousePressed() {
  generate();
}


void generate() {
  mat = sudo.solveSudoku(mat);
}


void drawGrid() {
  int cellHeight=50;
  for (int i =0; i<mat.length+1; i++) {
    line(100, 100+i*cellHeight, 550, 100+i*cellHeight);
  }

  for (int j=0; j<mat.length+1; j++) {
    line(100+j*cellHeight, 100, 100+j*cellHeight, 550);
  }
}

void drawNumbers() {
  pushMatrix();
  translate(100, 100);
  for (int i = 0; i < mat.length; i++) {
    for (int j = 0; j < mat[i].length; j++) {
      text(mat[i][j], i*50+25, j*50+25 );
    }
  }
  popMatrix();
}


void initArray() {
  for (int i = 0; i<mat.length-1; i++) {
    for (int j =0; j<mat[i].length-1; j++) {
      mat[i][j]=0;
    }
  }
  mat[0][0] = (int)random(0, 10);
    mat[0][1] = (int)random(0, 10);
    mat[0][2] = (int)random(0, 10);
}
