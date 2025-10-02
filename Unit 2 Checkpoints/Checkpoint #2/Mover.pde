class Mover {
  float x, y;

  //constructor
  Mover() {
    x = width / 2;
    y = height / 2;
  }

  void show() {
    stroke(0);
    fill(255);
    strokeWeight(7);
    circle(x, y, random(20, 170));
  }

  void act() {
    x = x + random(-2, 2);
    y = y + random(-2, 2);
  }
}
