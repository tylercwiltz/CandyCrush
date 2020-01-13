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
      yPos=50;
      xPos+=100;
    }
  }
  
  CandyPiece[][] removeMatches(CandyPiece[][] gamestateCopy){
    for (int i=0; i< gamestateCopy.length; i++) {
      for (int j=0; j<gamestateCopy[i].length; j++) {
        //check left
        if(i>=2){
          if(gamestateCopy[i][j].matches(gamestateCopy[i-1][j])){
          if(gamestateCopy[i][j].matches(gamestateCopy[i-2][j])){
            gamestateCopy[i][j]= new PlaceHolder(i, j);
            gamestateCopy[i-1][j] = new PlaceHolder(i-1, j);
            gamestateCopy[i-2][j] = new PlaceHolder(i-2, j);
            }
          }
        }
        //check right
       /* if(i<board.gamestate.length-2){
          if(board.gamestate[i][j].matches(board.gamestate[i+1][j])){
          }
          if(board.gamestate[i][j].matches(board.gamestate[i+2][j])){
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
        */
      }
    }
    return gamestateCopy;
  }
}
