
class Rectname { 
  
  float xpos; 
  float ypos; 
  
  Rectname() {
  }

  
  void display(float tempXpos, float tempYpos) {
    xpos = tempXpos; 
    ypos = tempYpos; 
  stroke(5, 96, 127);
  strokeWeight(6); 
  line(xpos, ypos, xpos+20, ypos); 
  line(xpos+53, ypos, xpos+73, ypos); 
  line(xpos, ypos, xpos, ypos+20); 
  line(xpos, ypos+53, xpos, ypos+73);
  line(xpos, ypos+73, xpos+20, ypos+73);
  line(xpos+53, ypos+73, xpos+73, ypos+73);
  line(xpos+73, ypos+73, xpos+73, ypos+53); 
  line(xpos+73, ypos, xpos+73, ypos+20); 
  }
  
}
