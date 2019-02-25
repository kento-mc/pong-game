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
  paddle.update();
  paddle.display();
}
