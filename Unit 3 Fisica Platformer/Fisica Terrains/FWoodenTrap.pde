class FWoodenTrap extends FGameObject {
  //instance variable
  
  //constructor
  FWoodenTrap(float x, float y) {
    super(gridSize * 3, gridSize * 4 + 20);
    
    //parameters
    setPosition(x, y);
    setStatic(true);
    setRotatable(false);
    setGrabbable(false);
    setSensor(true);
    setName("woodenTrap");
    
    //animation
    frame = 0;
    attachImage(woodenTrap[0]);
  }
  
  //behaviour function
  void act() {
    //animation
    animate();
    
    //collide
    collision();
  }
  
  //animation loop
  void animate() {
    if (frameCount % 12 == 0) {
      frame++;
      if (frame >= woodenTrap.length) {
        frame = 0;
      }
      attachImage(woodenTrap[frame]);
    }
  }
  
  void collision() {
    //collide
    if (isTouchingBody(player)) {
      player.setPosition(32, 470);
    }
  }
}
