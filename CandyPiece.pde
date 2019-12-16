public class CandyPiece{
//CandyPiece candy = new CandyPiece("red", locX, locY);
String colorr;
int locX;
int locY;

CandyPiece( int x, int y){
  this.locX = x;
  this.locY = y;
}

boolean matches(CandyPiece piece){
    if(this.colorr.equals(piece.colorr)){
      return true;
    }
    
    else{
      return false;
    }
  }
  
  void chooseRandomColor(){
    int random = (int)random(5);
    if(random==0){
      colorr = "red";
      fill(#FF0000);
    }
    if(random==1){
      colorr = "blue";
      fill(#0063FF);
    }
    if(random == 2){
      colorr = "purple";
      fill(#B600FF);
    }
     if(random == 3){
       colorr = "green";
      fill(#00FF1F);
    }
    if(random == 4){
      colorr = "orange";
      fill(#FFAA00);
    }
  }
}
