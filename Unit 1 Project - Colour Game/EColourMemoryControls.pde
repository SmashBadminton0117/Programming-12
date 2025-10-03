void mouseReleased() {
  
  if ( mode == GAME ) {
    if (mouseX < width / 2 && matches) {
      points++; //adds points if matches
        pressedSuccessed.play();

    } else if (mouseX > width / 2 &&!matches) {
      points++; //adds points if chosen not matches
      pressedSuccessed.play();
      
    } else {
      mode = GAMEOVER; //wrong option
      pressedFailure.play();
      return;
    }
  }
  
  if ( mode == GAMEOVER ) {
    if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
      mode = INTRO;
      return;
    }
  }
  
    mode = GAME;


  // Move to next round
  pickNewSelection();
  countDown = 600;
}
