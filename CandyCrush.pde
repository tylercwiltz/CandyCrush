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
  size(1000, 1000);
  board = new CandyBoard();
}

void draw() {
  drawBoard();
} 

void mousePressed() {
  //divide by 100 to change from pixels to indexes
  println(mouseX/100 + " " + mouseY/100);
  lastClickedX = mouseX/100;
  lastClickedY =  mouseY/100;
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      println(lastClickedX  + ", " + lastClickedY);
      board.gamestate[lastClickedX][lastClickedY].colorr = board.gamestate[lastClickedX][lastClickedY].getNeighbor("up").colorr;
      board.gamestate[lastClickedX][lastClickedY].getNeighbor("up").colorr = board.gamestate[lastClickedX][lastClickedY].colorr;
    } else if (keyCode == DOWN) {
      board.gamestate[lastClickedX][lastClickedY].colorr = board.gamestate[lastClickedX][lastClickedY].getNeighbor("down").colorr;
      board.gamestate[lastClickedX][lastClickedY].getNeighbor("down").colorr = board.gamestate[lastClickedX][lastClickedY].colorr;
    } else if (keyCode==RIGHT) {
      board.gamestate[lastClickedX][lastClickedY].colorr = board.gamestate[lastClickedX][lastClickedY].getNeighbor("right").colorr;
      board.gamestate[lastClickedX][lastClickedY].getNeighbor("right").colorr = board.gamestate[lastClickedX][lastClickedY].colorr;
    } else {
      board.gamestate[lastClickedX][lastClickedY].colorr = board.gamestate[lastClickedX][lastClickedY].getNeighbor("left").colorr;
      board.gamestate[lastClickedX][lastClickedY].getNeighbor("left").colorr = board.gamestate[lastClickedX][lastClickedY].colorr;
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
