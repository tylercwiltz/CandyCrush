int score=0;
int lives;
int movesRemaining;
final int MENU_STATE=0;
final int GAME_STATE=1;
final int END_STATE=2;
int currentState = MENU_STATE;
CandyBoard board;

void initiate(){
    if(currentState==MENU_STATE){
       System.out.println("use your mouse to select the piece you want to move and use the up, down, left, and right keys to indicate which way you want the piece to move");
         
    }
}
void setup(){
  board = new CandyBoard();
}

void draw(){
  for(int i=0; i< board.cellsPerRow; i++){
    for(int j=0; j<board.cellsPerColumn; j++){
      board.add(CandyPiece[i][j]);
    }  
  } 
} 
