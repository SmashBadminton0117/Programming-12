import fisica.*;

//Lawrence Mo
//January 13th, 2026
//Final Fisica Platformer Game

//Refernce: o_lobster


/*

 to-do list
 Quality Features
 1. Mode Framework
 2. Sound Effects
 3. Level Design
 4. Code Quality
 
 Complexity Features
 1. Fancy Terrain
 2. Enemy Types
 3. Multiple Levels
 4. Quests / Storyline
 5. New Game Mechanics
 6. New Modes
 
 */

//color palette
color grassColour    = #000000;
color red            = #FF0000;
color iceColour      = #49b2eb;
color treeColour     = #5ccc52;
color trunkColour    = #999054;
color spikeColour    = #3a59d6;
color slimeColour    = #43f06b;
color bridgeColour   = #4bf4fa;
color goombaColour   = #e0e647;
color WallColour     = #858582;
color lavaColor      = #ff0022;
color thwomp         = #b021b0;
color hammerBro      = #4263eb;


//color palette #2: Platformer Game
color obsidian   = #52c8ff;
color corner     = #ababab;
color doorColour = #6eb3f0;
color coinColour = #fff154;


//gridsize
int gridSize = 32;

//player position
int x = gridSize;
int y = 530;

//check velocity
float velocityX;

//make world
FWorld world;

//player
FPlayer player;

//import map
PImage map;
PImage backgroundImageTrees;
PImage backgroundImageShadows;
PImage backgroundImageBlur;
PImage backgroundImageFront;

//map limitations
int coordinatesX = 0;
int coordinatesY = 1215;
int mapW = 0;
int mapH = 2000;

float terrainWorldY;

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

//corners
PImage cornerRight;
PImage cornerLeft;
PImage cornerBottomRight;
PImage cornerBottomLeft;

//spike
PImage spike;

//slime
PImage Slime;


//bridge
PImage bridge;
PImage bridgeLeft;
PImage bridgeRight;

//door
PImage levelDoor;

//coins
PImage [] coin;

//variables (keys)
boolean wKey, aKey, sKey, dKey;
boolean leftKey, rightKey, upKey, downKey;
boolean spaceKey;

//terrains + enemies
ArrayList<FGameObject> terrain;
ArrayList<FGameObject> enemies;

//character animations
PImage [] idle;

//character jump
PImage [] jumpingDown;
PImage [] jumpingUp;
PImage [] doubleJump;

PImage [] run;
PImage [] action;

//enemies
PImage[] goomba;
PImage[] Thwomp;
PImage[] HammerBro;

//weapon
PImage Hammer;

//lava
PImage[] lava;

void setup() {
  size(1000, 630, P2D);

  //frame rates
  frameRate(120);

  //arraylist
  terrain = new ArrayList<FGameObject>();
  enemies = new ArrayList<FGameObject>();

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



void draw() {
  background(255);

  //drawing the world
  drawWorld();

  //displaying the act functions for all class
  actWorld();
}

void drawWorld() {
  //drawing the world
  pushMatrix();

  //constrain/map
  worldCentered();

  world.step();
  world.draw();

  popMatrix();
}

void worldCentered() {
  //variables
  float terrainWorldX = player.getX() - width / 2;
  
  //initializing
  terrainWorldY = -gridSize;
  
  //show only until the constrained part
  terrainWorldX = constrain( player.getX() - width / 2, coordinatesX, coordinatesY - width );
  terrainWorldY = constrain( -gridSize, mapW - height, mapH - height );
  
  //translating to the positions
  translate( -terrainWorldX, terrainWorldY );
  
  
  //background images
  image(backgroundImageBlur, 0, 30);
  image(backgroundImageTrees, 0, 30);
  image(backgroundImageShadows, 0, 30);
  image(backgroundImageFront, 0, 130);
}

void actWorld() {
  //player movements
  player.act();

  //terrain behaviours
  for (int i = 0; i < terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.act();
  }

  //enemies behaviours
  for (int i = 0; i < enemies.size(); i++) {
    FGameObject e = enemies.get(i);
    e.act();
  }
}

void loadPlayer() {
  player = new FPlayer(x, y, red);
  world.add(player);
}
