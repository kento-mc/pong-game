int paddleWidth = 70;
int paddleHeight = 200;
float diameter = 100;
int circleDistanceX = abs(mouseX - (width - paddleWidth) - paddleWidth/2);                      
int circleDistanceY = abs(mouseY - (height/2 - paddleHeight/2) - paddleHeight/2);
    
void setup(){
  size(600,600);
  noCursor();
}

void draw(){
  background(0);
  
  paddle(paddleWidth, paddleHeight);
  ball(diameter);
  //hitPaddleV3();
  hitPaddleV9();
  
  println(mouseX + ", " + mouseY);
  println(circleDistanceX + ", " + circleDistanceY);

}  // close draw method


void paddle(int paddleWidth, int paddleHeight){
  fill(100);
  noStroke();
  rect(width - paddleWidth, height/2 - paddleHeight/2, paddleWidth, paddleHeight);
}

void ball(float diameter){
  if (hitPaddleV3() == true){
    fill(255,0,0);
  }
  else {
    fill(0,255,0);
  }
  if (hitPaddleV9() == true){
    fill(255,0,0);
  }
  else {
    fill(0,255,0);
  }
  noStroke();
  circle(mouseX, mouseY, diameter);
}

boolean hitPaddleV3(){

//---------------------------------measure gap beween paddle & ball---------------------------------//
float circleDistanceX = abs(mouseX - (width - paddleWidth) - paddleWidth/2);                      
float circleDistanceY = abs(mouseY - (height/2 - paddleHeight/2) - paddleHeight/2);  
  
  if (circleDistanceX > (diameter/2)){  //  x gap too large
    return false; 
  }
  else if (circleDistanceY > (paddleHeight/2 + diameter/2)){   //  y gap too large
    return false;
  }
  else {
    return true;
  }
}

boolean hitPaddleV9(){                                      // true for hit, false for miss

//---------------------------------measure gap beween paddle & ball---------------------------------//
float circleDistanceX = abs(mouseX - (width - paddleWidth) - paddleWidth/2);                      
float circleDistanceY = abs(mouseY - (height/2 - paddleHeight/2) - paddleHeight/2);
  
  if (circleDistanceX > (paddleWidth/2 + diameter/2)){    // x gap too large
    return false; 
  }
  if (circleDistanceY > (paddleHeight/2 + diameter/2)){   // y gap too large
    return false;
  }
  if (circleDistanceX <= (paddleWidth/2)){                // x gap small enough
    return true;
  }
  if (circleDistanceY <= (paddleHeight/2)){               // y gap small enough
    return true;
  }
 
//---------------------------Pythagorean Theorem tests corner collision----------------------------//  
  float cornerDistance = pow(circleDistanceX - paddleWidth/2, 2) +  // x^2
                         pow(circleDistanceY - paddleHeight/2, 2);  // y^2
  
  if (cornerDistance <= pow(diameter/2, 2)){  // if cornerDistance < the radius of the ball
    return true;
  }
  else{
    return false;
  }
  //return false;
}  // close hitPaddle method
