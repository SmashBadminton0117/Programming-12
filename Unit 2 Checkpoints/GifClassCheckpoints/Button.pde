class Button {
  //Instance Variables
  int x, y, w, h;
  boolean clicked;
  color highlight, normal;
  String text;

  //boolean functions
  boolean mouseReleased;
  boolean wasPressed;

  //PImage int
  PImage cryingEmote;

  //GIF emote
  Gif cryingEmoteGIF;

  Button(PImage pic, int _x, int _y, int _w, int _h, color Normal, color hightlighted) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    normal = Normal;
    highlight = hightlighted;
    clicked = false;
    cryingEmote = pic;
  }

  Button(String t, int _x, int _y, int _w, int _h, color Normal, color hightlighted) {
    text = t;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    normal = Normal;
    highlight = hightlighted;
    clicked = false;
    cryingEmote = null;
  }

  Button(Gif g, int _x, int _y, int _w, int _h, color Normal, color hightlighted) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    normal = Normal;
    highlight = hightlighted;
    clicked = false;
    cryingEmoteGIF = g;
    cryingEmote = null;
  }



  boolean touchingMouse() {
    return mouseX > x - w / 2 && mouseX < x + w / 2 && mouseY > y - h / 2 && mouseY < y + h / 2;
  }

  void show() {
    drawLabel();
    drawRect();
    drawImage();
    checkForClicks();
  }

  void drawRect() {
    stroke(0);
    strokeWeight(3);
    rect(x, y, w, h, 20);
  }

  void drawLabel() {
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    if (touchingMouse()) {
      fill(normal);
    } else {
      fill(highlight);
    }
  }

  void checkForClicks() {
    if (mouseReleased && touchingMouse()) {
      clicked = true;
    } else {
      clicked = false;
    }
  }

  void drawImage() {
    if ( cryingEmoteGIF != null ) {
      cryingEmoteGIF.show();
      
    } else if (cryingEmote == null) {
      fill(0);
      textSize(40);
      text(text, x, y);
      
    } else {
      imageMode(CENTER);
      image(cryingEmote, x, y, w + 100, h);
      
    }
  }

  void clicked() {
    mouseReleased = false;
    if (mousePressed) wasPressed = true;
    if (wasPressed && !mousePressed) {
      mouseReleased = true;
      wasPressed = false;
      if (touchingMouse()) {
        clicked = !clicked;
      }
    }
  }
}
