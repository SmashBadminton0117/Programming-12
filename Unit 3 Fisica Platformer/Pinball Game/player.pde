void player1() {
  //remove ball after each turn
  if (ball != null) {
    world.remove(ball);
  }

  //makes new ball
  ball = new FCircle(40);

  //set position
  ball.setPosition(ballX, ballY);

  // visuals
  ball.setStroke(0);
  ball.setStrokeWeight(2);

  //colour
  if (currentPlayer == 1) {
    ball.setFillColor(lightBlue);
  } else if (currentPlayer == 2) {
    ball.setFillColor(lightRed);
  }

  // physical properties
  ball.setDensity(0.2);
  ball.setFriction(1);
  ball.setRestitution(0.9);

  world.add(ball);

  launched = false;
}
