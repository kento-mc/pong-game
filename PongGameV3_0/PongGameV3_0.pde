Ball ball;
Paddle paddle;

void setup(){
  size(600,600);
  noCursor();
  
  //setting up the ball and paddle with hard-coded sizes
  ball = new Ball(20.0);
  paddle = new Paddle(20,100);
}

void draw(){
  background(0);
  
  //update the ball position and display it
  ball.update();
  ball.display();
  
  boolean collision = hitPaddle(paddle, ball);  //  true if ball and paddle overlap
  if (collision == true){
    ball.hit();                                 // hit! ball reverses direction
  }
  
  //update the paddle position and display it
  paddle.update();
  paddle.display();
}

boolean hitPaddle(Paddle paddle, Ball ball){    // true for hit, false for miss

  //------------------measure gap beween paddle & ball-----------------------//
  float circleDistanceX = abs(ball.getXCoord() - paddle.getXCoord());                      
  float circleDistanceY = abs(ball.getYCoord() - paddle.getYCoord() - paddle.getPaddleHeight()/2);
  
  if (circleDistanceX > (ball.getDiameter()/2)){  //  x gap too large
    return false; 
  }
  else if (circleDistanceY > (paddle.getPaddleHeight()/2 + ball.getDiameter()/2)){   //  y gap too large
    return false;
  }
  else {
    return true;
  }
}
