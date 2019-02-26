public class Paddle {
  
//--------------------instance variables------------------------// 
  
  private int xCoord;            //  x coordinate of the paddle
  private int yCoord;            //  y coordinate of the paddle
  private int paddleWidth;       //  width of the paddle
  private int paddleHeight;      //  height of the paddle
  
//--------------------constructors--------------------------//

  public Paddle(int paddleWidth, int paddleHeight){
    setPaddleWidth(paddleWidth);
    setPaddleHeight(paddleHeight);
    
    xCoord = width - this.paddleWidth;
    yCoord = height/2;
  }
  
//---------------------methods------------------------------//

  public void display(){
    fill(100);
    noStroke();
    rect(xCoord, yCoord, paddleWidth, paddleHeight);
  }
  
  public void update(){
    yCoord = mouseY - paddleHeight/2; 
    
    if (yCoord < 0){
      yCoord = 0;
    }
    if (yCoord > (height - paddleHeight)){
      yCoord = height - paddleHeight;
    }
  }
  
//-----------------------getters---------------------// 
  
  public int getXCoord(){
    return xCoord;
  }
  
  public int getYCoord(){
    return yCoord;
  }
  
  public int getPaddleWidth(){
    return paddleWidth;
  }
  
  public int getPaddleHeight(){
    return paddleHeight;
  }
  
//----------------------setters----------------------//

  public void setPaddleWidth(int paddleWidth){
    if ((paddleWidth >= 20) && (paddleWidth <= width/2)){    //  invalid entries default to 20
      this.paddleWidth = paddleWidth;
    }
    else {
      this.paddleWidth = 20;
    }
  }
  
  public void setPaddleHeight(int paddleHeight){
    if ((paddleHeight >= 50) && (paddleHeight <= height/2)){    //  invalid entries default to 50
      this.paddleHeight = paddleHeight;
    }
    else {
      this.paddleHeight = 50;
    }
  }
  
}
