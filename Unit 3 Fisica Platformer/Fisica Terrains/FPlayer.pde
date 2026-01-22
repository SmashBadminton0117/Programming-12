class FPlayer extends FGameObject {
  //instance variable
  int frame;

  //directions
  int direction;

  //check player status
  boolean isGrounded;

  //jumping motion
  final int maxJump = 2;
  int jumpRemaining;
  boolean jumpKeyPressed;

  int currentJump;

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

    //jumps
    jumpRemaining = maxJump;
    jumpKeyPressed = false;
    isGrounded = false;
  }

  //behaviour functions
  void act() {
    //player movement
    playerMovement();

    //animation
    animate();

    //borders
    blockBorders();
  }
  
  //prevents player going outside the world
  void blockBorders() {
    //left side of player
    if (getX() < gridSize / 2) {
      setVelocity(0, getVelocityY());
      setPosition(gridSize / 2, getY());
    }

    //right side of player
    if (getX() > width + gridSize * 6 + 5) {
      setVelocity(0, getVelocityY());
      setPosition(width + gridSize * 6 + 5, getY());
    }
  }
  
  //animation
  void animate() {
    if (frame >= action.length) frame = 0;
    if (frameCount % 7 == 0) {
      if (direction == R) attachImage(action[frame]);
      if (direction == L) attachImage(reverseImage(action[frame]));
      frame++;
    }
  }
  
  //movements
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
    speed = 100;
    jumpForce = 320;

    //instantiating
    vx = getVelocityX();
    vy = getVelocityY();

    //set original velocity
    velocityX = getVelocityX();

    //initialize contact
    ArrayList<FContact> contacts = getContacts();
    isGrounded = contacts.size() > 0 && !isTouching("tree") && !isTouching("leaf");

    //reset jumps
    if (isGrounded && vy >= -1) {
      jumpRemaining = maxJump;
      currentJump = 0;
    }

    //jump
    if (jumpKey && !jumpKeyPressed) {

      //no more jumping
      if (jumpRemaining > 0) {
        setVelocity(getVelocityX(), -jumpForce);
        jumpRemaining--;
        currentJump++;
        frame = 0;
      }
    }

    //check if jumped
    jumpKeyPressed = jumpKey;

    //check animation
    if (abs(vy) <= 1 && isGrounded) {
      action = idle;
    }

    //when jumping
    if (vy < -50) {
      //check which jump
      if (currentJump == 1) {
        action = jumpingUp;
      }

      //double jump
      else if (currentJump == 2) {
        action = doubleJump;
      }
    }

    //when it is falling
    else if (vy > 50) {
      action = jumpingDown;
    }

    if (left) {
      velocityX = -speed;
      if (abs(vy) < 50) {
        action = run;
      }
      direction = L;
    }

    if (right) {
      velocityX = speed;
      if (abs(vy) < 50) {
        action = run;
      }
      direction = R;
    }

    //setting player velocity
    setVelocity(velocityX, getVelocityY());
  }
}
