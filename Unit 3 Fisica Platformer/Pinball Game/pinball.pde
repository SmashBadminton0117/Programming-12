// Lawrence Mo
// November 18th, 2025
// Pinball Game

import fisica.*;

//world
FWorld world;

//color palette
color lightBlue = #A5D4ED;
color lightRed  = #FA4C6C;

//platforms
FPoly boardLayerTopLeft;
FPoly boardLayerTopRight;
FPoly boardLayerBottomLeft;
FPoly boardLayerBottomRight;

//inner game layer
FPoly gameLayer;

//ball
FCircle ball;

PFont pinball;

//ball launcher
boolean launched = false;

//launching variables
float launchForce = 1200;
float laneWidth = 80;

//ball variables
float ballX;
float ballY;

//lane positions
float topPosition;
float laneHeight;
float bottom;

//wall position
float wallX;
float wallWidth;
float heightBottom;

//scoring
int PlayerScore1;
int PlayerScore2;

//turn
int ballsP1;
int ballsP2;

//check who's turn
int currentPlayer;

// game state
boolean gameOver = false;



void setup() {
  size(800, 900);
  
  pinball = createFont("PKMN-Pinball.ttf", 70);
  
  //scoring system
  PlayerScore1 = 0;
  PlayerScore2 = 0;

  ballsP1 = 3;
  ballsP2 = 3;

  //check who's turn
  currentPlayer = 1;

  //initializing variables: lane
  ballX = width - laneWidth / 2;
  ballY = height - 80;

  //wall
  topPosition = 220;
  laneHeight = 130;
  bottom = topPosition + laneHeight;

  //wall position
  wallX = width - laneWidth;
  wallWidth = 10;
  heightBottom = height - bottom;

  //makes the world
  makeWorld();

  //making the platform
  platformLayer();

  gameLayerDots();

  //creates the lane
  createLane();

  player1();

  //draw borders
  drawBorders();
  drawDividers();
}


void draw() {
  //background
  background(255);

  //titile
  title();

  //world
  world.step();
  world.draw();

  //collision when ball lands
  checkLanding();

  fill(0);
  textSize(24);
  textAlign(LEFT, TOP);
  text("P1 Score: " + PlayerScore1, 20, 20);
  text("P2 Score: " + PlayerScore2, 20, 50);
  text("Current Player: " + currentPlayer, 20, 80);

}

void makeWorld() {
  //world
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}
