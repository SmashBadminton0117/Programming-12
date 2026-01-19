class FHammerBro extends FGameObject {
  //instance variable
  //detect if player in range
  float detectionX, detectionY, detectionW, detectionH;

  //hammer variables
  boolean isThrowingHammer;

  //player coordinates
  boolean playerRange;

  //parameters
  int hammerBroSpeed;
  float distance;

  //constructor
  FHammerBro(float x, float y) {
    super(gridSize, gridSize * 1.6);

    //instantializing variables
    frame = 0;

    //collide
    hammerBroSpeed = 50;
    speed = 270;
    hitWall = 0;

    //parameters of hammer bro
    setPosition(x - 1, y);
    setRotatable(false);
    setName("hammerbro");

    //detection
    detectionX = getX();
    detectionY = getY() + gridSize;

    //width + height
    detectionW = gridSize * 28;
    detectionH = gridSize * 2;

    //weapons instanliazing
    isThrowingHammer = false;
    timer = 0;
    cooldown = 180;
  }

  //behaviour functions
  void act() {
    //Hammer Bro
    animate();
    move();
    collide();

    //Hammer Weapon
    throwHammer();

    //collision
    checkPlayerDistance();
  }


  //functions
  //checking player distance
  boolean checkPlayerDistance() {
    //variables
    float distanceX = player.getX() - getX();
    float distanceY = player.getY() - getY();

    //if player is within the girdsizes
    if (distanceX > - gridSize * 14 && distanceX < gridSize * 14 && distanceY > - gridSize * 2 && distanceY < gridSize * 2) {
      return true;
    }
    return false;
  }


  void throwHammer() {
    if (checkPlayerDistance()) {
      //variable
      float distanceX = player.getX() - getX();
      float distanceY = player.getY() - getY();
      
      //initlize
      distance = sqrt(distanceX * distanceX + distanceY * distanceY);

      timer++;
      if (timer >= cooldown) {
        //hammer fbox
        FBox hmr = new FBox(gridSize - 5, gridSize - 5);

        //parameters
        hmr.setPosition(getX(), getY() - gridSize / 2);
        hmr.setName("hammer");
        hmr.setRotatable(true);
        hmr.setAngularVelocity(17);
        hmr.setSensor(true);
        hmr.attachImage(Hammer);

        //speed
        speed = 270;

        hmr.setVelocity((distanceX / distance) * speed, (distanceY / distance) * speed - 200);

        //adding to the world
        world.add(hmr);

        //reset
        timer = 0;
      }
    }
  }


  //character walking
  void animate() {
    if (frame >= HammerBro.length) frame = 0;
    if (frameCount % 17 == 0) {
      if (direction == R) attachImage(HammerBro[frame]);
      if (direction == L) attachImage(reverseImage(HammerBro[frame]));
      frame++;
    }
  }

  //collision to wall + player
  void collide() {
    if (isTouching("wall") && hitWall == 0) {
      direction *= -1;
      hitWall = 1;
    }

    if (!isTouching("wall")) {
      hitWall = 0;
    }

    //if (isTouching("player")) {
    //  if (player.getY() < getY() - gridSize / 2) {
    //    world.remove(this);
    //    enemies.remove(this);

    //    //boost
    //    player.setVelocity(player.getVelocityX(), - 300);
    //  } else {
    //    player.setPosition(x, y);
    //  }
    //}
  }

  void move() {
    float vy = getVelocityY();
    setVelocity(hammerBroSpeed * direction, vy);
  }
}
