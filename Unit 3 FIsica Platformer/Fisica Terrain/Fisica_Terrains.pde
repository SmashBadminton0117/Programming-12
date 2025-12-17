import fisica.*;

//Lawrence Mo
//December 9th, 2025
//Fisica Terrains

color black    = #000000;
color red      = #FF0000;
color blue     = #49b2eb;
color green    = #5ccc52;
color brown    = #999054;
color darkBlue = #3a59d6;
color slime    = #43f06b;

//gridsize
int gridSize = 42;

//player position
int x = 0;
int y = 0;

//check velocity
int velocityX;

//make world
FWorld world;

//player
FBox player;

//import map
PImage map;

//game objects
PImage ice;

//tree & leaves
PImage treeTrunk;
PImage leaf;
PImage leafLeft;
PImage leafRight;
PImage Intersection;

//dirt section
PImage grass;
PImage dirt;
PImage grassTopLeft;
PImage grassTopRight;
PImage grassBottomLeft;
PImage grassBottomRight;
PImage grassBottom;
PImage grassLeft;
PImage grassRight;

//spike
PImage spike;

//slime
PImage Slime;

//variables (keys)
boolean wKey, aKey, sKey, dKey;
boolean leftKey, rightKey, upKey, downKey;
boolean spaceKey;

void setup() {
  size(1000, 800, P2D);

  frameRate(120);

  //createWorld
  createWorld();

  //loading all the images
  loadImages();

  //loading the fisica world
  loadWorld();

  //loads the player
  loadPlayer();
}

void createWorld() {
  Fisica.init(this);
  world = new FWorld(-10000, -10000, 10000, 10000);
  world.setGravity(0, 500);
}


void loadImages() {
  //load images
  ice          = loadImage("blueBlock.png");
  
  //load leafs
  treeTrunk        = loadImage("tree_trunk.png");
  leaf             = loadImage("treetop_center.png");
  leafLeft         = loadImage("treetop_w.png");
  leafRight        = loadImage("treetop_e.png");
  Intersection     = loadImage("tree_intersect.png");
  
  //load ground
  grass            = loadImage("dirt_n.png");
  dirt             = loadImage("dirt_center.png");
  grassTopLeft     = loadImage("dirt_nw.png");
  grassTopRight    = loadImage("dirt_ne.png");
  grassBottomLeft  = loadImage("dirt_sw.png");
  grassBottomRight = loadImage("dirt_se.png");
  grassBottom      = loadImage("dirt_s.png");
  grassLeft        = loadImage("dirt_w.png");
  grassRight       = loadImage("dirt_e.png");
  
  //load spike
  spike            = loadImage("spike.png");
  
  //load slime
  Slime            = loadImage("slime.png");
  
  

  //resize images
  ice.resize(gridSize, gridSize);
  
  //tree and leafs
  treeTrunk.resize(gridSize, gridSize);
  leaf.resize(gridSize, gridSize);
  leafLeft.resize(gridSize, gridSize);
  leafRight.resize(gridSize, gridSize);
  Intersection.resize(gridSize, gridSize);
  
  //grass and dirt
  grass.resize(gridSize, gridSize);
  dirt.resize(gridSize, gridSize);
  grassTopLeft.resize(gridSize, gridSize);
  grassTopRight.resize(gridSize, gridSize);
  grassBottomLeft.resize(gridSize, gridSize);
  grassBottomRight.resize(gridSize, gridSize);
  grassBottom.resize(gridSize, gridSize);
  grassLeft.resize(gridSize, gridSize);
  grassRight.resize(gridSize, gridSize);
  
  //spike
  spike.resize(gridSize, gridSize);
  
  //slime
  Slime.resize(gridSize, gridSize);
}



void loadWorld() {

  //load image
  map = loadImage("map.png");

  //load map by pixels
  for (int y = 0; y < map.height; y++) {
    for (int x = 0; x < map.width; x++) {
      color c = map.get(x, y); //color of current pixel
      color n = map.get(x, y - 1); //color of the pixel up
      color s = map.get(x, y + 1); //color of pixel below
      color w = map.get(x - 1, y); //color of pixel to the left
      color e = map.get(x + 1, y); //color of pixel to the right

      //setting all to an FBox
      FBox b = new FBox(gridSize, gridSize);

      //grass
      if (c == black && n != black && w == black && e == black) {
        b.setStatic(true);
        b.setFillColor(c);
        b.attachImage(grass);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
        
      } else if (c == black && s == black && w == black && n == black && e == black) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(dirt);
        
        world.add(b);
      } else if (c == black && n != black && w != black && s == black && e == black) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(grassTopLeft);
        
        world.add(b);
      } 
      else if (c == black && w != black && n == black && s == black) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(grassLeft);
        
        world.add(b);
        
      } else if (c == black && s != black && w == black && e == black) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(grassBottom);
        
        world.add(b);
      } else if (c == black && n == black && s != black && w != black && e == black) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(grassBottomLeft);
        
        world.add(b);
      } else if (c == black && n != black && s == black && w == black && e != black) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(grassTopRight);
        
        world.add(b);
      } else if (c == black && n == black && s == black && w == black && e != black) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(grassRight);
        
        world.add(b);
      } else if (c == black && n == black && s != black && w == black && e != black) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(grassBottomRight);
        
        world.add(b);
      }
      
      

      //ice blocks
      if (c == blue) {
        b.setStatic(true);
        b.setNoStroke();
        b.setFillColor(c);
        b.attachImage(ice);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      }

      //leafs
      if (c == green && s == brown) { //intersection
        b.setStatic(true);
        b.setNoStroke();
        b.setSensor(true);
        b.setFillColor(c);
        b.attachImage(Intersection);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
        
      } 
      
      else if (c == green && w == green && e == green) { //middle piece
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(leaf);
        b.setName("leaf");
        world.add(b);
        
      } 
      
      else if (c == green && w != green) { //left end
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(leafLeft);
        b.setName("leaf");
        world.add(b);
        
      } else if (c == green && e != green) { //right end
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(leafRight);
        b.setName("leaf");
        world.add(b);
      }

      //tree trunk
      if (c == brown) {
        b.setStatic(true);
        b.setNoStroke();
        b.setSensor(true);
        b.setFillColor(c);
        b.attachImage(treeTrunk);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      }

      //spikes
      if (c == darkBlue) {
        b.setStatic(true);
        b.setNoStroke();
        b.setFillColor(c);
        b.attachImage(spike);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      }

      //slime
      if (c == slime) {
        b.setStatic(true);
        b.setNoStroke();
        b.setFillColor(c);
        b.attachImage(Slime);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      }
    }
  }
}

void draw() {
  background(255);

  //drawing the world
  pushMatrix();
  translate(-player.getX() + width / 2, -player.getY() + height / 2);
  world.step();
  world.draw();

  popMatrix();


  //movements
  playerMovement();
}


void loadPlayer() {
  player = new FPlayer(x + 670, y, red);
  world.add(player);
}
