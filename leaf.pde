class Leaf extends MovingBeing {
   
   Leaf(PVector _location, PVector _velocity, PVector _acceleration, float _mass, float _topspeed) {
    super(_location, _velocity, _acceleration, _mass, _topspeed);
   }
   
  void update() {     
     velocity.add(acceleration);
     velocity.limit(topspeed);
     location.add(velocity);
     acceleration.mult(0);
  }
  
  void display() {
   stroke(35, 209, 122);
   fill(48, 140, 81);
   ellipse(location.x, location.y, 45, 20); 
   
  }
}
