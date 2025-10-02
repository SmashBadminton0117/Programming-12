class Mover {
  float x, y;
  float r, g, b;

  //constructor
  Mover() {
    x = width / 2;
    y = height / 2;

    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
  }

  void show() {

    stroke(0);
    fill(r, g, b);
    strokeWeight(7);
    circle(x, y, 120);
  }

  void act() {
    x = x + random(-4, 4);
    y = y + random(-4, 4);
  }
}
