class GameObjects {
  //instance variables
  PVector loc;
  PVector vel;
  
  //number of lives
  int lives;
  
  //diameters
  float d;
  
  //timer
  int timer;
  
  //showing the Alive time
  int showAliveTime;
  
  //rotating the circles
  float rotationPI;
  
  //determines if the bullet shoots the asteroid && colour
  boolean alienBullet;

  //constructors
  GameObjects(float lx, float ly, float vx, float vy) {
    loc = new PVector (lx, ly);
    vel = new PVector (vx, vy);
    lives = 3;
  }

  GameObjects(PVector l, PVector v) {
    loc = l;
    vel = v;
    lives = 3;
  }

  GameObjects(PVector l, PVector v, int lv) {
    loc = l;
    vel = v;
    lives = lv;
  }

  GameObjects(float x, float y, int t) {
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    timer = t;
  }


  //behaviour functions
  void act() {
  }

  void show() {
  }

  void wrapAround() {
    if ( loc.x < 0 ) loc.x = width;
    if ( loc.x > width ) loc.x = 0;
    if ( loc.y < 0 ) loc.y = height;
    if ( loc.y > height ) loc.y = 0;
  }
}
