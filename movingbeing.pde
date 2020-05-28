abstract class MovingBeing {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float topspeed;
  
  MovingBeing(PVector _location, PVector _velocity, PVector _acceleration, float _mass, float _topspeed) {
    location = _location;
    velocity = _velocity;
    acceleration = _acceleration;
    mass = _mass;
    topspeed = _topspeed;
  }
  
  abstract void update();
  abstract void display();
  
  // Newtons 2nd Law
  // F = M * A
  // A = F/M
  void applyForce(PVector force) {
   PVector f = force.get();
   f.div(mass);
   acceleration.add(f);
  }
  
  // Drag force / fluid resistance as a form of friction
  // formula:
  // F_drag = -1/2 * p * v^2 * A * C_d * ^v
  // with 
  // p = 1 (density of liquid)
  // v = speed/magnitude of velocity
  // A = 1 (frontal area that is pushing through liquid)
  // C_d = drag constant which determines strength
  // ^v = normalized speed
  // ==> simplified formula:
  // F_drag = -1/2 * v^2 * C_d * ^v
  void drag(Liquid l) {
    float speed = velocity.mag();
    float dragMagnitude = l.C_drag * speed * speed;
    PVector drag = velocity.get();
    drag.mult(-0.5);
    drag.normalize();
    drag.mult(dragMagnitude);
    
    applyForce(drag);
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
