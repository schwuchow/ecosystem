abstract class MovingBeing {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float topspeed;
  
  MovingBeing() {
    this.location = new PVector(0,0);
    this.velocity = new PVector(0,0);
    this.acceleration = new PVector(0,0);
    this.mass = 1;
    this.topspeed = 1;
  }  
  
  MovingBeing atLocation(PVector location) {
    this.location = location;
    return this;
  }
  
  MovingBeing withVelocity(PVector velocity) {
    this.velocity = velocity;
    return this;
  }
  
  MovingBeing withAcceleration(PVector acceleration) {
    this.acceleration = acceleration;
    return this;
  }
  
  MovingBeing withMass(float mass) {
    this.mass = mass;
    return this;
  }
  
  MovingBeing withTopSpeed(float topspeed) {
    this.topspeed = topspeed;
    return this;
  }
  
  abstract void update();
  abstract void display();
  
  // Newtons 2nd Law
  // F = M * A
  // A = F/M
  void applyForce(PVector force) {
   PVector f = force.copy();
   f.div(mass);
   acceleration.add(f);
  }
  
  boolean isInside(Liquid l) {
   if (location.x > l.x && location.x < l.x+l.w && 
       location.y > l.y && location.y < l.y+l.h) {
     return true;
   } else {
     return false; 
   }
  }
  
  void checkEdges() {
     if (location.x > width) {
       location.x = 0;
     } else if (location.x < 0) {
       location.x = width; 
     }
     
     if (location.y > height) {
       location.y = 0; 
     } else if (location.y < 0) {
       location.y = height;
     }
  }
}
