void keyPressed() {
  //add force
  if (key == ' ' && !launched && !gameOver && ball != null) {
    ball.addImpulse(0, -launchForce);
    launched = true;
  }
  
  //to reset the game
  if ((key == 'r' || key == 'R') && gameOver) {
    resetGame();
  }
}
