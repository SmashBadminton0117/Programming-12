class FCoin extends FGameObject {
  //instance variables
  int framePickingUp;
  
  //check if coin if collected
  boolean checkIfCollected;
  
  //constructor
  FCoin(float x, float y) {
    super(gridSize + 10, gridSize + 10);
    
    //parametsers
    setPosition(x, y);
    setStatic(true);
    setSensor(true);
    setRotatable(false);
    setName("coin");
    
    //animations
    frame = 0;
    checkIfCollected = false;
    framePickingUp = 0;
    attachImage(coin[0]);
  }
  
  
  //behaviour functions
  void act() {
    //check which animation
    if (!checkIfCollected) {
      animate();
      checkPickup();
    } else {
      pickUpAnimate();
    }
  }
  
  //animation
  void animate() {
    if (frameCount % 10 == 0) {
      frame++;
      
      //reseting frame
      if (frame >= coin.length) frame = 0;
      attachImage(coin[frame]);
    }
  }
  
  //check if player touches coin
  void checkPickup() {
    if (isTouching("player")) {
      checkIfCollected = true;
      framePickingUp = 0;
    }
  }
  
  //pickup animation
  void pickUpAnimate() {
    if (frameCount % 8 == 0) {
      framePickingUp++;
      
      //when the animation is over remove this
      if (framePickingUp >= coinPickUp.length) {
        world.remove(this);
        terrain.remove(this);
        return;
      }
      attachImage(coinPickUp[framePickingUp]);
    }
  }
}
