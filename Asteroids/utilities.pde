void keyPressed() {
  if (key == 'a' || key == 'A') aKey = true;
  if (key == 'd' || key == 'D') dKey = true;
  if (key == 'w' || key == 'W') wKey = true;
  if (key == 's' || key == 'S') sKey = false;
  if (key == ' ') spaceKey = true;
  if (key == 't' || key == 'T') tKey = true;
}

void keyReleased() {
  if (key == 'a') aKey = false;
  if (key == 'd') dKey = false;
  if (key == 'w') wKey = false;
  if (key == 's') sKey = false;
  if (key == ' ') spaceKey = false;
  if (key == 't' || key == 'T') tKey = false;
}
