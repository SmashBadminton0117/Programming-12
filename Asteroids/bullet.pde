class bullet extends GameObjects {
  //instance variable
  int timer;

  //constructor
  bullet() {
    super(player1.loc.copy(), player1.dir.copy());
    vel.setMag(10);
    timer = 60;
    
    d = 5;
  }

  //behaviour function

  void show() {
    fill(black);
    stroke(white);
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
