import fisica.*;

//palette
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);

//assets
PImage redBird;

FPoly topPlatform;

//bucket
FPoly bucketBottom;
FPoly bucketLeft;
FPoly bucketRight;

//variables
int x, y;
int x2, y2;
int untilScreenEdge;

//image
PImage ImageBox;

//buttons
boolean CheckGravityOn;
boolean ChecksForObjects;

//gravity button
int GravityButtonX, GravityButtonY, GravityButtonW, GravityButtonH;

//objects button
int ObjectsButtonX, ObjectsButtonY, ObjectsButtonW, ObjectsButtonH;


//fisica
FWorld world;


void setup() {
  //make window
  size(800, 600);

  //load resources
  redBird = loadImage("red-bird.png");

  //initialise world
  makeWorld();

  //add terrain to world
  makeTopPlatform();
  makeBucket(300, 500);

  //initializing
  x = width / 2;
  y = 200;

  x2 = 30;
  y2 = 70;

  //loops the cloud around
  untilScreenEdge = width + 100;
  
  //attaching image to rect
  ImageBox = loadImage("cat.jpg");
  ImageBox.resize(70, 120);
  
  //buttons
  GravityButtonX = 20;
  GravityButtonY = height - 100;
  GravityButtonW = 120;
  GravityButtonH = 40;
  
  ObjectsButtonX = GravityButtonX;
  ObjectsButtonY = GravityButtonY + 50;
  ObjectsButtonW = 120;
  ObjectsButtonH = 40;
  
  //checks if boolean is true
  CheckGravityOn = true;
  ChecksForObjects = true;

}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}

//===========================================================================================

void makeTopPlatform() {
  topPlatform = new FPoly();

  //plot the vertices of this platform
  topPlatform.vertex(-100, 60);
  topPlatform.vertex(640, 240);
  topPlatform.vertex(640, 340);
  topPlatform.vertex(-100, 160);

  // define properties
  topPlatform.setStatic(true);
  topPlatform.setFillColor(brown);
  topPlatform.setFriction(0.1);

  //put it in the world
  world.add(topPlatform);
}

//===========================================================================================

void makeBucket(float x, float y) {
  FCompound bucket = new FCompound();

  //bottom bucket
  bucketBottom = new FPoly();
  bucketBottom.vertex(-20, 0);
  bucketBottom.vertex(220, 0);
  bucketBottom.vertex(220, 20);
  bucketBottom.vertex(-20, 20);
  bucket.addBody(bucketBottom);

  //left bucket
  bucketLeft = new FPoly();
  bucketLeft.vertex(-20, 0);
  bucketLeft.vertex(0, 0);
  bucketLeft.vertex(0, -200);
  bucketLeft.vertex(-20, -200);
  bucket.addBody(bucketLeft);

  //right bucket
  bucketRight = new FPoly();
  bucketRight.vertex(200, 0);
  bucketRight.vertex(220, 0);
  bucketRight.vertex(220, -200);
  bucketRight.vertex(200, -200);
  bucket.addBody(bucketRight);

  //define properties
  bucket.setPosition(x, y);
  bucket.setStatic(true);

  world.add(bucket);
}


//===========================================================================================


void drawCloud() {
  //loop to move the cloud
  fill(255);
  strokeWeight(1);
  ellipse(x, y, 200, 70);

  x += 2;

  //loops back to the screen
  if (x > untilScreenEdge) {
    x = -100;
  }
}

//===========================================================================================


void drawSecondCloud() {
  //cloud 2
  fill(255);
  stroke(1);
  ellipse(x2, y2, 120, 70);

  x2 += 3;

  if (x2 > untilScreenEdge) {
    x2 = -100;
  }
}


//===========================================================================================

void drawButtons() {
  //placing the buttons
  fill(#A5D4ED);
  stroke(0);
  strokeWeight(2);
  
  pushMatrix();
  translate(GravityButtonX, GravityButtonY);
  rect(0, 0, GravityButtonW, GravityButtonH);
  rect(0, 50, ObjectsButtonW, ObjectsButtonH);
  
  popMatrix();

  //filling the texts
  fill(0);
  text("Gravity:  " + (CheckGravityOn), GravityButtonX + 10, GravityButtonY + 25);
  text("Objects:  " + (ChecksForObjects), ObjectsButtonX + 10, ObjectsButtonY + 25);
}

//===========================================================================================

void draw() {
  println("x: " + mouseX + " y: " + mouseY);
  background(blue);

  //first cloud
  drawCloud();

  if (ChecksForObjects && frameCount % 50 == 0) {  //Every 20 frames ...
    makeCircle();
    makeBlob();
    makeBox();
    makeBird();
  }

  if (CheckGravityOn) {
    world.setGravity(0, 900);
  } else {
    world.setGravity(0, 0);
  }

  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw

  //second cloud
  drawSecondCloud();
  
  //buttons
  drawButtons();
}


//===========================================================================================

void makeCircle() {
  FCircle circle = new FCircle(50);
  circle.setPosition(random(100, width-100), -5);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);

  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(1);

  //add to world
  world.add(circle);
}

//===========================================================================================

void makeBlob() {
  FBlob blob = new FBlob();

  //set visuals
  blob.setAsCircle(random(100, width-100), -5, 50);
  blob.setStroke(0);
  blob.setStrokeWeight(2);
  blob.setFillColor(yellow);

  //set physical properties
  blob.setDensity(0.2);
  blob.setFriction(1);
  blob.setRestitution(0.25);

  //add to the world
  world.add(blob);
}

//===========================================================================================

void makeBox() {
  FBox box = new FBox(75, 120);
  box.setPosition(random(100, width-100), -5);

  //set visuals
  box.setStroke(0);
  box.setStrokeWeight(2);
  box.setFillColor(green);

  box.attachImage(ImageBox);

  //set physical properties
  box.setDensity(0.2);
  box.setFriction(1);
  box.setRestitution(1);
  world.add(box);
}

//===========================================================================================

void makeBird() {
  FCircle bird = new FCircle(48);
  bird.setPosition(random(100, width-100), -5);

  //set visuals
  bird.attachImage(redBird);

  //set physical properties
  bird.setDensity(0.8);
  bird.setFriction(1);
  bird.setRestitution(0.5);
  world.add(bird);
}

//===========================================================================================

void mousePressed() {
  if (mouseX > GravityButtonX && mouseX < GravityButtonX + GravityButtonW && mouseY > GravityButtonY && mouseY < GravityButtonY + GravityButtonH)
    CheckGravityOn = !CheckGravityOn;

  if (mouseX > ObjectsButtonX && mouseX < ObjectsButtonX + ObjectsButtonW && mouseY > ObjectsButtonY && mouseY < ObjectsButtonY + ObjectsButtonH)
    ChecksForObjects = !ChecksForObjects;
}
