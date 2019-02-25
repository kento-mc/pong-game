Ball ball;
Paddle paddle;

int livesLost = 0;          //  track lives lost in a game
int score = 0;              //  high score of current game
int maxLivesPerGame = 3;    //  max lives that can be lost before game ends

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
  if (ball.update() == true){          //  if true, ball has left window, so a life is lost
    livesLost++;                       //  livesLost increments
    println("Lives lost: " + livesLost);
  }
  if (livesLost < maxLivesPerGame){    //  if any lives left
    ball.display();
    boolean collision = hitPaddle(paddle, ball);    
    if (collision == true){            //  true if ball and paddle overlap, false if not
      ball.hit();                      //  ball reverses direction
      score++;                         //  score increments
      println("Score: " + score);
    }
  }
  else{                                //  no lives left = game over
    println("Game Over!");
    println("You have lost all of your lives: " + livesLost);
    println("Your final score is: " + score);
    exit();
  }
  
  boolean collision = hitPaddle(paddle, ball);  //  true if ball and paddle overlap
  if (collision == true){
    ball.hit();                                 //  hit! ball reverses direction
  }
  
  //update the paddle position and display it
  paddle.update();
  paddle.display();
}                                      //  end of draw() method

boolean hitPaddle(Paddle paddle, Ball ball){    //  true for hit, false for miss

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
