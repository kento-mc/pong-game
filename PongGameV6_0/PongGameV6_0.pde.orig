Ball ball;
Paddle paddle;
<<<<<<< HEAD
Player player;

int livesLost = 0;                    // track lives lost in a game
int score = 0;                        // high score of current game
int maxLivesPerGame = 3;              // max lives that can be lost before game ends
int maxNumberOfGames = 5;             // max number of games in tournament
int numberOfGamesPlayed = 0;          // games so far in tournament
=======

int livesLost = 0;                    //  track lives lost in a game
int score = 0;                        //  high score of current game
int maxLivesPerGame = 3;              //  max lives that can be lost before game ends
int maxNumberOfGames = 5;             //  max number of games in tournament
int numberOfGamesPlayed = 0;          //  games so far in tournament
>>>>>>> v6_0_working

void setup(){
  size(600,600);
  noCursor();
<<<<<<< HEAD
                                       
  ball = new Ball(20.0);              // setting up the ball  w/ hard-coded sizes
  paddle = new Paddle(20,100);        // setting up the paddle w/ hard-coded sizes
  player = new Player("  PongMaster  ", maxNumberOfGames);  // setting up the player
=======
  
  //setting up the ball and paddle with hard-coded sizes
  ball = new Ball(20.0);
  paddle = new Paddle(20,100);
>>>>>>> v6_0_working
}

void draw(){
  background(0);
  
<<<<<<< HEAD
//-------------------------------------// update the ball position and display it
  if (ball.update() == true){          // if true, ball has left window, so a life is lost
    livesLost++;                       // livesLost increments
    println("Lives lost: " + livesLost);
  }
  if (livesLost < maxLivesPerGame){    // if any lives left
    ball.display();
    boolean collision = hitPaddle(paddle, ball);    
    if (collision == true){            // true if ball and paddle overlap, false if not
      ball.hit();                      // ball reverses direction
      score++;                         // score increments
      println("Score: " + score);
    }
  }
  else{                                // no lives left = game over
    player.addScore(score);            // add score of current game to player.scores[] 
    numberOfGamesPlayed++;             // number of games increments
    
    if (numberOfGamesPlayed < maxNumberOfGames){  // if more games in tournament, start a new game
      resetGame();                                
    }
    else {
      tournamentOver();                // tournament over
    }
  }
  
  boolean collision = hitPaddle(paddle, ball);  // true if ball and paddle overlap
  if (collision == true){
    ball.hit();                                 // hit! ball reverses direction
=======
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
    numberOfGamesPlayed++;             //  number of games increments
    
    if (numberOfGamesPlayed < maxNumberOfGames){  //  if more games in tournament, start a new game
      resetGame();                                
    }
    else {
      tournamentOver();                //  tournament over
    }
  }
  
  boolean collision = hitPaddle(paddle, ball);  //  true if ball and paddle overlap
  if (collision == true){
    ball.hit();                                 //  hit! ball reverses direction
>>>>>>> v6_0_working
  }
  
  //update the paddle position and display it
  paddle.update();
  paddle.display();
<<<<<<< HEAD
}                                      // end of draw() method

boolean hitPaddle(Paddle paddle, Ball ball){    // true for hit, false for miss
=======
}                                      //  end of draw() method

boolean hitPaddle(Paddle paddle, Ball ball){    //  true for hit, false for miss
>>>>>>> v6_0_working

  //------------------measure gap beween paddle & ball-----------------------//
  float circleDistanceX = abs(ball.getXCoord() - paddle.getXCoord());                      
  float circleDistanceY = abs(ball.getYCoord() - paddle.getYCoord() - paddle.getPaddleHeight()/2);
  
<<<<<<< HEAD
  if (circleDistanceX > (ball.getDiameter()/2)){  // x gap too large
    return false; 
  }
  else if (circleDistanceY > (paddle.getPaddleHeight()/2 + ball.getDiameter()/2)){   // y gap too large
=======
  if (circleDistanceX > (ball.getDiameter()/2)){  //  x gap too large
    return false; 
  }
  else if (circleDistanceY > (paddle.getPaddleHeight()/2 + ball.getDiameter()/2)){   //  y gap too large
>>>>>>> v6_0_working
    return false;
  }
  else {
    return true;
  }
}

<<<<<<< HEAD
void resetGame(){                      // reset game variables
=======
void resetGame(){                      //  reset game variables
>>>>>>> v6_0_working
  println("Game Over!");
  println("Starting a new game...");
  livesLost = 0;
  score = 0;
}

void tournamentOver(){
<<<<<<< HEAD
  println("Game Over!\n");
  println(player.getPlayerName() + ", your tournament is over!\n"
                                 + "Number of games played: " + numberOfGamesPlayed
                                 + "\n\n"                     + player.toString());
                                
=======
  println("Game Over!");
  println("Tournament Over!");
>>>>>>> v6_0_working
  exit();
}
