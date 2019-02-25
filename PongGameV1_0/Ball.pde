public class Ball {  
  
//------------------instance variables----------------------// 

  private float xCoord;          //x coordinate of the ball
  private float yCoord;          //y coordinate of the ball
  private float diameter;        //diameter of the ball
  private float speedX;          //speed along the x-axis
  private float speedY;          //speed along the y-axis

//--------------------constructors--------------------------//

public Ball(float diameter){
  setDiameter(diameter);
  resetBall();
}

//---------------------methods------------------------------//

  public void display() {
    fill(255);
    noStroke();
    circle(xCoord, yCoord, diameter);
  }
  
  public void hit(){
    speedX = speedX * -1;
    xCoord = xCoord + speedX;
  }
  
  public boolean update(){
    boolean lifeLost = false;
    
    //update ball coordinates
    xCoord = xCoord + speedX;
    yCoord = yCoord + speedY;
    
    //reset position if ball leaves right side of the screen
    if (xCoord > width + diameter/2){
      resetBall();
      lifeLost = true;
    }
    
    //if ball hits the left edge of the display window, change direction of xCoord
    if (xCoord < diameter/2){
      xCoord = diameter/2;
      speedX = speedX * -1;
    }
    
    //if ball hits top or bottom of the display window, change direction of yCoord
    if (yCoord > height - diameter/2){
      yCoord = height - diameter/2;
      speedY = speedY * -1;
    }
    else if (yCoord < diameter/2){
      yCoord = diameter/2;
      speedY = speedY * -1;
    }
    return lifeLost;
  } //end of update() method
  

  private void resetBall() {   //private helper method only used by the Ball constructor and update() method in Ball class
    xCoord = 0;
    yCoord = random(height);
    speedX = random(3, 5);
    speedY = random(-2, 2);
  }

//-----------------------getters---------------------//

  public float getXCoord() {
    return xCoord;
  }

  public float getYCoord() {
    return yCoord;
  }

  public float getDiameter() {
    return diameter;
  }

//----------------------setters----------------------//

  public void setDiameter(float diameter) {
    if ((diameter >= 20) && (diameter <= height/6)) {        //invalid entries default to 20
      this.diameter = diameter;
    } else {
      this.diameter = 20;
    }
  }
}
