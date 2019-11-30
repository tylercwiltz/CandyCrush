public class CandyPiece{
CandyPiece candy = new CandyPiece();
String color;
CandyPiece(String pieceColor){
  pieceColor= this.color;
}
if(matches(candy)==true){
  candy.remove();
}
boolean matches(CandyPiece piece){
    if(this.color.equals(piece.color)){
      return true;
    }
    
    else{
      return false;
    }
  }
}
