class Flower {
  
   int x;
   int y;
   
   // polar coordinates
   float r;
   float theta;
   float xFromPolar;
   float yFromPolar;
  
   Flower() {
     x = 200;
     y = 300;
     r = 20;
     theta = 2*PI;
     xFromPolar = 0;
     yFromPolar = 0;
     
   }
  
   void update() {
     // convert from polar coordinates to cartesian coordinates since Processing can only read cartesian coordinates
     // to rotate in circular movement
     xFromPolar = r * cos(theta);
     yFromPolar = r * sin(theta);
     
     theta += 0.05;
   }
  
  
   void display() {
     
     // stem
     fill(48, 140, 81);
     stroke(35, 209, 122);
     rect(x-2.5, y+20, 5, 50);
     
     // middle
     stroke(181, 170, 22);
     fill(235, 222, 52);
     ellipse(x, y, 20, 20);

     // leaf
     fill(48, 140, 81);
     stroke(48, 140, 81);
     ellipse(x-2.5-15, y+30, 30, 10);
     
     // petal 1
     stroke(68, 11, 77);
     fill(145, 24, 163);
     ellipse(x+xFromPolar, y+yFromPolar, 10, 10);
     
     // petal 2
     stroke(242, 203, 247);
     fill(235, 158, 247);
     ellipse(x-xFromPolar, y-yFromPolar, 10, 10);
   }
  
}
