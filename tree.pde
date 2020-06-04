class Tree {
  
  PVector location;
  float len2 = 0;
  
  Tree() {
    location = new PVector(300, 400);
  }
  
  void branch(float len) {
     strokeWeight(len/10);
     line(0, 0, 0, -len);
     translate(0, -len);
     
     len *= 0.66;
     len2 += 0.0001;
     float theta = map(noise(len2), 0, 1, 0, PI/2);
     
     if (len > 2) {
       pushMatrix();
       rotate(theta);
       branch(len);
       popMatrix();
       
       pushMatrix();
       rotate(-theta);
       branch(len);
       popMatrix();
     }
  }
  
  void display() {
     translate(location.x, location.y);
     stroke(0);
     branch(50);
  }
}
