//intro
void introScreen() {
  //draw backgrounds for intro
  image(backgroundImageBlur, 0, 30);
  image(backgroundImageTrees, 0, 30);
  image(backgroundImageShadows, 0, 30);
  image(backgroundImageFront, 0, 130);

  //intro text
  fill(255);
  textSize(64);
  text("WELCOME TO THIS GAME", width / 2, height / 3);
  textSize(32);
  text("Press SPACE to Start", width / 2, height / 2);

  //start key
  if (spaceKey) {
    modeFramework = game;
  }
}

//game
void game() {
  //drawing the world
  drawWorld();

  //displaying the act functions for all class
  actWorld();

  //button
  drawResetButton();
}

//win
void winningScreen() {
  background(0, 150, 0);
  fill(255);
  textSize(64);
  text("YOU WIN!", width/2, height/2 - 50);
  textSize(32);
  text("Press R to Restart", width/2, height/2 + 50);

  //reset game
  if (keyPressed && (key == 'r' || key == 'R')) {
    resetGame();
  }
}

//lose
void losingScreen() {
  background(150, 0, 0);
  fill(255);
  textSize(64);
  text("YOU LOSE!", width/2, height/2 - 50);
  textSize(32);
  text("Press R to Retry", width/2, height/2 + 50);

  
  //reset game
  if (keyPressed && (key == 'r' || key == 'R')) {
    resetGame();
  }
}

void resetGame() {
  //reset player position
  loadPlayer();

  //clear world objects
  terrain.clear();
  enemies.clear();
  world.clear();

  //reload world
  loadWorld();

  //go back to intro or game
  modeFramework = intro;
}
