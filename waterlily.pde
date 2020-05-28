class WaterLily extends MovingBeing{
  
  float angle = 0;
  float aVelocity = 0;
  float aAcceleration = 0;
  
  WaterLily() {
    super();
  }
  
  void update() {     
     velocity.add(acceleration);
     velocity.limit(topspeed);
     location.add(velocity);
     
     aAcceleration = acceleration.x / 100;
     aVelocity += aAcceleration;
     aVelocity = constrain(aVelocity, -0.001, 0.001);
     angle += aVelocity;
     acceleration.mult(0);
  }
  
  void display() {
   stroke(35, 209, 122);
   fill(48, 140, 81);
   rectMode(CENTER);
   pushMatrix();
   translate(location.x, location.y);
   rotate(angle);
   ellipse(0, 0, 65, 50);
   popMatrix();
   
   // make these rotate too
   stroke(239, 168, 168);
   fill(239, 168, 168);
   ellipse(location.x-10, location.y-10, 20, 20);
   fill(241, 206, 206);
   ellipse(location.x-5, location.y-5, 20, 20);
   ellipse(location.x-10, location.y+1, 20, 20);
  }
}
