class Smallrect { 
  
  float xpossmall; 
  float ypossmall; 
  
  Smallrect() {
  }
  
  void display(float tempXpossmall, float tempYpossmall) {
    xpossmall = tempXpossmall; 
    ypossmall = tempYpossmall; 
  stroke(50, 120, 127);
  strokeWeight(6); 
  line(xpossmall, ypossmall, xpossmall+20, ypossmall); 
  line(xpossmall+63, ypossmall, xpossmall+83, ypossmall); 
  line(xpossmall, ypossmall, xpossmall, ypossmall+20); 
  line(xpossmall, ypossmall+63, xpossmall, ypossmall+83);
  line(xpossmall, ypossmall+83, xpossmall+20, ypossmall+83);
  line(xpossmall+63, ypossmall+83, xpossmall+83, ypossmall+83);
  line(xpossmall+83, ypossmall+83, xpossmall+83, ypossmall+63); 
  line(xpossmall+83, ypossmall, xpossmall+83, ypossmall+20); 
  }
  

  
}
