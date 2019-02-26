import javax.swing.*;

Ball ball;
Paddle paddle;
Player player;

int livesLost = 0;                    // track lives lost in a game
int score = 0;                        // high score of current game
int maxLivesPerGame = 3;              // max lives that can be lost before game ends
int maxNumberOfGames = 5;             // max number of games in tournament
int numberOfGamesPlayed = 0;          // games so far in tournament

void setup(){
  size(600,600);
  noCursor();
                                       
  ball = new Ball(20.0);              // setting up the ball  w/ hard-coded sizes
  paddle = new Paddle(20,100);        // setting up the paddle w/ hard-coded sizes
  maxNumberOfGames = Integer.parseInt(JOptionPane.showInputDialog(  // setting number of games w/ user input
    "Welcome to the Pong Tournament\n\n Please enter the number of  games you would like to play: ", "3"));
  player = new Player(JOptionPane.showInputDialog(  // setting up the player w/ user input
    "Enter the player name (max 6 chars): "), maxNumberOfGames);  
}                                     // close setup method                

void draw(){
  background(0);
  
//-------------------------------------// update the ball position and display it
  if (ball.update() == true){          // if true, ball has left window, so a life is lost
    livesLost++;                       // livesLost increments
    println("Lives lost: " + livesLost);
  }  // close if
  if (livesLost < maxLivesPerGame){    // if any lives left
    ball.display();
    boolean collision = hitPaddle(paddle, ball);    
    if (collision == true){            // true if ball and paddle overlap, false if not
      ball.hit();                      // ball reverses direction
      score++;                         // score increments
      println("Score: " + score);
    }  // close inner if
  }  // close outer if
  else {                               // no lives left = game over
    player.addScore(score);            // add score of current game to player.scores[] 
    numberOfGamesPlayed++;             // number of games increments
    
    if (numberOfGamesPlayed < maxNumberOfGames){  // if more games in tournament, ask to continue
      int reply = JOptionPane.showConfirmDialog(null,
        "Game Over! You Scored " + score + ".\nWould you like to play the next game in your tournament?",
        "Play next game?",
        JOptionPane.YES_NO_OPTION);
      if (reply == JOptionPane.YES_OPTION){
        resetGame();                                
      }  // close if
      else {                           // player choses to exit tournament
        tournamentOver();
      }  // close else
    }  // close if
    else {
      tournamentOver();                // no more games in tournament
    }  // close else
  }  // close if
  
  boolean collision = hitPaddle(paddle, ball);  // true if ball and paddle overlap
  if (collision == true){
    ball.hit();                                 // hit! ball reverses direction
  }
  
//----------------------------------------------// update the paddle position and display it
  paddle.update();
  paddle.display();
}                                      // close draw method

boolean hitPaddle(Paddle paddle, Ball ball){    // true for hit, false for miss

//-----------------------measure gap beween paddle & ball-----------------------//
  float circleDistanceX = abs(ball.getXCoord() - paddle.getXCoord());                      
  float circleDistanceY = abs(ball.getYCoord() - paddle.getYCoord() - paddle.getPaddleHeight()/2);
  
  if (circleDistanceX > (ball.getDiameter()/2)){  // x gap too large
    return false; 
  }
  if (circleDistanceY > (paddle.getPaddleHeight()/2 + ball.getDiameter()/2)){   // y gap too large
    return false;
  } 
  return true;
}

void resetGame(){                      // reset game variables
  println("Game Over!");
  println("Starting a new game...");
  livesLost = 0;
  score = 0;
}

void tournamentOver(){
  JOptionPane.showMessageDialog(null, player.getPlayerName() + ", your tournament is over!\n"
                                 + "Number of games played: " + numberOfGamesPlayed
                                 + "\n\n"                     + player.toString()
                                 + "\n\nHighest Score: "      + player.highestScore()
                                 + "\nLowest Score: "         + player.lowestScore()
                                 + "\nAverage Score: "        + player.averageScore());
                                
  exit();
}
