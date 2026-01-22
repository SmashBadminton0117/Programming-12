class FTorch extends FGameObject {
  // instance variables
  
  // constructor
  FTorch(float x, float y) {
    super(gridSize, gridSize);

    // parameters
    setPosition(x, y);
    setStatic(true);
    setGrabbable(false);
    setRotatable(false);
    setSensor(true);
    setName("torch");
    
    // Initialize
    frame = 0;
    attachImage(torch[0]);
  }

  // behaviour function
  void act() {
    animate();
  }

  void animate() {
    if (frameCount % 12 == 0) {
      frame++;
      if (frame >= torch.length) {
        frame = 0;
      }
      attachImage(torch[frame]);
    }
  }
}
