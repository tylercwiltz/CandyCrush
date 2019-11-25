public class CandyPiece{

String color;
CandyPiece(String pieceColor){
  pieceColor= this.color;
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
