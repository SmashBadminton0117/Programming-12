class FThwomp extends FGameObject {
  //instance variable
  //mode framework
  int thwompMode;

  //different modes
  final int stationary = 0;
  final int falling    = 1;
  final int reseting   = 2;

  //detection rect
  float detectionWidth;
  float detectionHeight;

  //detection
  float detectionX, detectionY;

  //stationary position
  float x1, y1;

  //animation
  int frame;

  //timer
  int timer;

  //check landing
  boolean checkIfLanded;


  //constructor
  FThwomp(float x, float y) {
    super(gridSize * 2, gridSize * 2);

    //initial values
    setPosition(x, y);
    setName("thwomp");
    setStatic(true);
    setRotatable(false);

    //mode
    thwompMode = stationary;

    //detection rect
    detectionWidth = gridSize * 2;
    detectionHeight = gridSize * 8;

    //stationary position
    x1 = x;
    y1 = y;

    //animation
    frame = 0;
    timer = 0;

    //landed
    checkIfLanded = false;

    //collision
    detectionX = getX();
    detectionY = getY() + gridSize;
  }


  //behaviour functions
  void act() {
    collision();
    modeFramework();
    animation();
  }


  //collision
  void collision() {
    if (thwompMode == stationary) {
      if (player.getX() > detectionX - detectionWidth / 2 && player.getX() < detectionX + detectionWidth / 2 && player.getY() > detectionY - detectionHeight / 2 && player.getY() < detectionY + detectionHeight / 2) {

        //values after collision
        thwompMode = falling;
        setStatic(false);
        setSensor(false);
        setVelocity(0, 800);
        timer = 0;
        checkIfLanded = false;
      }
    }
  }

  //different modes
  void modeFramework() {
    if (thwompMode == falling) {
      
      //collision detected
      if ((isTouching("dirt") || isTouching("wall") || isTouching("ice")) && !checkIfLanded) {

        //values when touching
        setVelocity(0, 0);
        setStatic(true);

        //checking thwomp landing
        checkIfLanded = true;

        //start a timer
        timer = 0;
      }


      //timing to reset
      if (checkIfLanded) {
        timer++;


        //60 frames
        if (timer >= 100) {
          thwompMode = reseting;
          timer = 0;
        }
      }
    } 
    
    else if (thwompMode == reseting) {
      
      //setting it back to the position
      setPosition(x1, y1);
      
      //values
      setVelocity(0, 0);
      setStatic(true);
      setSensor(false);
      
      //setting the mode back to stationary
      thwompMode = stationary;
      
      //reseting timer
      timer = 0;
      
      //reseting boolean
      checkIfLanded = false;
    }
  }


  //attach image
  void animation() {
    //checking current image
    if (thwompMode == stationary) {
      frame = 0;
    } else if (thwompMode == falling) {
      frame = 1;
    }
    
    //attaching the image
    attachImage(Thwomp[frame]);
  }
}
