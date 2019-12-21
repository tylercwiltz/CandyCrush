public class CandyPiece {
  //CandyPiece candy = new CandyPiece("red", locX, locY);
  int colorr;
  int locX;
  int locY;

  CandyPiece( int x, int y) {
    this.locX = x;
    this.locY = y;
    chooseRandomColor();
  }

  boolean matches(CandyPiece piece) {
    if (colorr==piece.colorr) {
      return true;
    } else {
      return false;
    }
  }

  void chooseRandomColor() {
    int random = (int)random(5);
    if (random==0) {
      colorr = #FF0000;
    }
    if (random==1) {
      colorr = #0063FF;
    }
    if (random == 2) {
      colorr = #B600FF;
    }
    if (random == 3) {
      colorr = #00FF1F;
    }
    if (random == 4) {
      colorr = #FFAA00;
    }
  }

  CandyPiece getNeighbor(String direction) {
    int boardX= locX/100;
    int boardY = locY/100;
    if (direction.equalsIgnoreCase("up")) {
      println(boardX + ", " + boardY);
      return CandyCrush.board.gamestate[boardX][boardY-1];
    }  
    if (direction.equalsIgnoreCase("down")) {
      return CandyCrush.board.gamestate[boardX][boardY+1];
    }  
    if (direction.equalsIgnoreCase("left")) {
      return CandyCrush.board.gamestate[boardX-1][boardY];
    } 
    if (direction.equalsIgnoreCase("right")) {
      return CandyCrush.board.gamestate[boardX+1][boardY];
    }
    return null;
  }
}
