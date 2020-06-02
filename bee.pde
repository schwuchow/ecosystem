class Bee extends MovingBeing {
  
  Bee() {
    super();
  }
  
  void update() {
     velocity.add(acceleration);
     velocity.limit(topspeed);
     location.add(velocity);
     acceleration.mult(0);
  }
  
  void display() {
   stroke(0);
   fill(255, 100, 0);
   ellipse(location.x, location.y, 8, 8);
  }
}
