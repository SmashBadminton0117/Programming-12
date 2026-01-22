class FSpikesTrap extends FGameObject {
  //instance variable
  float detectionX, detectionY, detectionW, detectionH;

  //spike
  FBox spike;

  //check if the spike has been released
  boolean ifHasReleased;

  //constructor
  FSpikesTrap(float x, float y) {
    super(gridSize, gridSize);

    //parameters
    setPosition(x, y);
    setStatic(true);
    setGrabbable(false);
    setRotatable(false);
    setSensor(true);
    setName("spikesTrap");

    //animation
    frame = 0;
    ifHasReleased = false;
    attachImage(spikesTrap[0]);

    //detection
    detectionW = gridSize;
    detectionH = gridSize * 14;

    detectionX = x;
    detectionY = y + detectionH / 2;
  }

  //behaviour function
  void act() {
    //detection
    checkPlayer();

    //animation
    animate();

    //collision
    collision();
  }

  //detection
  void checkPlayer() {
    if (player.getX() > detectionX - detectionW / 2 && player.getX() < detectionX + detectionW / 2 && player.getY() > detectionY - detectionH / 2 && player.getY() < detectionY + detectionH / 2) {

      //set as released
      ifHasReleased = true;
      frame = 0;
    }
  }


  void animate() {
    if (ifHasReleased && frameCount % 8 == 0) {
      if (frame < spikesTrap.length) {
        attachImage(spikesTrap[frame]);

        //on this frame spawn spike
        if (frame == 4) {
          //initialize
          spike = new FBox(gridSize, gridSize);

          //parameters
          spike.setPosition(getX(), getY() + gridSize);
          spike.setRotatable(false);
          spike.setSensor(true);
          spike.setName("fallingSpike");

          //image
          spike.attachImage(spikesTrap[4]);
          spike.setVelocity(0, 200);
          world.add(spike);
        }

        frame++;
      } else {
        //reset back to frame 0
        ifHasReleased = false;
        frame = 0;
        attachImage(spikesTrap[0]);
      }
    }
  }

  //collision
  void collision() {
    //only when spikes appear
    if (spike != null) {
      ArrayList<FContact> contacts = spike.getContacts();
      for (int i = 0; i < contacts.size(); i++) {
        FContact fc = contacts.get(i);
        if (fc.contains("player")) {
          player.setPosition(gridSize, 470);
        }
      }
    }
  }
}
