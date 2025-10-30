import java.util.ArrayList;

// Lawrence Mo
// October 6th, 2025
// Asteroids

//credits:
//Motion Blur, "Thomas Fang's Idea on Motion Blur", github.com/Thomas-16
//October 13th, 2025

//TO-DO List:
//1. OffSet the asteroids with the spaceShip
//2. Mode Framework
//3. Music
//4. Splitting the asteroids into smaller (lives) asteroids, if being hit ^
//5. UFO, aliens that comes within frames ^
//6. Explosion effects if gameObjects, if collision happens ^
//7. moving effects if the spaceShip is moving ^
//8. splitting the codes into sub-functions
//9.

//Colour Palette
color black  = #000000;
color white  = #FFFFFF;
color red    = #E55F5F;
color orange = #F7BE61;
color green  = #46BC44;

//fonts family
PFont Minecraft;
int sizeFont;

//Controls of the keys
boolean wKey, aKey, sKey, dKey, spaceKey, tKey;

//how much asteroids
int numberOfAsteroids = 4;

//how much particles
int amountOfParticles = 20;

//arraylist
ArrayList<GameObjects> objects;

//the number of stars
int numberOfStars;
int x, y;

//check if is UFO
boolean UFO;

//checking the number of UFO
int numberOfUFO;

//spaceship
spaceShip player1;
Button button;

void setup() {
  size(1000, 800, P2D);

  //instantiating variables
  objects = new ArrayList();
  player1 = new spaceShip();
  objects.add(player1);

  //button
  button = new Button("PLAY", width / 2 - 2, height - 320, 240, 70, black, white);

  //fonts
  Minecraft = createFont("Minecraft.ttf", 120);

  //creating asteroids
  int i = 0;
  while ( i < numberOfAsteroids ) {
    objects.add(new asteroid());

    i++;
  }
}


void draw() {
  //background stars
  backgroundStars();

  //the fading effects
  noStroke();
  fill(0, 20);
  rectMode(CORNER);
  rect(0, 0, width, height);

  //this checks for collisions between the bullet and asteroid
  checkingForCollisions();

  //check spawning UFO
  checkingSpawnForUFO();



  //introduction
  //introMode();
}

void introMode() {
  introduction();
  button.show();
}


void backgroundStars() {
  //stars
  int i = 0;
  numberOfStars = 3;

  while ( i < numberOfStars ) {
    x = int(random(width));
    y = int(random(height));

    //drawing stars
    drawStars();
    i++;
  }
}


void drawStars() {
  //draw stars
  fill(white);
  strokeWeight(1);
  circle(x, y, 1);
}


void checkingSpawnForUFO() {
  //checking if theres any UFO every 1200 frames
  if ( frameCount % 1200 == 0 ) {

    //variables
    int i = 0;
    numberOfUFO = 0;

    //when its an instanceof alienSpaceship
    while ( i < objects.size() ) {
      if (objects.get(i) instanceof alienSpaceship) {
        numberOfUFO++;
      }
      i++;
    }

    if (numberOfUFO == 0) {
      objects.add(new alienSpaceship());
      println("alien spawned");
    }
  }
}


void checkingForCollisions() {
  //making all of the objects show
  int i = 0;
  while ( i < objects.size() ) {
    GameObjects currentObject = objects.get(i);
    currentObject.act();
    currentObject.show();

    //removing if lives = 0
    if (currentObject.lives == 0) {
      objects.remove(i);
    }
    i++;
  }
}
