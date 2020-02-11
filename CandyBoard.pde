public class CandyBoard {
  CandyPiece[][] gamestate;
  int cellsPerRow=10;
  int cellsPerColumn=10;

  boolean isActive = true;
  int topBorderOffset = (candyPieceSize*3)/2; //give gap of 1 candyPiece for header
  int leftBorderOffset = candyPieceSize/2; //line up pieces against left edge
  
  int a = 0;
  CandyBoard() { //make empty gameBoard(NO candyPieces) 
    gamestate= new CandyPiece[cellsPerRow][cellsPerColumn];
    int xPos = leftBorderOffset;
    int yPos = topBorderOffset;
    for (int i=0; i< gamestate.length; i++) {
      for (int j=0; j<gamestate[i].length; j++) {
        xPos = candyPieceSize*i+leftBorderOffset;
        yPos = candyPieceSize*j+topBorderOffset;
        gamestate[i][j] = new CandyPiece(xPos, yPos);
      }
    } 
  }
 
  /////////SEEMS TO ALWAYS WORK NOW////////////
  void removeMatches(){
    int currX;
    int currY;
    
    for (int i=0; i< gamestate.length; i++) {
      for (int j=0; j<gamestate[i].length; j++) {
        currX = gamestate[i][j].xPos;
        currY = gamestate[i][j].yPos;
        //check right
        if(i<board.gamestate.length-2){
         if(gamestate[i][j].matches(gamestate[i+1][j])){
          if(gamestate[i][j].matches(gamestate[i+2][j])){
            //+1 to right
            gamestate[i+1][j] = new PlaceHolder(currX+candyPieceSize, currY);
            //fill(gamestate[i+1][j].colorr);
            //ellipse(gamestate[i+1][j].xPos,gamestate[i+1][j].yPos,candyPieceSize,candyPieceSize);
            //+2 to right
            gamestate[i+2][j] = new PlaceHolder(currX+candyPieceSize*2, currY);
            //fill(gamestate[i+2][j].colorr);
            //ellipse(gamestate[i+2][j].xPos,gamestate[i+2][j].yPos,candyPieceSize,candyPieceSize);
            
            if(i<board.gamestate.length-3){
              if(gamestate[i][j].matches(gamestate[i+3][j])){
                //+3 to right
                gamestate[i+3][j] = new PlaceHolder(currX+candyPieceSize*3, currY);
                //fill(gamestate[i+3][j].colorr);
                //ellipse(gamestate[i+3][j].xPos,gamestate[i+3][j].yPos,candyPieceSize,candyPieceSize);
              
                if(i<board.gamestate.length-4){
                 if(gamestate[i][j].matches(gamestate[i+4][j])){
                  //+4 to right
                  gamestate[i+4][j] = new PlaceHolder(currX+candyPieceSize*4, currY);
                  //fill(gamestate[i+4][j].colorr);
                  //ellipse(gamestate[i+4][j].xPos,gamestate[i+4][j].yPos,candyPieceSize,candyPieceSize);
                 }
                }
              }
            }
            gamestate[i][j]= new PlaceHolder(currX, currY);
            //fill(gamestate[i][j].colorr);
            //ellipse(gamestate[i][j].xPos,gamestate[i][j].yPos,candyPieceSize,candyPieceSize);
          }
          }
        }
        //check down
        if(j<board.gamestate[i].length-2){
           if(gamestate[i][j].matches(gamestate[i][j+1])){
            if(gamestate[i][j].matches(gamestate[i][j+2])){
              //+1 down
              gamestate[i][j+1] = new PlaceHolder(currX, currY+candyPieceSize);
              //fill(gamestate[i][j+1].colorr);
              //ellipse(gamestate[i][j+1].xPos,gamestate[i][j+1].yPos,candyPieceSize,candyPieceSize);
              //+2 down
              gamestate[i][j+2] = new PlaceHolder(currX, currY+candyPieceSize*2);
              //fill(gamestate[i][j+2].colorr);
              //ellipse(gamestate[i][j+2].xPos,gamestate[i][j+2].yPos,candyPieceSize,candyPieceSize);
              
              if(j<board.gamestate[i].length-3){
               if(gamestate[i][j].matches(gamestate[i][j+3])){
                 //+3 down
                 gamestate[i][j+3] = new PlaceHolder(currX, currY+candyPieceSize*3);
                 //fill(gamestate[i][j+3].colorr);
                 //ellipse(gamestate[i][j+3].xPos,gamestate[i][j+3].yPos,candyPieceSize,candyPieceSize);
                 
                 if(j<board.gamestate[i].length-4){                        
                  if(gamestate[i][j].matches(gamestate[i][j+4])){
                   //+4 down
                   gamestate[i][j+4] = new PlaceHolder(currX, currY+candyPieceSize*4);
                   //fill(gamestate[i][j+4].colorr);
                   //ellipse(gamestate[i][j+4].xPos,gamestate[i][j+4].yPos,candyPieceSize,candyPieceSize);
                  }
                 }
               }
              }
              gamestate[i][j]= new PlaceHolder(currX, currY);
              //fill(gamestate[i][j].colorr);
              //ellipse(gamestate[i][j].xPos,gamestate[i][j].yPos,candyPieceSize,candyPieceSize);
            }
           }
        }
      }
    }
  }
  
  /*
   Move pieces down board to fill gaps
   Loop from bottom right to top left
   Check if piece is placeholder
   Then move piece above down one
   */
  void update() {
    PlaceHolder temp;
    
    //stop at 1 to avoid out of bounds (temp fix)
    for (int i=gamestate.length-1; i>= 0; i--) {
      for (int j=gamestate[i].length-1; j>= 1; j--) {
        //create temp PlaceHolder for old location of the falling piece
        temp = new PlaceHolder(gamestate[i][j-1].xPos,gamestate[i][j-1].yPos);
        
        //if current piece = PlaceHolder
        if(gamestate[i][j] instanceof PlaceHolder) {
           //move falling piece down to current piece location
           while(gamestate[i][j-1].yPos < gamestate[i][j].yPos) {
             gamestate[i][j-1].yPos++;
           }
           //update currPiece location in 2d array
           gamestate[i][j] = gamestate[i][j-1];
           //update fallingPiece location in 2d array
           gamestate[i][j-1] = temp;
        }
      }
    }
  }
  
  /*
   Generates new pieces at top of board as pieces shift down
   Loop from right to left
   Add new piece at index 0 of that column if it is a PlaceHolder
   */
  void dropNewPieces() {
     for (int i=gamestate.length-1; i>= 0; i--) {
       if(gamestate[i][0] instanceof PlaceHolder) {
         gamestate[i][0] = new CandyPiece(gamestate[i][0].xPos,gamestate[i][0].yPos);  
       }
     }
  }
  
}
