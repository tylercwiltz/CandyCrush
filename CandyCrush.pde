int candyPieceSize;
int score=0;
int lives=3;
int movesRemaining=20;
int lastClickedX= 0;
int lastClickedY = 0;
final int MENU_STATE=0;
final int GAME_STATE=1;
final int END_STATE=2;
int currentState = MENU_STATE;
public static CandyBoard board;

void initiate() {
  if (currentState==MENU_STATE) {
    System.out.println("use your mouse to select the piece you want to move and use the up, down, left, and right keys to indicate which way you want the piece to move");
  }
}
void setup() {
  //height = width+(width/10)
  size(500, 550);
  background(#D1F2FF);
  candyPieceSize = width/10;
  board = new CandyBoard();
  board.removeMatches();
}

void draw() {
  background(#D1F2FF);
  drawBoard();
  //board.removeMatches();
  //board.update();
  fill(0,0,0);
  textSize(candyPieceSize);
  textAlign(LEFT,BOTTOM);
  text("Score: I WIN",0,candyPieceSize);
} 

void mousePressed() {
  //divide by candyPieceSize to change from pixels to indexes
  //ex: if (width=500) => (candyPieceSize=width/10) == 50) =>
  // => (mouseX=250)/(candyPieceSize) == 5 
  lastClickedX = mouseX/candyPieceSize;
  lastClickedY = (mouseY/candyPieceSize)-1; //-1 offset for headerOffset
}
void keyPressed() {
  if (key == 'r' || key == 'R') {
    board.removeMatches();
  }
     
  if (key == 'c' || key == 'C') {
      board.update();
      board.dropNewPieces();
  }
     
  if (key == CODED) {
    if (keyCode == UP) {
     board.gamestate[lastClickedX][lastClickedY].swapColors(board.gamestate[lastClickedX][lastClickedY-1]);
    } else if (keyCode == DOWN) {
        board.gamestate[lastClickedX][lastClickedY].swapColors(board.gamestate[lastClickedX][lastClickedY+1]);
    } else if (keyCode==RIGHT) {
       board.gamestate[lastClickedX][lastClickedY].swapColors(board.gamestate[lastClickedX+1][lastClickedY]);
    
    
    }else {
        board.gamestate[lastClickedX][lastClickedY].swapColors(board.gamestate[lastClickedX-1][lastClickedY]); 
    }
  }
}
void drawBoard() {
  for (int i=0; i< board.gamestate.length; i++) {
    for (int j=0; j<board.gamestate[i].length; j++) {
      CandyPiece temp = board.gamestate[i][j];
      if(!(temp instanceof PlaceHolder)){
        fill(temp.colorr);
        ellipse(temp.xPos, temp.yPos, candyPieceSize, candyPieceSize);
      }
    }
  }
}
