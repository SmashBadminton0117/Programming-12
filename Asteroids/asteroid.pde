class asteroid extends GameObjects {

  //instance variable

  //constructor
  asteroid() {
    super(random(width), random(height), 1, 1);
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    
    lives = 3;
    d = lives * 50;
  }

  //behaviour function
  void show() {
    fill(black);
    stroke(white);
    strokeWeight(2);
    circle(loc.x, loc.y, d);

    line(loc.x, loc.y, loc.x + lives * 50 / 2, loc.y);
  }

  void act() {
    loc.add(vel);
    wrapAround();
    checkForCollisions();
  }
  
  void checkForCollisions() {
    int i = 0;
    while( i < objects.size() ) {
      GameObjects obj = objects.get(i);
      if ( obj instanceof  bullet ) {
        if(dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d/2 + obj.d/2) {
          lives = 0;
          obj.lives = 0;
        }
      }
            
      i++;
    }
  }
}
