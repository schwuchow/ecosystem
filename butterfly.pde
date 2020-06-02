class Butterfly extends MovingBeing {
 
  Butterfly() {
    super();
  }
  
  void update() {
     velocity.add(acceleration);
     velocity.limit(topspeed);
     location.add(velocity);
     acceleration.mult(0);
  }
  
  void display() {
    
    beginShape();
    
    // main body
    fill(110, 92, 83);
    ellipse(location.x+300, location.y+600, 5, 50);
    
    fill(235, 158, 247);
    
    // lower left wing
    pushMatrix();
    translate(280, 615);
    rotate(radians(135));
    ellipse(location.x, location.y, 40, 25);
    popMatrix();
    
    // lower right wing
    pushMatrix();
    translate(320, 615);
    rotate(radians(45));
    ellipse(location.x, location.y, 40, 25);
    popMatrix();
    
    fill(145, 24, 163);
    
    // upper left wing
    pushMatrix();
    translate(277, 580);
    rotate(radians(45));
    ellipse(location.x, location.y, 50, 35);
    popMatrix();
    
    // upper right wing
    pushMatrix();
    translate(323, 580);
    rotate(radians(135));
    ellipse(location.x, location.y, 50, 35);
    popMatrix();
    
    // feelers
    stroke(110, 92, 83);
    line(location.x+298, location.y+575, location.x+290, location.y+560); // left
    line(location.x+302, location.y+575, location.x+310, location.y+560); // right
    
    endShape();
  }
  
}
