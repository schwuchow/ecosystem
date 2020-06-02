class Wave {
  float startAngle = 0;
  float aVelocity = 0.3;
  
  void display() {
    
    startAngle += 0.02;
    float angle = startAngle;
    
    for (int x = 0; x <= width; x += 10) { //<>//
      float y = map(sin(angle), -1, 1, 0, 10);
      ellipse(x, y+height/3, 5, 5);
      angle += aVelocity;
    }
  }
}
