class FLava extends FGameObject {
  //instance variable
  int speed;
  int frame;

  //constructor
  FLava(float x, float y) {
    //instantiate
    speed = 50;
    frame = int(random(lava.length));

    //values
    setPosition(x, y);
    setName("lava");
    setRotatable(false);
  }

  //behaviour function
  void act() {
    animate();
    collide();
  }

  void animate() {
    if (frame >= lava.length) frame = 0;
    if (frameCount % 12 == 0) {
      attachImage(lava[frame]);
      frame++;
    }
  }

  void collide() {
    if (isTouching("player")) {
      if (player.getY() < getY() - gridSize / 2) {
        player.setPosition(x, y);
      }
    }
  }
}
