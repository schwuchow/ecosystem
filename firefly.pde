class Firefly extends MovingBeing {
  
  //float tx, ty;
  
  Firefly(PVector _location, PVector _velocity, PVector _acceleration, float _mass, float _topspeed) {
    super(_location, _velocity, _acceleration, _mass, _topspeed);
  // tx = 0;
  // ty = 10000;
  }
  
  void update() {
   acceleration = PVector.random2D();
   acceleration.mult(0.5);
   acceleration.mult(random(2));
   
   /*float accX = map(noise(tx), 0, 1, 0, width);
   float accY = map(noise(ty), 0, 1, 0, height);
   tx += 0.5;
   ty += 0.5;
   
   acceleration = new PVector(accX, accY);*/
   
   velocity.add(acceleration);
   velocity.limit(topspeed);
   location.add(velocity);
   acceleration.mult(0);
  }
  
  void display() {
   stroke(255, 204, 0);
   fill(255, 100, 0);
   ellipse(location.x, location.y, 8, 8);
  }
}
