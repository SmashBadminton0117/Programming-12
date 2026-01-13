import fisica.*;

//Lawrence Mo
//December 9th, 2025
//Fisica Terrains



//color palette
color black     = #000000;
color red       = #FF0000;
color blue      = #49b2eb;
color green     = #5ccc52;
color brown     = #999054;
color darkBlue  = #3a59d6;
color slime     = #43f06b;
color cyan      = #4bf4fa;
color yellow    = #e0e647;
color grey      = #858582;
color lavaColor = #ff0022;
color thwomp    = #b021b0;
color hammerBro = #4263eb;

//gridsize
int gridSize = 46;

//player position
int x = (gridSize * 11);
int y = 0;

//check velocity
float velocityX;

//make world
FWorld world;

//player
FPlayer player;

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


//bridge
PImage bridge;
PImage bridgeLeft;
PImage bridgeRight;

//variables (keys)
boolean wKey, aKey, sKey, dKey;
boolean leftKey, rightKey, upKey, downKey;
boolean spaceKey;

//terrains + enemies
ArrayList<FGameObject> terrain;
ArrayList<FGameObject> enemies;

//character animations
PImage [] idle;
PImage [] jump;
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
  size(1000, 800, P2D);

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
  translate(-player.getX() + width / 2, -player.getY() + height / 2);
  world.step();
  world.draw();

  popMatrix();
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
