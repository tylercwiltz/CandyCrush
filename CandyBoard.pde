public class CandyBoard {
  CandyPiece[][] gamestate;
  int cellsPerRow=10;
  int cellsPerColumn=10;
  int xPos = 50;
  int yPos = 50;
  boolean isActive = true;

  CandyBoard() {
    gamestate= new CandyPiece[cellsPerRow][cellsPerColumn];
    for (int i=0; i< gamestate.length; i++) {
      for (int j=0; j<gamestate[i].length; j++) {
        gamestate[i][j] = new CandyPiece(xPos, yPos);
        yPos+=100;
      }
      yPos=0;
      xPos+=100;
    }
  }
  
  void removeMatches(){
    for (int i=0; i< gamestate.length; i++) {
      for (int j=0; j<gamestate[i].length; j++) {
        //check right
        if(i<board.gamestate.length-2){
          if(board.gamestate[i][j].matches(board.gamestate[i+1][j])){
          }
          if(board.gamestate[i][j].matches(board.gamestate[i+2][j])){
          }
        }
        //check left
        if(i>1){
          if(board.gamestate[i][j].matches(board.gamestate[i-1][j])){
          }
          if(board.gamestate[i][j].matches(board.gamestate[i-2][j])){
          }
        }
        //check up
         if(j>1){
          if(board.gamestate[i][j].matches(board.gamestate[i][j-1])){
          }
          if(board.gamestate[i][j].matches(board.gamestate[i][j-2])){
          }
        }
        //check down
        if(j<board.gamestate[i].length-2){
          if(board.gamestate[i][j].matches(board.gamestate[i][j+1])){
          }
          if(board.gamestate[i][j].matches(board.gamestate[i][j+2])){
          }
        }
      }
    }
  }
}
