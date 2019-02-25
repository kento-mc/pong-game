Ball ball;

void setup(){
  size(600,600);
  noCursor();
  
  //setting up the ball with hard-coded sizes
  ball = new Ball(20.0);
}

void draw(){
  background(0);
  
  //update the ball position and display it
  ball.update();
  ball.display();
}
