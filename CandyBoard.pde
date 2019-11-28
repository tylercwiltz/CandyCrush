public class CandyBoard{
CandyPiece[][] gamestate;
int cellsPerRow;
int cellsPerColumn;
  CandyBoard(){
    cellsPerRow=10;
    cellsPerColumn=10;
    gamestate= new CandyPiece[10][10];
    for(int i=0; i< gamestate.length; i++){
      for(int j=0; j<gamestate[i].length; j++){
        gamestate[i][j] = new CandyPiece("red");
      }
    }
    
    void clearPiece(){
    if (matches()==false){
      clear();
      }
    }
  } 
}
