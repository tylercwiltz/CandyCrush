public class CandyBoard{
CandyPiece[][] gamestate;
int cellsPerRow;
int cellsPerColumn;
boolean isActive = true;

  CandyBoard(){
    cellsPerRow=10;
    cellsPerColumn=10;
    gamestate= new CandyPiece[10][10];
    for(int i=0; i< gamestate.length; i++){
      for(int j=0; j<gamestate[i].length; j++){
        gamestate[i][j] = new CandyPiece("red");
      }
    }
  }
    
   public void clearPiece(){
        for(int i=0; i< gamestate.length; i++) {
           for(int j=0; j<gamestate[i].length; j++){
              if(gamestate[i][j].isActive ==false) {
                gamestate.remove[i][j];
              }
            }
         }
    }
} 
