//spaceship
class spaceShip extends GameObjects {

  //instance variable
  PVector dir;
  int maxSpeed;
  int cooldown;

  //constructor
  spaceShip() {
    super(width / 2, height / 2, 0, 0);
    dir = new PVector (1, 0);
    cooldown = 0;

    maxSpeed = 10;
  }

  //behaviour functions
  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir.heading());
    drawShip();

    popMatrix();
  }

  void drawShip() {
    fill(black);
    stroke(white);
    strokeWeight(1.7);
    triangle(-5, -15, -5, 15, 20, 0);
    line(-5, -15, 5, -15);
    line(-5, 15, 5, 15);
    strokeWeight(1);
    line(0, -12, 0, 12);
    strokeWeight(2);
    triangle(-10, -10, -10, 10, 30, 0);
    strokeWeight(1);
    line(-6, -8, -6, 8);
    line(-6, 0, 30, 0);
    strokeWeight(2);
    circle(5, 0, 6);
  }

  void act() {
    move();
    shoot();

    wrapAround();
  }

  void move() {

    if (wKey) vel.add(dir);

    if (vel.mag() > maxSpeed) {
      vel.setMag(maxSpeed);
    }
    vel.x =  vel.x * 0.95;
    vel.y =  vel.y * 0.95;

    loc.add(vel);


    if (aKey) dir.rotate(radians(-3));
    if (dKey) dir.rotate(radians(3));
  }

  void shoot() {
    cooldown--;
    if (spaceKey && cooldown <= 0) {
      objects.add( new bullet() );
      cooldown = 30;
    }
  }
}
