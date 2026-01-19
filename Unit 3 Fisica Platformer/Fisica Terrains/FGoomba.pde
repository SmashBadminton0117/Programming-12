class FGoomba extends FGameObject {
  //instance variables

  //constructor
  FGoomba(float x, float y) {
    //super class
    super();

    //instantiate values
    speed = 50;
    frame = 0;

    //wall count
    hitWall = 0;

    //goomba values
    setPosition(x, y);
    setName("goomba");
    setRotatable(false);
  }


  //behaviour functions
  void act() {
    animate();
    move();
    collide();
  }

  void animate() {
    if (frame >= goomba.length) frame = 0;
    if (frameCount % 10 == 0) {
      if (direction == R) attachImage(goomba[frame]);
      if (direction == L) attachImage(reverseImage(goomba[frame]));
      frame++;
    }
  }

  void collide() {
    if (isTouching("wall") && hitWall == 0) {
      direction *= -1;
      hitWall = 1;
    }

    if (!isTouching("wall")) {
      hitWall = 0;
    }

    if (isTouching("player")) {
      if (player.getY() < getY() - gridSize / 2) {
        world.remove(this);
        enemies.remove(this);

        //boost
        player.setVelocity(player.getVelocityX(), - 300);
      } else {
        player.setPosition(x, y);
      }
    }
  }

  void move() {
    float vy = getVelocityY();
    setVelocity(speed * direction, vy);
  }
}
