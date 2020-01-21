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
    int xCopy;
    int yCopy;
    int diameterOfPieces=100;
   
    for (int i=0; i< gamestateCopy.length; i++) {
      for (int j=0; j<gamestateCopy[i].length; j++) {
        xCopy = 100*i+50;
        yCopy = 100*j+50;
        //check right
        if(i<board.gamestate.length-3){
         if(gamestateCopy[i][j].matches(gamestateCopy[i+1][j])){
          if(gamestateCopy[i][j].matches(gamestateCopy[i+2][j])){
            gamestateCopy[i][j]= new PlaceHolder(xCopy, yCopy);
            gamestateCopy[i+1][j] = new PlaceHolder(xCopy+diameterOfPieces*1, yCopy);
            gamestateCopy[i+2][j] = new PlaceHolder(xCopy+diameterOfPieces*2, yCopy);
            }
          }
         }
        //check down
        if(j<board.gamestate[i].length-3){
           if(gamestateCopy[i][j].matches(gamestateCopy[i][j+1])){
            if(gamestateCopy[i][j].matches(gamestateCopy[i][j+2])){
              gamestateCopy[i][j]= new PlaceHolder(xCopy, yCopy);
              gamestateCopy[i][j+1] = new PlaceHolder(xCopy, yCopy+diameterOfPieces*1);
              gamestateCopy[i][j+2] = new PlaceHolder(xCopy, yCopy+diameterOfPieces*2);
            }
          }
        }
      }
    }
    return gamestateCopy;
      }
    }
