public class CandyBoard {
  CandyPiece[][] gamestate;
  int cellsPerRow=10;
  int cellsPerColumn=10;

  boolean isActive = true;
  int topBorderOffset = (candyPieceSize*3)/2; //give gap of 1 candyPiece for header
  int leftBorderOffset = candyPieceSize/2; //line up pieces against left edge
  
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
  /////IN PROGRESS/////
  void collapse(){
   // while(setFalling()){
      setFalling();
   // }
  }
  
  //////IN PROGRESS/////////
  void dropPieces(){
    //go through the gameboard starting from the bottom right
      for(int i=0; i<gamestate.length; i++){
        for(int j=0; j<gamestate[i].length; j++){
            CandyPiece currentPiece = gamestate[i][j];
            //if the currentPiece is falling 
              if(currentPiece.falling){
                  //if the piece is done falling
                  if(currentPiece.fallDistance==0){
                    //set falling to false
                    currentPiece.falling = false;
                  }
                  else{
                    //make sure we don't overshoot the dropDistance
                    if(currentPiece.fallDistance >= currentPiece.fallSpeed){
                      currentPiece.yPos += currentPiece.fallSpeed;
                      currentPiece.fallDistance -= currentPiece.fallSpeed;
                    }
                    else{
                      //drop it down by the speed;   
                       currentPiece.yPos += currentPiece.fallDistance;
                    } 
                  }
              }
        }
    }
  }
  
  ///////IN PROGRESS//////////
  boolean setFalling(){
    //keeps track of whether there are pieces still falling
    boolean piecesFalling = false;
    //go through the gameboard starting from the bottom right
    for(int i=0; i<gamestate.length; i++){
      for(int j=0; j<gamestate[i].length; j++){
        //if there is a placeholder piece 
        if(gamestate[i][j] instanceof PlaceHolder){
          
          //if the placeholder is not still on the board
            //break - don't check the rest of the row
          
          //if the placeholder is not over an active piece
 
            piecesFalling = true;
            //set any piece in the column above that to falling=true
            for(int k=j-1; k>=0; k--){
              gamestate[i][k].colorr = #32a0a8;
              gamestate[i][k].falling = true;
              gamestate[i][k].fallDistance = 100;
            
            }
          //if we had piece in the row fall, dont check any rows above
          if(piecesFalling){
            break;
          }
        }
        
        
      }
    }
    return piecesFalling;
  }
  
  /////////NOT ALWAYS WORKING-->EDGE CASES?////////////
  CandyPiece[][] removeMatches(CandyPiece[][] gamestateCopy){
    int xPosCopy;
    int yPosCopy;
    
    for (int i=0; i< gamestateCopy.length; i++) {
      for (int j=0; j<gamestateCopy[i].length; j++) {
        xPosCopy = candyPieceSize*i+leftBorderOffset;
        yPosCopy = candyPieceSize*j+topBorderOffset;
        
        //check right
        if(i<board.gamestate.length-2){
         if(gamestateCopy[i][j].matches(gamestateCopy[i+1][j])){
          if(gamestateCopy[i][j].matches(gamestateCopy[i+2][j])){
            //+1 to right
            gamestateCopy[i+1][j] = new PlaceHolder(xPosCopy+candyPieceSize, yPosCopy);
            fill(gamestateCopy[i+1][j].colorr);
            ellipse(gamestateCopy[i+1][j].xPos,gamestateCopy[i+1][j].yPos,candyPieceSize,candyPieceSize);
            //+2 to right
            gamestateCopy[i+2][j] = new PlaceHolder(xPosCopy+candyPieceSize*2, yPosCopy);
            fill(gamestateCopy[i+2][j].colorr);
            ellipse(gamestateCopy[i+2][j].xPos,gamestateCopy[i+2][j].yPos,candyPieceSize,candyPieceSize);
            
            if(i<board.gamestate.length-3){
              if(gamestateCopy[i][j].matches(gamestateCopy[i+3][j])){
                //+3 to right
                gamestateCopy[i+3][j] = new PlaceHolder(xPosCopy+candyPieceSize*3, yPosCopy);
                fill(gamestateCopy[i+3][j].colorr);
                ellipse(gamestateCopy[i+3][j].xPos,gamestateCopy[i+3][j].yPos,candyPieceSize,candyPieceSize);
              
                if(i<board.gamestate.length-4){
                 if(gamestateCopy[i][j].matches(gamestateCopy[i+4][j])){
                  //+4 to right
                  gamestateCopy[i+4][j] = new PlaceHolder(xPosCopy+candyPieceSize*4, yPosCopy);
                  fill(gamestateCopy[i+4][j].colorr);
                  ellipse(gamestateCopy[i+4][j].xPos,gamestateCopy[i+4][j].yPos,candyPieceSize,candyPieceSize);
                 }
                }
              }
            }
            gamestateCopy[i][j]= new PlaceHolder(xPosCopy, yPosCopy);
            fill(gamestateCopy[i][j].colorr);
            ellipse(gamestateCopy[i][j].xPos,gamestateCopy[i][j].yPos,candyPieceSize,candyPieceSize);
          }
          }
        }
        //check down
        if(j<board.gamestate[i].length-2){
           if(gamestateCopy[i][j].matches(gamestateCopy[i][j+1])){
            if(gamestateCopy[i][j].matches(gamestateCopy[i][j+2])){
              //+1 down
              gamestateCopy[i][j+1] = new PlaceHolder(xPosCopy, yPosCopy+candyPieceSize);
              fill(gamestateCopy[i][j+1].colorr);
              ellipse(gamestateCopy[i][j+1].xPos,gamestateCopy[i][j+1].yPos,candyPieceSize,candyPieceSize);
              //+2 down
              gamestateCopy[i][j+2] = new PlaceHolder(xPosCopy, yPosCopy+candyPieceSize*2);
              fill(gamestateCopy[i][j+2].colorr);
              ellipse(gamestateCopy[i][j+2].xPos,gamestateCopy[i][j+2].yPos,candyPieceSize,candyPieceSize);
              
              if(j<board.gamestate[i].length-3){
               if(gamestateCopy[i][j].matches(gamestateCopy[i][j+3])){
                 //+3 down
                 gamestateCopy[i][j+3] = new PlaceHolder(xPosCopy, yPosCopy+candyPieceSize*3);
                 fill(gamestateCopy[i][j+3].colorr);
                 ellipse(gamestateCopy[i][j+3].xPos,gamestateCopy[i][j+3].yPos,candyPieceSize,candyPieceSize);
                 
                 if(j<board.gamestate[i].length-4){                        
                  if(gamestateCopy[i][j].matches(gamestateCopy[i][j+4])){
                   //+4 down
                   gamestateCopy[i][j+4] = new PlaceHolder(xPosCopy, yPosCopy+candyPieceSize*4);
                   fill(gamestateCopy[i][j+4].colorr);
                   ellipse(gamestateCopy[i][j+4].xPos,gamestateCopy[i][j+4].yPos,candyPieceSize,candyPieceSize);
                  }
                 }
               }
              }
              gamestateCopy[i][j]= new PlaceHolder(xPosCopy, yPosCopy);
              fill(gamestateCopy[i][j].colorr);
              ellipse(gamestateCopy[i][j].xPos,gamestateCopy[i][j].yPos,candyPieceSize,candyPieceSize);
            }
           }
        }
      }
    }
    return gamestateCopy;
  }
}
