class bullet extends GameObjects {
  //instance variable
  int timer;
  boolean isPlayersBullet;

  //constructor
  bullet() {
    super(player1.loc.copy(), player1.dir.copy());
    vel.setMag(10);
    timer = 60;
    alienBullet = false;

    d = 5;
  }

  bullet(float x, float y) {
    super(x, y, 0, 0);
    loc.x = x;
    loc.y = y;
    vel.setMag(10);
    alienBullet = true;
    timer = 60;
    d = 5;
  }

  //behaviour function

  void show() {
    fill(black);
    if (alienBullet == true) {
      stroke(red);
    } else {
      stroke(white);
    }
    strokeWeight(2);
    circle(loc.x, loc.y, d);
  }

  void act() {
    loc.add(vel);
    wrapAround();
    timer--;
    if (timer == 0) lives = 0;
  }
}
