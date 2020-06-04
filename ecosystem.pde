// living beings
Firefly[] fireflies = new Firefly[20];
Bee[] bees = new Bee[5];
Bird bird;
WaterLily waterlily;
Leaf[] leaves = new Leaf[5];
Flower flower;
Wave wave;
Butterfly butterfly;

Liquid liquid;
int[] inLiquidTime = new int[leaves.length];
Beehive beehive;
Tree tree;

// made up TODO see 2.5
// gravity should be according to mass, so that smaller objects don't fall faster see 2.6
// which other forces should I implement?
PVector wind = new PVector(0.001, -0.001);
PVector gravity = new PVector(0, 0.1);

void setup() {
   fullScreen();
   background(213, 229, 245);
   
   liquid = new Liquid(0, height/3, width, height/2, 0.3);

   for (int i = 0; i < inLiquidTime.length; i++) {
     inLiquidTime[i] = 0;
   }

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
    
  for (int i = 0; i < leaves.length; i++) {
    leaves[i] = new Leaf();
    leaves[i]
      .atLocation(new PVector(random(width), random(height/3)))
      .withVelocity(new PVector(0, random(height)))
      .withTopSpeed(2);
  }
  
  bird = new Bird();
  wave = new Wave();
  butterfly = new Butterfly();
  butterfly
       .atLocation(new PVector(random(width), random(height)))
       .withTopSpeed(7);

  tree = new Tree();
}

void draw() {
   background(213, 229, 245);
   
   liquid.display();
   beehive.display();
     
   /*for (int i = 0; i < fireflies.length; i++) {
      fireflies[i].update();
      fireflies[i].checkEdges();
      fireflies[i].display();
   }*/
   
   for (int i = 0; i < bees.length; i++) {
      PVector force = beehive.attract(bees[i]);
      bees[i].applyForce(force);
      bees[i].update();
      bees[i].display();
   }
   
   bird.update();
   bird.checkEdges();
   bird.display();
   
   waterlily.applyForce(wind);
   waterlily.update();
   waterlily.checkEdges();
   waterlily.display();
   
   for (int i = 0; i < leaves.length; i++) {
     boolean disappearInLiquid = false;
    
     if (liquid.contains(leaves[i])) {
       PVector dragForce = liquid.drag(leaves[i]);
       leaves[i].applyForce(dragForce);
       inLiquidTime[i]++;
     
       if (inLiquidTime[i] > 50) {
         disappearInLiquid = true;
       }
     }
   
     if (!disappearInLiquid) {
       leaves[i].applyForce(wind);
       PVector leafGravity = new PVector(0, 0.1 * leaves[i].mass);
       leaves[i].applyForce(leafGravity);
       leaves[i].update();
       leaves[i].checkEdges();

       if (liquid.contains(leaves[i])) {
        leaves[i].displayUnderWater();
       } else {
        leaves[i].display();
       }
     }
   }
   
   flower.update();
   flower.display();
   
   //wave.display();
   /*butterfly.update();
   butterfly.display();
   butterfly.checkEdges();*/

   tree.display();
}

/*
Ideas
flowers with circulating petals
fishes that move in oscillating fashion
repulsion force
make sth draggable
an island with a rabbit as a curve
bees that fly to flowers
flowers that bend because of wind
butterfly that flaps wings
dragon-fly that wants to catch a fly
torque & moment of inertia for angle acceleration
waves
beginShape/EndShape + vertex fn to draw more complex forms
use mouse if else to toggle sth
mousePressed
mouseButton to navigate
keypressed & key
mouseDragged
noloop & loop
*/
