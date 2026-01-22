class FButton extends FGameObject {
  //instance variable
  boolean buttonWasPressed;
  
  //constructor
  FButton(float x, float y) {
    super(gridSize * 2, gridSize / 2 - 5);
    
    //parameters
    setPosition(x, y);
    setStatic(true);
    setGrabbable(false);
    setRotatable(false);
    setSensor(true);
    
    //animation
    attachImage(button[0]);
    
    //collision
    buttonWasPressed = false;
  }
  
  //behaviour function
  void act() {
    collision();
  }
  
  void collision() {
    if (isTouching("player") || isTouching("stone")) {
      //set parameters
      buttonWasPressed = true;
      isDoorOpened = true;
      attachImage(button[1]);
    } else {
      
      //if nothing is pressing on it
      buttonWasPressed = false;
      isDoorOpened = false;
      attachImage(button[0]);
    }
  }
}
