void keyPressed() {
  if (key == 'w' || key == 'W') wKey = true;
  if (key == 'a' || key == 'A') aKey = true;
  if (key == 's' || key == 'S') sKey = true;
  if (key == 'd' || key == 'D') dKey = true;

  if (keyCode == LEFT) leftKey = true;
  if (keyCode == RIGHT) rightKey = true;
  if (keyCode == UP) upKey = true;
  if (keyCode == DOWN) downKey = true;

  if (key == ' ') spaceKey = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') wKey = false;
  if (key == 'a' || key == 'A') aKey = false;
  if (key == 's' || key == 'S') sKey = false;
  if (key == 'd' || key == 'D') dKey = false;

  if (keyCode == LEFT)   leftKey = false;
  if (keyCode == RIGHT)  rightKey = false;
  if (keyCode == UP)     upKey = false;
  if (keyCode == DOWN)   downKey = false;

  if (key == ' ')    spaceKey = false;
}

//button
void mousePressed() {
    if (mouseX > resetButtonX && mouseX < resetButtonX + resetButtonWidth && mouseY > resetButtonY && mouseY < resetButtonY + resetButtonHeight) {
      loadLevel();
  }
}

PImage reverseImage(PImage image) {
  //varaibles
  PImage reverse;

  //instantiate
  reverse = createImage(image.width, image.height, ARGB);

  //loop
  for ( int i = 0; i < image.width; i++ ) {
    for ( int j = 0; j < image.height; j++ ) {
      int xPixel, yPixel;
      xPixel = image.width - 1 - i;
      yPixel = j;
      reverse.pixels[yPixel * image.width + xPixel] = image.pixels[j * image.width + i];
    }
  }
  return reverse;
}
