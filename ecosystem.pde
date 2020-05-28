// living beings
Firefly[] fireflies = new Firefly[20];
Bee[] bees = new Bee[5];
Bird bird;
WaterLily waterlily;
Leaf leaf;
Flower flower;

Liquid liquid;
Beehive beehive;

// made up TODO see 2.5
// gravity should be according to mass, so that smaller objects don't fall faster see 2.6
// which other forces should I implement?
PVector wind = new PVector(0.001, -0.001);
PVector gravity = new PVector(0, 0.1);

void setup() {
   fullScreen();
   background(213, 229, 245);
   
   liquid = new Liquid(0, height/2, width, height, 1);

  // fireflies
  for (int i = 0; i < fireflies.length; i++) {
    fireflies[i] = new Firefly();
    fireflies[i]
    .atLocation(new PVector(random(width), random(height)))
    .withVelocity(new PVector(0, 0))
    .withAcceleration(new PVector(0, 0))
    .withMass(1)
    .withTopSpeed(4);
  }
  
  for (int i = 0; i < bees.length; i++) {
     bees[i] = new Bee();
     bees[i]
       .atLocation(new PVector(random(width), random(height)))
       .withAcceleration(new PVector(1,1))
       .withTopSpeed(7);
  }
  
  beehive = new Beehive();
  flower = new Flower();
  
  waterlily = new WaterLily();
  waterlily
    .atLocation(new PVector(random(width), random(height)))
    .withVelocity(new PVector(random(width), random(height)))
    .withTopSpeed(1);
    
    
  leaf = new Leaf();
  leaf
    .atLocation(new PVector(random(width), random(height)))
    .withVelocity(new PVector(0, random(height)))
    .withTopSpeed(0.5);
  
  /*bird = new Bird();*/
}

void draw() {
   background(213, 229, 245);
   
   //liquid.display();
   //beehive.display();
     
   for (int i = 0; i < fireflies.length; i++) {
      fireflies[i].update();
      fireflies[i].checkEdges();
      fireflies[i].display();
   }
   
   for (int i = 0; i < bees.length; i++) {
      PVector force = beehive.attract(bees[i]);
      bees[i].applyForce(force);
      bees[i].update();
      bees[i].display();
   }
   
   /*bird.update();
   bird.checkEdges();
   bird.display();*/
   
   waterlily.applyForce(wind);
   waterlily.update();
   waterlily.checkEdges();
   waterlily.display();
   
   /*if (leaf.isInside(liquid)) {
     leaf.drag(liquid);
   }*/
   
   /*leaf.applyForce(wind);
   leaf.applyForce(gravity);
   leaf.update();
   leaf.checkEdges();
   leaf.display();*/
   
   /*flower.update();
   flower.display();*/
}

/*
Ideas
flowers with circulating petals
leaves that fall down and disappear after entering water
fishes
an island with a rabbit
bees that are flying around their stock
bees that fly to flowers
flowers that bend because of wind
butterfly that flaps wings
dragon-fly that wants to catch a fly
waves
*/
