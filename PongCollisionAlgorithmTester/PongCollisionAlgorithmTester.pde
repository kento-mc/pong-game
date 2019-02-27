//-----------------------------------------------------------------------------------//
//  This sketch is a visualization of the different collision detection algorithms   // 
//  used in the Pong Game lab. To test the different versions, comment in/out the    //
//  appropriate methods within the draw method as commented below. Only one version  //
//  should be called each time the sketch is run.                                    //
//                                                                                   //
//  I wasn't as efficient as I could be setting up the variables and methods, and    // 
//  I'm not sure my calculation for the cornerDistance value is correct (how it      //
//  accounts for both corners still kind of wrecks my head), but working through     //
//  it this way helped me understand how the algorithms work.                        //
//---------------------------------------------------------------------------------- //

int paddleWidth = 70;
int paddleHeight = 200;
int diameter = 100;
    
void setup(){
  size(600,600);
  noCursor();
}

void draw(){
  background(0);
   
  paddle(paddleWidth, paddleHeight);
  
//--------------------comment in/out which version you want to test--------------------// 

  //v3();                 // collision detection extends past corners                   
  //v9noPyth();           // collision detection insensitive to corners               
  v9();                 // fully functioning collision detection
  
//-------------------------------------------------------------------------------------//
}  // close draw method


void v3(){                                                // from lab V3_0
  ballV3(diameter);
  hitPaddleV3(); 
  
  fill(255);  // text color: white
  text(("circleX: " + mouseX + ", circleY: " + mouseY), 5, 10);
  fill(0, 200, 55);  // text color: green
  text(("circleDistanceX: " + abs(mouseX - (width - paddleWidth))), 5, 24);
  fill(255, 0, 255);  // text color: purple
  text(("circleDistanceY: " + abs(mouseY - (height/2 - paddleHeight/2) - paddleHeight/2)), 5, 38);
  
//------------------------------circleDistanceX visual----------------------------------//
  fill(0, 200, 55);                                       // line point color
  noStroke();                                             // line point has no stroke
  circle(mouseX, mouseY, 5);                              // line point 1
  circle((width - paddleWidth), mouseY, 5);               // line point 2
  stroke(0, 200, 55);                                     // line color
  line(mouseX, mouseY, (width - paddleWidth), mouseY);    // line
  
//------------------------------circleDistanceY visual----------------------------------//
  fill(255, 0, 255);                                      // line point color
  noStroke();                                             // line point has no stroke
  circle(mouseX, mouseY, 5);                              // line point 1
  circle(mouseX, height/2, 5);                            // line point 2
  stroke(255, 0, 255);                                    // line color
  line(mouseX, mouseY,mouseX, (height/2));                // line  
  
}  // close v3 method

void v9noPyth(){                // from lab V9_0, but without using the Pythagorean theorem
  ballV9noPyth(diameter);
  hitPaddleV9noPyth();
  
  fill(255);  // text color: white
  text(("circleX: " + mouseX + ", circleY: " + mouseY), 5, 10);
  fill(0, 200, 55);  // text color: green  
  text(("circleDistanceX: " + abs(mouseX - (width - paddleWidth) - paddleWidth/2)), 5, 24);
  fill(255, 0, 255);  // text color: purple  
  text(("circleDistanceY: " + abs(mouseY - (height/2 - paddleHeight/2) - paddleHeight/2)), 5, 38);
  
//------------------------------circleDistanceX visual----------------------------------//
  fill(0, 200, 55);                                        // line point color
  noStroke();                                              // line point has no stroke
  circle(mouseX, mouseY, 5);                               // line point 1
  circle((width - (paddleWidth/2)), mouseY, 5);            // line point 2
  stroke(0, 200, 55);                                      // line color
  line(mouseX, mouseY, (width - (paddleWidth/2)), mouseY); // line
  
//------------------------------circleDistanceY visual----------------------------------//
  fill(255, 0, 255);                                       // line point color
  noStroke();                                              // line point has no stroke
  circle(mouseX, mouseY, 5);                               // line point 1
  circle(mouseX, height/2, 5);                             // line point 2
  stroke(255, 0, 255);                                     // line color
  line(mouseX, mouseY,mouseX, (height/2));                 // line    
  
}  // close v9noPyth method

void v9(){                                                 // full version from lab V9_0
  ballV9(diameter);
  hitPaddleV9();
  
  fill(255);  // text color
  text(("circleX: " + mouseX + ", circleY: " + mouseY), 5, 10);
  fill(0, 200, 55);  // text color: green    
  text(("circleDistanceX: " + abs(mouseX - (width - paddleWidth) - paddleWidth/2)), 5, 24);
  fill(255, 0, 255);  // text color: purple  
  text(("circleDistanceY: " + abs(mouseY - (height/2 - paddleHeight/2) - paddleHeight/2)), 5, 38);
  fill(255, 0, 0);  // text color: red
  text(("cornerDistance: " 
    + round(sqrt((pow(abs(mouseX - (width - paddleWidth) - paddleWidth/2) - (paddleWidth/2), 2))
    + pow(abs(mouseY - (height/2 - paddleHeight/2) - paddleHeight/2) - (paddleWidth/2), 2)))), 5, 52);
                           
//------------------------------circleDistanceX visual----------------------------------//
  fill(0, 200, 55);                                        // line point color
  noStroke();                                              // line point has no stroke
  circle(mouseX, mouseY, 5);                               // line point 1
  circle((width - (paddleWidth/2)), mouseY, 5);            // line point 2
  stroke(0, 200, 55);                                      // line color
  line(mouseX, mouseY, (width - (paddleWidth/2)), mouseY); // line
  
//------------------------------circleDistanceY visual----------------------------------//
  fill(255, 0, 255);                                       // line point color
  noStroke();                                              // line point has no stroke
  circle(mouseX, mouseY, 5);                               // line point 1
  circle(mouseX, height/2, 5);                             // line point 2
  stroke(255, 0, 255);                                     // line color
  line(mouseX, mouseY,mouseX, (height/2));                 // line    

//-------------------------------cornerDistance visual----------------------------------//
  fill(200, 0, 55);                                        // line point color
  noStroke();                                              // line point has no stroke
  circle(mouseX, mouseY, 5);                               // line point 1
  if (mouseY < height/2){                                  // line drawn to top corner
    circle((width - paddleWidth), (height/2 - (paddleHeight/2)), 5);  // line point 2
    stroke(200, 0, 55);                                    // line color
    line(mouseX, mouseY, (width - paddleWidth), (height/2 - (paddleHeight/2)));
  }
  else {                                                   // line drawn to bottom corner
    circle((width - paddleWidth), (height/2 + (paddleHeight/2)), 5);  // line point 2
    stroke(200, 0, 55);                                    // line color
    line(mouseX, mouseY, (width - paddleWidth), (height/2 + (paddleHeight/2)));
  }
}  // close v9 method

void paddle(int paddleWidth, int paddleHeight){
  fill(100);
  noStroke();
  rect(width - paddleWidth, height/2 - paddleHeight/2, paddleWidth, paddleHeight);
  
}  // close paddle method

void ballV3(float diameter){
  if (hitPaddleV3() == true){
    fill(255,0,0);
  }
  else {
    fill(0,255,0);
  }
  noStroke();
  circle(mouseX, mouseY, diameter);
  
}  // close ballV3 method
  
void ballV9noPyth(float diameter){  
  if (hitPaddleV9noPyth() == true){
    fill(255,0,0);
  }
  else {
    fill(0,255,0);
  }
  noStroke();
  circle(mouseX, mouseY, diameter);
  
}  // close ballV9_noPyth method

void ballV9(float diameter){
  if (hitPaddleV9() == true){
    fill(255,0,0);
  }
  else {
    fill(0,255,0);
  }
  noStroke();
  circle(mouseX, mouseY, diameter);
  
}  // close ballV9 method

boolean hitPaddleV3(){                                     // simple collision test from V3

//---------------------------------measure gap beween paddle & ball---------------------------------//
float circleDistanceX = abs(mouseX - (width - paddleWidth));                      
float circleDistanceY = abs(mouseY - (height/2 - paddleHeight/2) - paddleHeight/2);  
  
  if (circleDistanceX > (diameter/2)){                     //  x gap too large
    return false; 
  }
  else if (circleDistanceY > (paddleHeight/2 + diameter/2)){   //  y gap too large
    return false;
  }
  else {
    return true;
  }
}  // close hitPaddleV3 method

boolean hitPaddleV9noPyth(){                             // more complex collision test from V9

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
 
/*/---------------------------Pythagorean Theorem tests corner collision----------------------------//  
  float cornerDistance = pow(circleDistanceX - paddleWidth/2, 2) +  // x^2
                         pow(circleDistanceY - paddleHeight/2, 2);  // y^2
  
  if (cornerDistance <= pow(diameter/2, 2)){  // if cornerDistance < the radius of the ball
    return true;
  }
  else{
    return false;
  }*/
  return false;
  
}  // close hitPaddleV9noPyth method

boolean hitPaddleV9(){                              // more complex collision test from V9

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
}  // close hitPaddleV9 method
