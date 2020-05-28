class Bee extends MovingBeing {
  
  Bee(PVector _location, PVector _velocity, PVector _acceleration, float _mass, float _topspeed) {
    super(_location, _velocity, _acceleration, _mass, _topspeed);
  }
  
  void update() {
   /*acceleration = PVector.random2D();
   acceleration.mult(0.1);
   acceleration.mult(random(2));*/
   
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
