void introduction() {
  //showBackgroundGame();
  drawTitle();
}


void drawTitle() {
  //title
  fill(white);
  textAlign(CENTER, CENTER);
  textFont(Minecraft);
  text("ASTEROID", width / 2, 300);
}


//void showBackgroundGame() {
//  //background stars
//  backgroundStars();

//  //the fading effects
//  noStroke();
//  fill(0, 20);
//  rectMode(CORNER);
//  rect(0, 0, width, height);

//  //this checks for collisions between the bullet and asteroid
//  checkingForCollisions();

//  //check spawning UFO
//  checkingSpawnForUFO();
//}
