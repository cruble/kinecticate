
import SimpleOpenNI.*;

import javax.mail.*;
import javax.mail.internet.*;

SimpleOpenNI context;

boolean handsTrackFlag = false;
PVector handVec = new PVector();

PImage b;
PFont f; 

Rectname myRect;
Smallrect modRect; 
Smallrect miniRect2; 

int imageHeight = 1787;
int imageWidth = 833;

//PImage iconHappy; 
//PImage iconTired; 
//PImage iconGroovy; 
//PImage iconMeh; 
//PImage iconFoggy; 
//PImage iconLonely; 
//PImage iconSilly; 
//PImage iconFrustrated; 
//PImage iconWeird; 
//PImage leftbtn; 
//PImage rightbtn; 
PImage dash; 


String amount;
String feeling; 

//-------------lots of crazy variables 




int sequence = 1; 

float diff = 0; 
float old_diff = 0;
float diffLT = 0; 
float old_diffLT = 0; 
float diffRT = 0; 
float old_diffRT = 0; 
float diffUP = 0; 
float old_diffUP = 0; 
float diffDOWN = 0; 
float old_diffDOWN = 0; 
float diffDEPTH = 0; 
float old_diffDEPTH = 0; 
float old_leftHandz; 
float leftHandz; 


boolean button = false; 

int state = 1;
int old_state = 0; 
int stateLT = 1;
int old_stateLT = 0; 
int stateRT = 1;
int old_stateRT = 0; 
int stateUP = 1;
int old_stateUP = 0; 
int stateDOWN = 1;
int old_stateDOWN = 0; 
int stateDEPTH = 1; 
int old_stateDEPTH = 0; 
int stateFD = 1; 
int old_stateFD = 0; 
int stateBW = 1; 
int old_stateBW = 0; 
int state2DEPTH = 1; 
int old_state2DEPTH = 0; 
int depthcount = 0; 
int timer; 
int startTime = 0; 
int passedTime = 0; 
int sendFill = 0; 
int threeFill = 0; 
int twoFill = 0; 
int oneFill = 0; 
int sentFill = 0; 


float xpos; 
float ypos; 

float xrect = 1000; 
float yrect = 1000; 
float xRect2 = 1000;
float yRect2 = 1000; 
float xRectsm = 50;
float yRectsm = 243; 


//-------------lots of crazy variables ends 

//-----mail variables

int s = second();  // Values from 0 - 59
int m = minute();  // Values from 0 - 59
int h = hour();    // Values from 0 - 23

//-----mail variables 

void setup() {
  size(640, 480);  // strange, get drawing error in the cameraFrustum if i use P3D, in opengl there is no problem
  //size(1024,768,OPENGL);
  context = new SimpleOpenNI(this);
  context.setMirror(true);
  context.enableDepth();
  context.enableRGB(); //get color camera
  //unfortunately have to track guestures to get hands
  context.enableGesture();
  context.enableHands();
  context.addGesture("RaiseHand");
  f = createFont("Helvetica-Bold", 36, true);
  myRect = new Rectname(); 
  modRect = new Smallrect(); 


  fill(255, 0, 0);
  b = loadImage("hand_icon.png");
//  iconHappy = loadImage("happy.png");
//  iconGroovy = loadImage("groovy.png");
//  iconTired = loadImage("tired.png"); 
//  iconMeh = loadImage("meh.png");
//  iconFoggy = loadImage("foggy.png"); 
//  iconLonely = loadImage("lonely.png"); 
//  iconSilly = loadImage("silly.png"); 
//  iconFrustrated = loadImage("frustrated.png"); 
//  iconWeird = loadImage("weird.png"); 
//  leftbtn = loadImage("kinect_leftbtn.png"); 
//  rightbtn = loadImage("kinect_rightbtn.png"); 
//  alittle = loadImage("kinect_alittle.png"); 

 dash = loadImage("dash.png"); 
  amount = " "; 
  feeling = " "; 
  
  
  smooth();

}
void draw() {
  // update the cam
  context.update();
  //paint the image
  image(context.rgbImage(), 0, 0, width, height);
  textFont(f, 36);
  textAlign(LEFT);
 // text("Raise your hand!", 50, 60);
  
// image (iconGroovy, 138, 90); 
// image (iconSilly, 278, 90); 
// image (iconFoggy, 418, 90); 
// image (iconTired, 138, 190); 
// image (iconHappy, 278, 190); 
// image (iconWeird, 418, 190); 
// image (iconFrustrated, 138, 290); 
// image (iconLonely, 278, 290); 
// image (iconMeh, 418, 290); 
 //image (leftbtn, 15, 180); 
 //image (rightbtn, 540, 180); 
  image (dash, 0, 0);
  if (handsTrackFlag)
  {
    
    
 textFont(f, 24);
 textAlign(LEFT);
 fill(255); 
 text("I am feeling " + amount +" " + feeling, 150, 389); 

 textFont(f, 18); 
 fill(255); 
//text("a little", 60, 406);
//text("quite", 60, 204); 
//text("somewhat", 60, 273); 
//text("sort of", 60, 342); 
// text("a lot", 60, 135); 
//tint(255, 170); 

 textFont(f, 102);
 fill(204,102,0, sendFill); 
    
    PVector myPositionScreenCoords  = new PVector(); //storage device
    //convert the weird kinect coordinates to screen coordinates.
    context.convertRealWorldToProjective(handVec, myPositionScreenCoords);
    // depth 500 - 1400
    //float newImageWidth = map(myPositionScreenCoords.z, 500, 1400, imageWidth/6, imageWidth/13);
    //float newImageHeight = map(myPositionScreenCoords.z, 500, 1400, imageHeight/6, imageHeight/13);
    //ellipse(myPositionScreenCoords.x, myPositionScreenCoords.y, imagesize, imagesize);
    image(b, myPositionScreenCoords.x, myPositionScreenCoords.y);
    println(myPositionScreenCoords.x);
     //println(myPositionScreenCoords.y);
      //println(myPositionScreenCoords.z);
      
     myRect.display(xRect2,yRect2); 
     modRect.display(xrect,yrect); 
     
     if ((myPositionScreenCoords.x >= 65) && (myPositionScreenCoords.x <= 129) && (myPositionScreenCoords.y >= 87) && (myPositionScreenCoords.y <= 151)) {
          xRect2 = 60;   
          yRect2 = 82;
          feeling = "sily.";  
         
       } else if ((myPositionScreenCoords.x >= 176) && (myPositionScreenCoords.x <= 240) && (myPositionScreenCoords.y >= 87) && (myPositionScreenCoords.y <= 151)) {
         xRect2 = 171; 
         yRect2 = 82;
         feeling = "groovy.";  
         
       } else if ((myPositionScreenCoords.x >= 287) && (myPositionScreenCoords.x <= 351) && (myPositionScreenCoords.y >= 87) && (myPositionScreenCoords.y <= 151)) {
         xRect2 = 282; 
         yRect2 = 82;
       feeling = "foggy.";  
         
       } else if ((myPositionScreenCoords.x >= 399) && (myPositionScreenCoords.x <= 463) && (myPositionScreenCoords.y >= 87) && (myPositionScreenCoords.y <= 151)) {
         xRect2 = 394; 
         yRect2 = 82;
       feeling = "weird.";  
         
       } else if ((myPositionScreenCoords.x >= 510) && (myPositionScreenCoords.x <= 574) && (myPositionScreenCoords.y >= 87) && (myPositionScreenCoords.y <= 151)) {
         xRect2 = 505; 
         yRect2 = 82;
       feeling = "angry.";  
         
       } else if ((myPositionScreenCoords.x >= 120) && (myPositionScreenCoords.x <= 184) && (myPositionScreenCoords.y >= 172) && (myPositionScreenCoords.y <= 236)) {
         xRect2 = 115; 
         yRect2 = 167;
       feeling = "tired.";  
         
       } else if ((myPositionScreenCoords.x >= 230) && (myPositionScreenCoords.x <= 294) && (myPositionScreenCoords.y >= 172) && (myPositionScreenCoords.y <= 236)) {
         xRect2 = 225; 
         yRect2 = 167;
       feeling = "happy.";  
         
       } else if ((myPositionScreenCoords.x >= 340) && (myPositionScreenCoords.x <= 404) && (myPositionScreenCoords.y >= 172) && (myPositionScreenCoords.y <= 236)) {
         xRect2 = 335; 
         yRect2 = 167;
       feeling = "lonely.";  
         
       } else if ((myPositionScreenCoords.x >= 455) && (myPositionScreenCoords.x <= 519) && (myPositionScreenCoords.y >= 172) && (myPositionScreenCoords.y <= 236)) {
         xRect2 = 450; 
         yRect2 = 167;
       feeling = "sad.";  
         
       } 
       
       //-----modifiers start here 
       
     if ((myPositionScreenCoords.x >= 125) && (myPositionScreenCoords.x <= 184) && (myPositionScreenCoords.y >= 272) && (myPositionScreenCoords.y <= 332)) {
         xrect = 115;
         yrect = 262; 
       amount = "a little bit";  
         
       }   else if ((myPositionScreenCoords.x >= 235) && (myPositionScreenCoords.x <= 294) && (myPositionScreenCoords.y >= 272) && (myPositionScreenCoords.y <= 332)) {
           xrect = 225;
           yrect = 262; 
           amount = "somewhat";  
         
       }   else if ((myPositionScreenCoords.x >= 345) && (myPositionScreenCoords.x <= 404) && (myPositionScreenCoords.y >= 272) && (myPositionScreenCoords.y <= 332)) {
           xrect = 335;
           yrect = 262; 
           amount = "quite a bit";  
         
       }   else if ((myPositionScreenCoords.x >= 455) && (myPositionScreenCoords.x <= 514) && (myPositionScreenCoords.y >= 272) && (myPositionScreenCoords.y <= 332)) {
           xrect = 445;
           yrect = 267; 
           amount = "very";  
         
       } 
       
       //---------buttons are here 
       
            if ((myPositionScreenCoords.x >= 33) && (myPositionScreenCoords.x <= 119) && (myPositionScreenCoords.y >= 370) && (myPositionScreenCoords.y <= 447)) {
         xrect = 1000;
         yrect = 1000; 
          xRect2 = 1000; 
         yRect2 = 1000;
         
       amount = "";  
       feeling = " ";
         
       }   else if ((myPositionScreenCoords.x >= 504) && (myPositionScreenCoords.x <= 604) && (myPositionScreenCoords.y >= 357) && (myPositionScreenCoords.y <= 459) && (feeling != " ")) {
        
         
             sendMail();
             text("You just sent: Lindy feels "+amount +" "+ feeling, 65,60); 
             delay(2000); 
             //noLoop(); 

         
       }  
    
  }
          // *** use this for video: 
}
// ----------------------------------------------------------------- // hand events
void onCreateHands(int handId, PVector pos, float time) {
  println("onCreateHands - handId: " + handId + ", pos: " + pos + ", time:" + time);
  handsTrackFlag = true;
  handVec = pos;
}
void onUpdateHands(int handId, PVector pos, float time) {
  //println("onUpdateHandsCb - handId: " + handId + ", pos: " + pos + ", time:" + time);
  //store the location of the hand in a vector object
  handVec = pos;
}
void onDestroyHands(int handId, float time) {
  println("onDestroyHandsCb - handId: " + handId + ", time:" + time);
  handsTrackFlag = false;
  //go back to looking for the guesture that gave you hand.
  context.addGesture("RaiseHand");
}
// ----------------------------------------------------------------- // gesture events
void onRecognizeGesture(String strGesture, PVector idPosition, PVector endPosition) {
  println("onRecognizeGesture - strGesture: " + strGesture + ", idPosition: " + idPosition + ", endPosition:" + endPosition);
  //stop looking for the gesture
  context.removeGesture(strGesture);
  //use the location of this guesture tell you where to start tracking the hand
  context.startTrackingHands(endPosition);
}
void onProgressGesture(String strGesture, PVector position, float progress) {
  //println("onProgressGesture - strGesture: " + strGesture + ", position: " + position + ", progress:" + progress);
}
// ----------------------------------------------------------------- // Keyboard event
void keyPressed() {
  switch(key)
  {
  case ' ':
    context.setMirror(!context.mirror());
    break;
  }
}
