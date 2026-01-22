import fisica.*;

//Lawrence Mo
//January 13th, 2026
//Final Fisica Platformer Game

//Refernce: o_lobster


/*

 to-do list
 Quality Features
 1. Mode Framework -
 2. Sound Effects -
 3. Level Design *
 4. Code Quality *
 
 Complexity Features
 1. Fancy Terrain *
 2. Enemy Types -
 3. Multiple Levels *
 4. Quests / Storyline -
 5. New Game Mechanics *
 6. New Modes -
 
 Current to-do
 1. Game Structure - Points? Levels? How to get to the next stage?
 2.
 
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

//decoration
color vaseColour        = #3cc286;
color spikesColour      = #3c9ec2;
color spikeTrap         = #1f7594;
color grassPropColour   = #3f5c66;
color flowerColour      = #32677a;
color arrowColour       = #a0d5e8;
color woodenTrapColour  = #b837b8;
color torchColour       = #b83742;
color spikesTrapColour  = #969644;

//level making
color strangeDoorColour = #6b6416;
color stoneColour       = #f556f5;
color buttonColour      = #60614e;

//level changing
int currentLevel;

//gridsize
int gridSize = 32;

//player position: map 1
//int x = gridSize;
//int y = 530;

//player position: map 2
int x = gridSize;
int y = 470;

//check velocity
float velocityX;

//make world
FWorld world;

//player
FPlayer player;

//random prop objects
PImage vase;
PImage spikeTrapImage;
PImage grassProp;
PImage flower;
PImage arrow;

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
PImage [] spikesTrap;

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
PImage [] coinPickUp;

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

//Wooden hammer
PImage [] woodenTrap;

//torch
PImage [] torch;

//strange door
PImage [] strangeDoor;
PImage [] strangeDoorOpening;
PImage stone;

//levels
int levelMode;
final int firstLevel  = 0;
final int secondLevel = 1;
final int thirdLevel  = 2;


//opening the door
boolean isDoorOpened = false;

//button
PImage [] button;

//fonts
PFont bubbleFont;

//reset button positions
int resetButtonX = 20;
int resetButtonY = 20;
int resetButtonWidth = 100;
int resetButtonHeight = 40;
color hovered = #636464;
color neutral = #434546;

//mode framework
int modeFramework;

final int intro   = 0;
final int reset   = 1;
final int winning = 2;
final int losing  = 3;
final int game    = 4;


void setup() {
  size(1000, 630, P2D);

  //frame rates
  frameRate(120);

  //levels
  levelMode = firstLevel;

  //mode framework
  modeFramework = intro;

  //fonts
  bubbleFont = createFont("Bubbles-Regular.ttf", 52);
  textFont(bubbleFont);
  textSize(52);
  textAlign(CENTER, CENTER);

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
  
  
  //mode
  if (modeFramework == intro) {
    introScreen();
  } 
  
  //winning
  else if (modeFramework == winning) {
    winningScreen();
  } 
  
  //losing
  else if (modeFramework == losing) {
    losingScreen();
  } 
  
  //game
  else if (modeFramework == game) {
    game();
  }
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
  if (levelMode  == firstLevel) {
    player = new FPlayer(x, y, red);
    world.add(player);
  } else if (levelMode == secondLevel) {
    player = new FPlayer(x, y, red);
    world.add(player);
  } else if (levelMode == thirdLevel) {
    player = new FPlayer(x + 250, y - 400, red);
    world.add(player);
  }
}

//next level
void loadLevel() {
  //clear world
  world.clear();

  //clear arraylist
  terrain.clear();
  enemies.clear();

  //loadworld again
  loadWorld();

  //respawn
  loadPlayer();
}


//reset
void drawResetButton() {
  //check hover
  if (mouseX > resetButtonX && mouseX < resetButtonX + resetButtonWidth && mouseY > resetButtonY && mouseY < resetButtonY + resetButtonHeight) {
    fill(hovered);
  } else {
    fill(neutral);
  }

  //button
  rect(resetButtonX, resetButtonY, resetButtonWidth, resetButtonHeight, 5);

  //text
  fill(255);
  textSize(32);
  text("RESET", resetButtonX + resetButtonWidth/2, resetButtonY + resetButtonHeight/2);
}
