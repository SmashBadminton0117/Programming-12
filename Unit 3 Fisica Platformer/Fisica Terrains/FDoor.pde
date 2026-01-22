class FDoor extends FGameObject {
  //instance variable

  //constructor
  FDoor(float x, float y) {
    super();

    //parameters
    setPosition(x, y);
    setStatic(true);
    setSensor(true);
    setName("door");
    attachImage(levelDoor);

    //collision
  }

  //behaviour function
  void act() {
    collision();
  }

  void collision() {
    if (isTouching("player")) {

      if (levelMode == firstLevel) {
        levelMode = secondLevel;
        loadLevel();
      }
    }
  }
}
