class Mover {
  //instance variables
  PVector coords;   // coordinates
  PVector vel; // velocity
  float diameterOfCircle;      // diameter

  //constructor
  Mover() {
    coords = new PVector (random(0, width), random(0, height));
    vel = new PVector (random(-1, 1), random(-1, 1));

    diameterOfCircle = 100;
  }

  void show() {
    noStroke();
    fill(255, 50);
    circle(coords.x, coords.y, diameterOfCircle);
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
    while ( i < numberOfMovers ) {
      float dist = dist(coords.x, coords.y, myMovers[i].coords.x, myMovers[i].coords.y);
      if ( dist <= 200 ) {
        float connectionLine = map(dist, 0, 200, 255, 0);
        stroke(255, connectionLine);
        strokeWeight(2);
        line ( coords.x, coords.y, myMovers[i].coords.x, myMovers[i].coords.y );
      }
      i++;
    }
  }
}
