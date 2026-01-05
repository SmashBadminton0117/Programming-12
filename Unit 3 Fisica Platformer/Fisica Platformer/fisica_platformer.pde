import fisica.*;

// Lawrence Mo
// November 27th, 2025
// Fisica: Platformer Game

//loading map
PImage map;

//variables
int x = 0;
int y = 0;
int gridSize = 24;

//players
int velocityX;
int velocityX2;

//color
color white  = color(255, 255, 255);
color black  = color(0, 0, 0);
color green  = color(0, 255, 0);
color brown  = color(153, 102, 51);
color red    = color(255, 0, 0);
color blue   = color(0, 0, 255);
color orange = color(255, 206, 70);

//variables (keys)
boolean wKey, aKey, sKey, dKey;
boolean leftKey, rightKey, upKey, downKey;
boolean spaceKey;

ArrayList<FBox> boxes = new ArrayList<FBox>();

//make the world
FWorld world;

//player
FBox player;
FBox player2;

//bomb
FBomb bomb = null;

void setup() {
  size(800, 800);

  //initializing the world
  createWorld();

  //loop to load image
  loadWorld();

  //player
  loadPlayer();
}


void createWorld() {
  Fisica.init(this);
  world = new FWorld(-100000, -100000, 100000, 100000);
}


void loadWorld() {
  //load the image
  map = loadImage("map.png");

  //world
  while ( y < map.height ) {
    color c = map.get(x, y);

    //checking for each FBox
    if ( c == black ) {
      FBox b = new FBox(gridSize, gridSize);

      //variables
      b.setFillColor(black);
      b.setNoStroke();
      b.setPosition(x * gridSize, y * gridSize);
      b.setStatic(true);

      //add
      world.add(b);
      boxes.add(b);
    } else if ( c == green ) {
      FBox g = new FBox(gridSize, gridSize);

      //variables
      g.setFillColor(green);
      g.setNoStroke();
      g.setPosition(x * gridSize, y * gridSize);
      g.setStatic(true);

      //add
      world.add(g);
      boxes.add(g);
    } else if ( c == brown ) {
      FBox br = new FBox(gridSize, gridSize);

      //variables
      br.setFillColor(brown);
      br.setNoStroke();
      br.setPosition(x * gridSize, y * gridSize);
      br.setStatic(true);

      //add
      world.add(br);
      boxes.add(br);
    }


    //each pixel
    x++;

    //next row
    if ( x == map.width ) {
      x = 0;
      y++;
    }
  }
}


void draw() {
  //set background
  background(white);

  pushMatrix();
  translate(-player.getX() + width / 2, - player.getY() + height / 2);
  world.step();
  world.draw();
  
  popMatrix();
  
  //draws player movements
  playerMovement();
}


void loadPlayer() {
  player = new FPlayer(x + 20, y, red);
  boxes.add(player);
  world.add(player);
  
  player2 = new FPlayer(x + 40, y, blue);
  boxes.add(player2);
  world.add(player2);
}
