class Butterfly extends MovingBeing {

  PShape butterfly;
 
  Butterfly() {
    super();

    butterfly = createShape(GROUP);
    PShape body = createShape(ELLIPSE, 0, 0, 5, 50);
    body.setFill(color(110, 92, 83));
    PShape lowerLeftWing = createShape(ELLIPSE, 0, 0, 40, 25);
    lowerLeftWing.setFill(color(235, 158, 247));
    lowerLeftWing.translate(-20, 15);
    lowerLeftWing.rotate(radians(135));
    PShape lowerRightWing = createShape(ELLIPSE, 0, 0, 40, 25);
    lowerRightWing.setFill(color(235, 158, 247));
    lowerRightWing.translate(20, 15);
    lowerRightWing.rotate(radians(45));
    PShape upperLeftWing = createShape(ELLIPSE, 0, 0, 50, 35);
    upperLeftWing.setFill(color(145, 24, 163));
    upperLeftWing.translate(-25, -20);
    upperLeftWing.rotate(radians(45));
    PShape upperRightWing = createShape(ELLIPSE, 0, 0, 50, 35);
    upperRightWing.setFill(color(145, 24, 163));
    upperRightWing.translate(25, -20);
    upperRightWing.rotate(radians(135));
    PShape leftFeeler = createShape(LINE, -2, -25, -10, -40);
    PShape rightFeeler = createShape(LINE, 2, -25, 10, -40);

    butterfly.addChild(body);
    butterfly.addChild(lowerLeftWing);
    butterfly.addChild(lowerRightWing);
    butterfly.addChild(upperLeftWing);
    butterfly.addChild(upperRightWing);
    butterfly.addChild(leftFeeler);
    butterfly.addChild(rightFeeler);
  }
  
  void update() {
     acceleration = PVector.random2D();
     acceleration.mult(0.5);
     acceleration.mult(random(2));

     velocity.add(acceleration);
     velocity.limit(topspeed);
     location.add(velocity);
     acceleration.mult(0);
  }
  
  void display() {
    translate(location.x, location.y);
    shape(butterfly);
  }
}
