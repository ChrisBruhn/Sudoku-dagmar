SudokuMaker sudo = new SudokuMaker(); //<>// //<>// //<>//

// istedet for en ArrayListe bruger jeg en intListe.
IntList firstRowNumbers=new IntList();



// Deklaration af min matrix
int[][] mat = new int[9][9];


void setup() {
  size(800, 800);
  textSize(20);
  textAlign(CENTER, CENTER);
  fill(0);

  makeFirstRow(); // laver en tilføldig række af tal fra 1 til 9
  initArray();
  
}


void draw() {
  background(227);
  drawGrid();
  drawNumbers();
}

void mousePressed() {
  // lav en soduku plade når jeg klikker på musen
  mat = sudo.makeSudoku(mat);
}



// her tegner jeg bare spille pladen
void drawGrid() {
  int cellHeight=50;
  for (int i =0; i<mat.length+1; i++) {
    line(100, 100+i*cellHeight, 550, 100+i*cellHeight);
  }

  for (int j=0; j<mat.length+1; j++) {
    line(100+j*cellHeight, 100, 100+j*cellHeight, 550);
  }
}

// her skriver jeg alle numre i cellerne på spille pladen
void drawNumbers() {
  // jeg bruger push og popMatrix for at undgå at tage højde for margin
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
  //udfyld med nuller
  for (int i = 0; i<mat.length-1; i++) {
    for (int j =0; j<mat[i].length-1; j++) {
      mat[i][j]=0;
    }
  }
    // overfør mine tilfældige til til den første kolonne i spillepladen
  for (int i=0; i<9; i++) {
    mat[0][i] = firstRowNumbers.get(i);
  }

  
}



// for at undgå at den første række er 1234... laver jeg den første række med tilfældige tal
void makeFirstRow() {
  boolean done = false;

  for (int i=0; i<9; i++) {
    done = false;

    // bliv ved indtil jeg finder et tal som ikke er i listen
    while (!done) {
      int number = (int)random(1, 10);
      // hvis number ikke findes i listen tilføj det.
      if (firstRowNumbers.hasValue(number) == false) {
        firstRowNumbers.append(number);
        done = true;
      }
    }
  }

  println(firstRowNumbers);
}
