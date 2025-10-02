class Button {
  //Instance Variables
  int x, y, w, h;
  boolean clicked;
  color highlight, normal;
  String text;

  //boolean functions
  boolean mouseReleased;
  boolean wasPressed;

  //Constructor: CHANGED *x to _x (and for all parameters)
  Button(String t, int _x, int _y, int _w, int _h, color Normal, color hightlighted) {
    text = t;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    normal = Normal;
    highlight = hightlighted;
    clicked = false;
  }


  boolean touchingMouse() {
    return mouseX > x - w / 2 && mouseX < x + w / 2 && mouseY > y - h / 2 && mouseY < y + h / 2;
  }

  void show() {
    drawLabel();
    checkForClicks();
    drawRect();
  }

  void drawRect() {
    stroke(0);
    strokeWeight(3);
    rect(x, y, w, h, 20);
    fill(0);
    textSize(40);
    text(text, x, y);
  }

  void drawLabel() {
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
  }

  void checkForClicks() {
    if (touchingMouse()) {
      fill(normal);
    } else {
      fill(highlight);
    }
  }
