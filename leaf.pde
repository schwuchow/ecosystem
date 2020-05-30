class Leaf extends MovingBeing {
   
   Leaf() {
    super();
   }
   
  void update() {     
     velocity.add(acceleration);
     velocity.limit(topspeed);
     location.add(velocity);
     acceleration.mult(0);
  }
  
  void displayUnderWater() {
    stroke(35, 209, 122);
    fill(0, 153, 153);
    ellipse(location.x, location.y, 45, 20);
  }

  void display() {
   stroke(35, 209, 122);
   fill(48, 140, 81);
   ellipse(location.x, location.y, 45, 20); 
  }
}
