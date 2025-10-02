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
