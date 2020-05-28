class Beehive {
   PVector location;
   float G;
   float mass;
   
   Beehive() {
      location = new PVector(width/2, height/4);
      mass = 1;
      G = 100;
   }
   
   void display() {
      stroke(0);
      fill(143, 110, 21);
      ellipse(location.x, location.y, 40, 50); 
   }
   
   // gravitional attraction force
   // formula:
   // F_g = (G * m_1 * m_2) / r^2 * ^r
   // with
   // G = universal gravitational constant 6.674*10^-11 (change for strength of attraction)
   // m_1 & m_2 = mass of attractor and attracted
   // r = distance / magnitude of force
   // ^r = unit vector from m_1 to m_2
   PVector attract(Bee b) {
      PVector force = PVector.sub(location, b.location);
      float distance = force.mag();
      distance = constrain(distance, 5, 25);
      
      force.normalize();
      float strength = (G * mass * b.mass) / (distance * distance);
      force.mult(strength);
      
      return force;
   }
}
