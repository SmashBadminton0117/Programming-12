class FThwomp extends FGameObject {
  //instance variable
  //mode framework
  int thwompMode;

  //different modes
  final int stationary = 0;
  final int falling    = 1;
  final int reseting   = 2;

  //detection rect
  float detectionWidth, detectionHeight;

  //detection
  float detectionX, detectionY;

  //stationary position
  float originX, originY;

  //animation
  int frame;
  
  //check landing
  boolean checkIfLanded;
  
  //resetting
  float resetSpeed;


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
    detectionHeight = gridSize * 16;

    //stationary position
    originX = x;
    originY = y;

    //animation
    frame = 0;
    timer = 0;

    //landed
    checkIfLanded = false;
    
    //resetting the thwomp
    resetSpeed = 2;

    //collision
    detectionX = getX();
    detectionY = getY() + detectionHeight / 2;
  }


  //behaviour functions
  void act() {
    checkPlayer();
    modeFramework();
    checkCollisionPlayer();
    animation();
  }


  //collision
  void checkPlayer() {
    if (thwompMode == stationary) {
      if (player.getX() > detectionX - detectionWidth / 2 && player.getX() < detectionX + detectionWidth / 2 && player.getY() > detectionY - detectionHeight / 2 && player.getY() < detectionY + detectionHeight / 2) {

        //values after collision
        thwompMode = falling;
        setStatic(false);
        setSensor(false);
        setVelocity(0, 5);

        //timer
        timer = 0;

        //checking
        checkIfLanded = false;
      }
    }
  }

  void checkCollisionPlayer() {
    //collision with player
    if (isTouching("player")) {
      if (player.getY() < getY() - gridSize) {
        player.setVelocity(player.getVelocityX(), 0);
      } else {
        //setting player pos back to spawn
        player.setPosition(x, y);
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
    } else if (thwompMode == reseting) {
      
       //get position of the original position
      if (getY() > originY) {
        setPosition(originX, getY() - resetSpeed);
      } 
      
      //when reaches the place set stationary
      else {
        setPosition(originX, originY);
        thwompMode = stationary;
        timer = 0;
        checkIfLanded = false;
      }
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
