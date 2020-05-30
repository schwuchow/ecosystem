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
   
   boolean contains(MovingBeing m) {
     if (m.location.x > x && m.location.x < x+w &&
         m.location.y > y && m.location.y < y+h) {
       return true;
     } else {
       return false;
     }
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
  PVector drag(MovingBeing m) {
    float speed = m.velocity.mag();
    float dragMagnitude = C_drag * speed * speed;
    PVector dragForce = m.velocity.copy();
    dragForce.mult(-0.5);
    dragForce.normalize();
    dragForce.mult(dragMagnitude);

    return dragForce;
  }

   void display() {
      //fill(213, 229, 245);
      //rect(x, y, w, h);
   }
}
