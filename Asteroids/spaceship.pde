//spaceship
class spaceShip extends GameObjects {

  //instance variable
  PVector dir;
  int maxSpeed;
  int cooldown;

  int randomizedColour;
  int coveringLayer;

  //teleport:
  boolean safe;
  float x, y;
  int teleportCoolDown;
  int teleportingRange;
  
  float angle;
  float distance;

  //progress bar
  float barWidth;
  
  //colour lives
  int playerLiveColour;
  

  //constructor
  spaceShip() {
    super(width / 2, height / 2, 0, 0);
    dir = new PVector (1, 0);
    cooldown = 0;
    maxSpeed = 7;

    coveringLayer = width * height;
    
    //cooldown and range
    teleportCoolDown = 20;
    teleportingRange = 200;

    //random location
    x = int(random(width));
    y = int(random(height));
    
    //sphere teleporting range
    angle = random(TWO_PI);
    distance = random(teleportingRange);
    
    lives = 3;
  }

  //behaviour functions
  void show() {
    //drawing the covering layer
    hoveringSpaceship();

    coolDownProgressBar();
    playerLives();
  }

  void hoveringSpaceship() {
    fill(0, 80);
    noStroke();
    circle(loc.x, loc.y, coveringLayer);

    pushMatrix();
    translate(loc.x, loc.y);

    fill(black);
    stroke(white);
    strokeWeight(2);
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
    //moving & shooting
    move();
    shoot();

    //collisions
    collisionBetweenAsteroids();
    collisionBetweenBullets();

    //wrapping around the screen
    wrapAround();

    //trail of the spaceship
    trail();

    //teleport function
    teleport();
  }

  void move() {
    //move forward
    if (wKey) vel.add(dir);

    //speed limit
    if (vel.mag() > maxSpeed) {
      vel.setMag(maxSpeed);
    }

    //gravity drag
    vel.x =  vel.x * 0.95;
    vel.y =  vel.y * 0.95;

    loc.add(vel);

    //rotations
    if (aKey) dir.rotate(radians(-3));
    if (dKey) dir.rotate(radians(3));
  }

  void shoot() {
    //cool down
    cooldown--;
    if (spaceKey && cooldown <= 0) {
      objects.add( new bullet() );
      cooldown = 20;
    }
  }

  void playerLives() {
    //drawing player lives
    pushMatrix();
    translate(40, height - 70);
    scale(0.45);

    for(int i = 0; i < lives; i++) {
      drawPlayersLives();
      translate(120, 0);
    }

    popMatrix();
  }

  void drawPlayersLives() {
    ////colour change
    //if (lives == 3) {
    //  stroke(green);
    //} else if (lives == 2) {
    //  stroke(orange);
    //} else if (lives == 1) {
    //  stroke(red);
    //}
    
    //player lives
    noFill();
    stroke(white);
    strokeWeight(7);
    triangle(0, 0, 50, -120, 100, 0);
    
    
  }

  void teleport() {
    //cool down
    teleportCoolDown--;
    
    //everytime called, safe is true
    safe = true;

    if (teleportCoolDown < 0) {
      teleportCoolDown = 0;
    }

    for (int i = 0; i < objects.size(); i++) {
      GameObjects obj = objects.get(i);
      if (obj instanceof asteroid) {
        if (dist(x, y, obj.loc.x, obj.loc.y) < d + obj.d + 20) {
          safe = false;
        }
      }
    }

    //checks if the cooldown and key is ready
    if (tKey == true && teleportCoolDown <= 0 && safe) {
      
      println("teleporting!" + safe);
      
      loc.x = x;
      loc.y = y;
      
      //spaceship loc.x and y adds the teleport range with the dir
      x = loc.x + cos(angle) * distance * 2;
      y = loc.y + sin(angle) * distance * 2;

      //every 400 frames
      teleportCoolDown = 400;
    }
  }

  void coolDownProgressBar() {
    //variables
    int x, y, w, h;
    int progressBar = 0;
    barWidth = map(teleportCoolDown, 400, 0, 0, 170);

    x = 30;
    y = height - 60;
    w = 170;
    h = 30;

    //drawing the progress
    stroke(255);
    strokeWeight(4);
    noFill();
    rect(x, y, w, h);


    //filling the progressBar
    while (progressBar < barWidth) {
      stroke(255);
      line(30 + progressBar, height - 60, 30 + progressBar, height - 30);
      progressBar++;
    }

    //draw "teleport"
    fill(black);
    textFont(Minecraft);
    textSize(15);
    textAlign(CENTER, CENTER);
    text("TELEPORT [ T ]", x + 85, y + 15);
  }
  
  void invulnerable() {
    boolean invulnerability;
    
    for(int i = 0; i < objects.size(); i++) {
      
    }
    
  }

  void trail() {
    //when wKey is being pressed, explosion gets called at the spaceship
    if (wKey) {
      PVector directionExplosionForce = new PVector(1, 0);

      pushMatrix();
      scale(0.02);

      //roation + alive
      showAliveTime = 1;
      rotationPI = 1;

      //add the explosion
      objects.add(new shapes(loc.x - dir.x * 20, loc.y - dir.y * 20, showAliveTime));


      popMatrix();

      directionExplosionForce.rotate(vel.heading());
      vel.add(directionExplosionForce);
    }
  }

  //1st collision that checks spaceship vs asteroids
  void collisionBetweenAsteroids() {
    int i = 0;
    while ( i < objects.size() ) {
      GameObjects obj = objects.get(i);
      if ( obj instanceof asteroid ) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d + obj.d / 2 + 25) {
          println("player died");
          //lives -= 1;
        }
      }
      i++;
    }
  }

  //2nd collision that checks spaceship vs bullets
  void collisionBetweenBullets() {
    int i = 0;
    while ( i < objects.size() ) {
      GameObjects obj = objects.get(i);

      if (obj instanceof bullet) {
        bullet spaceShip = (bullet) obj;

        if (spaceShip.alienBullet == true) {

          if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d + obj.d + 20) {
            println("alien shot player");
            lives -= 1;
            obj.lives = 0;
          }
        }
      }
      i++;
    }
  }
}
