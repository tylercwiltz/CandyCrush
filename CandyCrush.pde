
int score=0;
int lives=3;
int movesRemaining=20;
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
  size(1000, 1000);
  board = new CandyBoard();
}

void draw() {
  drawBoard();
} 

void mousePressed() {
  //divide by 100 to change from pixels to indexes
  println(mouseX/100 + " " + mouseY/100);
}
void keyPressed() {
  if (key == CODED) {
    int candyX= mouseX/100;
    int candyY = mouseY/100;
    if (keyCode == UP) {
      println(candyX  + ", " + candyY);
      board.gamestate[candyX][candyY].colorr = board.gamestate[candyX][candyY].getNeighbor("up").colorr;
      board.gamestate[candyX][candyY].getNeighbor("up").colorr = board.gamestate[candyX][candyY].colorr;
    } else if (keyCode == DOWN) {
      board.gamestate[candyX][candyY].colorr = board.gamestate[candyX][candyY].getNeighbor("down").colorr;
      board.gamestate[candyX][candyY].getNeighbor("down").colorr = board.gamestate[candyX][candyY].colorr;
    } else if (keyCode==RIGHT) {
     board.gamestate[candyX][candyY].colorr = board.gamestate[candyX][candyY].getNeighbor("right").colorr;
     board.gamestate[candyX][candyY].getNeighbor("right").colorr = board.gamestate[candyX][candyY].colorr;
    } else {
     board.gamestate[candyX][candyY].colorr = board.gamestate[candyX][candyY].getNeighbor("left").colorr;
     board.gamestate[candyX][candyY].getNeighbor("left").colorr = board.gamestate[candyX][candyY].colorr;
    }
  }
}
void drawBoard() {
  int xPos = 50;
  int yPos = 50;
  for (int i=0; i< board.gamestate.length; i++) {
    for (int j=0; j<board.gamestate[i].length; j++) {
      fill(board.gamestate[i][j].colorr);
      ellipse(xPos, yPos, 60, 60);
      yPos+=100;
    }
    yPos = 50;
    xPos+=100;
  }
}
