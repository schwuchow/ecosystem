class Bird {
   
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  Bird() {
   location = new PVector(random(width), random(height)); 
   velocity = new PVector(0,0);
   topspeed = 10;
  }
  
  void update() {
   PVector mouse = new PVector(mouseX, mouseY);
   PVector dir = PVector.sub(mouse, location);
   dir.normalize();
   dir.mult(.5);
   acceleration = dir;
   
   velocity.add(acceleration);
   velocity.limit(topspeed);
   location.add(velocity);
  }
  
  void display() {
   // angle = atan2(velocity.y / velocity.x)
   float angle = velocity.heading();
   
   stroke(0);
   fill(193, 66, 66);
   rectMode(CENTER);
   pushMatrix();
   translate(location.x, location.y);
   rotate(angle);
   ellipse(0, 0, 35, 16);
   popMatrix();
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
