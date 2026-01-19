class FCoin extends FGameObject {
  //instance variables
  
  
  //constructor
  FCoin(float x, float y) {
    super(gridSize, gridSize);
    
    setPosition(x, y);
    setStatic(true);
    setSensor(true);
    setRotatable(false);
    setName("coin");

    frame = 6;
    attachImage(coin[0]);
  }
  
  
  //behaviour functions
  void act() {
    animate();
  }
  
  //animation
  void animate() {
    if (frameCount % 10 == 0) {
      frame++;
      if (frame >= coin.length) {
        frame = 0;
      }
      attachImage(coin[frame]);
    }
  }
}
