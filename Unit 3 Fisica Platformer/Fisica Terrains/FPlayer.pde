class FPlayer extends FGameObject {
  //instance variable
  int frame;

  //directions
  int direction;

  //constructor
  FPlayer(float positionX, float positionY, color c) {
    super();
    setPosition(positionX, positionY);
    setRotatable(false);
    setName("player");
    setFillColor(c);
    setNoStroke();

    //variables
    setFriction(1);
    setDensity(1);

    //animation
    frame = 0;
    attachImage(action[0]);

    //direction character is facing
    direction = R;
  }

  //behaviour functions
  void act() {
    //player movement
    playerMovement();

    //collision spike
    if (isTouching("spike")) {
      
      setPosition(x, y);
    }

    //animation
    animate();
  }

  void animate() {
    if (frame >= action.length) frame = 0;
    if (frameCount % 12 == 0) {
      if (direction == R) attachImage(action[frame]);
      if (direction == L) attachImage(reverseImage(action[frame]));
      frame++;
    }
  }

  void playerMovement() {
    //input variables
    movePlayer(aKey, dKey, wKey);
  }


  //acts as constructor
  void movePlayer(boolean left, boolean right, boolean jumpKey) {
    //variables
    float vx;
    float vy;

    //speed and jump
    float speed;
    float jumpForce;

    //instantiating jumping force
    speed = 130;
    jumpForce = 450;

    //instantiating
    vx = getVelocityX();
    vy = getVelocityY();

    //set original velocity
    velocityX = getVelocityX();

    if (abs(vy) <= 0) {
      action = idle;
    }

    if (left) {
      velocityX = -speed;
      action = run;
      direction = L;
    }
    if (right) {
      velocityX = speed;
      action = run;
      direction = R;
    }

    if (abs(vy) > 0.1)
      action = jump;

    // horizontal movement
    setVelocity(velocityX, getVelocityY());

    ArrayList<FContact> contacts = getContacts();
    if (jumpKey && contacts.size() > 0) setVelocity(getVelocityX(), -jumpForce);
  }
}
