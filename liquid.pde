class Liquid {
   float x, y, w, h;
   float C_drag;
   
   Liquid(float _x, float _y, float _w, float _h, float _C_drag) {
      x = _x;
      y = _y;
      w = _w;
      h = _h;
      C_drag = _C_drag;
   }
   
   void display() {
      fill(213, 229, 245);
      rect(x, y, w, h); 
   }
}
