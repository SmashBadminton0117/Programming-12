class Mover {
  //instance variables
  PVector coords;              // coordinates
  PVector vel;                 // velocity
  float diameterOfCircle;      // diameter
  boolean alive;               //alive or not

  //constructor
  Mover() {
    coords = new PVector (random(0, width), random(0, height));
    vel = new PVector (3, 0);
    vel.setMag(random(1, 5));
    vel.rotate( radians(random(0, 360) ));
    alive = true;
  }

  Mover(float x, float y) {
    coords = new PVector (x, y);
    vel = new PVector (3, 0);
    vel.setMag(random(1, 5));
    vel.rotate( radians(random(0, 360) ));
    alive = true;
  }

  void show() {
    noStroke();
    fill(255, 50);
    diameterOfCircle = 100;
    circle(coords.x, coords.y, diameterOfCircle);
    checkForDeleteion();
  }
  
  void checkForDeleteion() {
    if(dist(coords.x, coords.y, mouseX, mouseY) < diameterOfCircle / 2 && mousePressed) {
      alive = false;
    }
  }

  void act() {
    movingTheMovers();
    bouncingOffFromTheEdges();
  }

  void movingTheMovers() {
    coords.add(vel);
  }

  void bouncingOffFromTheEdges() {
    if ( coords.x < 0 || coords.x > width ) vel.x *= -1;
    if ( coords.y < 0 || coords.y > height ) vel.y *= -1;
  }

  void showConnectionLines() {
    int i = 0;
    while ( i < myMovers.size() ) {
      Mover other = myMovers.get(i);
      float dist = dist(coords.x, coords.y, other.coords.x, other.coords.y);
      if ( dist <= 200 ) {
        float connectionLine = map(dist, 0, 200, 255, 0);
        stroke(255, connectionLine);
        strokeWeight(2);
        line ( coords.x, coords.y, other.coords.x, other.coords.y );
      }
      i++;
    }
  }
}
