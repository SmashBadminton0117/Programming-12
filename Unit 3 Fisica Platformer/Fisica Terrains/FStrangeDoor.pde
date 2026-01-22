class FStrangeDoor extends FGameObject {
  //instance variable
  boolean doorOpened;

  //constructor
  FStrangeDoor(float x, float y) {
    super(gridSize * 2, gridSize * 6);

    //parameters
    setPosition(x, y);
    setStatic(true);
    setGrabbable(false);
    setRotatable(false);
    setSensor(false);
    setName("strangedoor");

    //animation
    frame = 0;
    doorOpened = false;
  }

  //behaviour function
  void act() {
    //animation
    animation();
    
    //check if player is heading to next level
    playerPosition();
  }

  void animation() {
    //reset frames
    if (isDoorOpened != doorOpened) {
      frame = 0;
      doorOpened = isDoorOpened;
    }

    if (frameCount % 20 == 0) {
      if (isDoorOpened) {
        //opening door
        if (frame < strangeDoorOpening.length - 1) {
          frame++;
        }
        attachImage(strangeDoorOpening[frame]);
        setSensor(false);
      } 
      
      //closing door
      else {
        attachImage(strangeDoor[frame]);
        frame++;
        if (frame >= strangeDoor.length) frame = 0;
      }
    }
  }

  void playerPosition() {
    //check if door opened
    if (isDoorOpened && frame >= strangeDoorOpening.length - 1 && isTouching("player")) {
      
      //next level
      if (levelMode == secondLevel) {
        levelMode = thirdLevel;
        loadLevel();
      }
    }
  }
}
