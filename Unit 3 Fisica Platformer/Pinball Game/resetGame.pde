void resetGame() {
  //points
  PlayerScore1 = 0;
  PlayerScore2 = 0;
  
  //turn
  ballsP1 = 3;
  ballsP2 = 3;
  
  //change current player
  currentPlayer = 1;
  
  //restart gameover
  gameOver = false;
  
  //reset
  player1();
}
