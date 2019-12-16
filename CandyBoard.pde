public class CandyBoard{
CandyPiece[][] gamestate;
int cellsPerRow=10;
int cellsPerColumn=10;
int xPos = 50;
int yPos = 50;
boolean isActive = true;

  CandyBoard(){
    gamestate= new CandyPiece[cellsPerRow][cellsPerColumn];
    for(int i=0; i< gamestate.length; i++){
      for(int j=0; j<gamestate[i].length; j++){
        gamestate[i][j] = new CandyPiece(xPos, yPos);
        yPos+=100;
        xPos+=100;
      }
    }
  }
}
