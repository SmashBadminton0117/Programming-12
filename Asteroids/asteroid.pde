class asteroid extends GameObjects {

  //instance variable
  int numbersOfTriangles;
  int triangleSize;

  float rotationAngle;

  int numberOfLives;

  //constructor
  asteroid() {
    super(random(width), random(height), 1, 1);

    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));

    lives = 3;

    d = lives * 50;

    numbersOfTriangles = 8;
    triangleSize = -25;
    rotationAngle = 0;

    numberOfLives = lives;
    
  }

  asteroid(float x, float y, int startingLives) {
    super(x, y, 1, 0);

    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));

    lives = startingLives;

    d = lives * 50;


    numbersOfTriangles = 8;
    triangleSize = -25;
    rotationAngle = 0;

    numberOfLives = lives;
    
  }

  //behaviour function
  void show() {
    fill(black);
    stroke(white);
    strokeWeight(2);
    circle(loc.x, loc.y, d);
    
    drawAsteroid();
    
  }

  void act() {
    loc.add(vel);
    wrapAround();
    checkForCollisions();

    rotationAngle += 0.02;
    
  }

  void checkForCollisions() {
    int i = 0;
    while ( i < objects.size() ) {
      GameObjects obj = objects.get(i);
      if ( obj instanceof  bullet ) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d/2 + obj.d/2) {
          numberOfLives -= 1;
          obj.lives = 0;

          lives = 0;

          //Create 10 explosion particles
          int j = 0;
          while (j < 10) {
            objects.add(new explosionEffects(loc.x, loc.y, numberOfLives));
            j++;
          }

          if (numberOfLives > 0) {
            objects.add(new asteroid(loc.x, loc.y, numberOfLives));
            objects.add(new asteroid(loc.x, loc.y, numberOfLives));
            
          }
          lives = 0;
          objects.add(new explosionEffects(loc.x, loc.y, numberOfLives));
          
        }
      }

      i++;
    }
  }

  void drawAsteroid() {
    float asteroidScale;
    asteroidScale = numberOfLives * 0.9;

    pushMatrix();
    translate(loc.x, loc.y);

    int i = 0;
    while (i < numbersOfTriangles) {
      pushMatrix();
      rotate(radians(i * 45) + rotationAngle);

      scale(asteroidScale);

      drawTriangles();
      popMatrix();

      i++;
      
    }
    popMatrix();
    
    circle(loc.x, loc.y, d - 65);
    
  }

  void drawTriangles() {
    fill(black);
    stroke(white);
    strokeWeight(1);
    triangle(0, triangleSize, triangleSize / 2, 0, (triangleSize + 50) / 2, 0);
    
  }
}
