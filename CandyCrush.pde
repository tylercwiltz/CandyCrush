
int score=0;
int lives=3;
int movesRemaining=20;
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
  size(1000,1000);
  board = new CandyBoard();
}

void draw(){
  drawBoard();
  } 
 
 void mousePressed(){
   //divide by 100 to change from pixels to indexes
   println(mouseX/100 + " " + mouseY/100);
  
 }
 void keyPressed(){
  if (key == CODED) {
    if (keyCode == UP) {
      println("cool");
      board.gamestate[mouseX/100][mouseY/100] = board.gamestate[mouseX/100][(mouseY/100)-1];
    } else if (keyCode == DOWN) {
      
    } 
  } else {
    
  }
 }
  void drawBoard(){
    int xPos = 50;
    int yPos = 50;
     for(int i=0; i< board.gamestate.length; i++){
      for(int j=0; j<board.gamestate[i].length; j++){
        board.gamestate[i][j] = new CandyPiece(xPos, yPos);
        yPos+=100;
      }
      yPos = 50;
      xPos+=100;
    }
 }
