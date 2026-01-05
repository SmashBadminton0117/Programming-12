void checkLanding() {
  if (ballsP1 <= 0 && ballsP2 <= 0) {
    gameOver = true;
    return;
  }

  //variables
  float x;

  //ingame variables
  int dividerCount;
  float spacing;

  //slots
  int slotIndex;

  //points by slot
  int points;

  //initiate
  if (ball.getY() > height - 70) {
    x = ball.getX();

    dividerCount = 9;
    spacing = width / dividerCount;

    //different slots
    slotIndex = int(x / spacing);

    //constrain to the slots
    slotIndex = constrain(slotIndex, 0, dividerCount - 1);

    //launching lane
    if (x > width - laneWidth) {
      println("Inside launching lane");
    } else {
      points = (slotIndex + 1) * 100;

      if (currentPlayer == 1) {
        PlayerScore1 += points;
      } else {
        PlayerScore2 += points;
      }


      //checks for the current player
      if (currentPlayer == 1) {
        ballsP1--;
      } else {
        ballsP2--;
      }

      //after the finishes each turn, it goes to next turn
      if (currentPlayer == 1) {
        currentPlayer = 2;
      } else {
        currentPlayer = 1;
      }

      //respawn
      player1();
    }
  }
}
