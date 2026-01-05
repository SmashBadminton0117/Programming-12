import fisica.*;

//Lawrence Mo
//December 9th, 2025
//Fisica Terrains

//color palette
color black     = #000000;
color red       = #FF0000;
color blue      = #49b2eb;
color green     = #5ccc52;
color brown     = #999054;
color darkBlue  = #3a59d6;
color slime     = #43f06b;
color cyan      = #4bf4fa;
color yellow    = #e0e647;
color grey      = #858582;
color lavaColor = #ff0022;

//gridsize
int gridSize = 42;

//player position
int x = 670;
int y = 0;

//check velocity
float velocityX;

//make world
FWorld world;

//player
FPlayer player;

//import map
PImage map;

//game objects
PImage ice;

//tree & leaves
PImage treeTrunk;
PImage leaf;
PImage leafLeft;
PImage leafRight;
PImage Intersection;

//dirt section
PImage grass;
PImage dirt;
PImage grassTopLeft;
PImage grassTopRight;
PImage grassBottomLeft;
PImage grassBottomRight;
PImage grassBottom;
PImage grassLeft;
PImage grassRight;

//spike
PImage spike;

//slime
PImage Slime;


//bridge
PImage bridge;
PImage bridgeLeft;
PImage bridgeRight;

//variables (keys)
boolean wKey, aKey, sKey, dKey;
boolean leftKey, rightKey, upKey, downKey;
boolean spaceKey;

//terrains + enemies
ArrayList<FGameObject> terrain;
ArrayList<FGameObject> enemies;

//character animations
PImage [] idle;
PImage [] jump;
PImage [] run;
PImage [] action;

//enemies
PImage[] goomba;

//lava
PImage[] lava;

void setup() {
  size(1000, 800, P2D);

  //frame rates
  frameRate(120);

  //arraylist
  terrain = new ArrayList<FGameObject>();
  enemies = new ArrayList<FGameObject>();

  //createWorld
  createWorld();

  //loading all the images
  loadImages();

  //loading the fisica world
  loadWorld();

  //loads the player
  loadPlayer();
}

void createWorld() {
  Fisica.init(this);
  world = new FWorld(-10000, -10000, 10000, 10000);
  world.setGravity(0, 500);
}


void loadImages() {
  //load images
  ice              = loadImage("blueBlock.png");

  //load leafs
  treeTrunk        = loadImage("tree_trunk.png");
  leaf             = loadImage("treetop_center.png");
  leafLeft         = loadImage("treetop_w.png");
  leafRight        = loadImage("treetop_e.png");
  Intersection     = loadImage("tree_intersect.png");

  //load ground
  grass            = loadImage("dirt_n.png");
  dirt             = loadImage("dirt_center.png");
  grassTopLeft     = loadImage("dirt_nw.png");
  grassTopRight    = loadImage("dirt_ne.png");
  grassBottomLeft  = loadImage("dirt_sw.png");
  grassBottomRight = loadImage("dirt_se.png");
  grassBottom      = loadImage("dirt_s.png");
  grassLeft        = loadImage("dirt_w.png");
  grassRight       = loadImage("dirt_e.png");

  //load spike
  spike            = loadImage("spike.png");

  //load slime
  Slime            = loadImage("slime.png");

  //bridges
  bridge           = loadImage("bridge_center.png");
  bridgeLeft       = loadImage("bridge_w.png");
  bridgeRight      = loadImage("bridge_e.png");

  //character actions
  idle = new PImage[2];
  idle[0] = loadImage("idle0.png");
  idle[1] = loadImage("idle1.png");

  jump = new PImage[1];
  jump[0] = loadImage("jump0.png");

  run = new PImage[3];
  run[0] = loadImage("runright0.png");
  run[1] = loadImage("runright1.png");
  run[2] = loadImage("runright2.png");
  
  //current action
  action = idle;
  
  
  //enemies
  goomba = new PImage[2];
  goomba[0] = loadImage("goomba0.png");
  goomba[1] = loadImage("goomba1.png");
  
  //lava
  lava = new PImage[6];
  lava[0] = loadImage("lava0.png");
  lava[1] = loadImage("lava1.png");
  lava[2] = loadImage("lava2.png");
  lava[3] = loadImage("lava3.png");
  lava[4] = loadImage("lava4.png");
  lava[5] = loadImage("lava5.png");
  


  //resizing all the images
  resizeImages();
}

void resizeImages() {
  //resize images
  ice.resize(gridSize, gridSize);

  //tree and leafs
  treeTrunk.resize(gridSize, gridSize);
  leaf.resize(gridSize, gridSize);
  leafLeft.resize(gridSize, gridSize);
  leafRight.resize(gridSize, gridSize);
  Intersection.resize(gridSize, gridSize);

  //grass and dirt
  grass.resize(gridSize, gridSize);
  dirt.resize(gridSize, gridSize);
  grassTopLeft.resize(gridSize, gridSize);
  grassTopRight.resize(gridSize, gridSize);
  grassBottomLeft.resize(gridSize, gridSize);
  grassBottomRight.resize(gridSize, gridSize);
  grassBottom.resize(gridSize, gridSize);
  grassLeft.resize(gridSize, gridSize);
  grassRight.resize(gridSize, gridSize);

  //spike
  spike.resize(gridSize, gridSize);

  //slime
  Slime.resize(gridSize, gridSize);

  //bridge
  bridge.resize(gridSize, gridSize);
  bridgeLeft.resize(gridSize, gridSize);
  bridgeRight.resize(gridSize, gridSize);

  //character animations
  //idle motions
  for (int i = 0; i < idle.length; i++) {
      idle[i].resize(gridSize, gridSize);
  }
  
  //run motions
  for (int i = 0; i < run.length; i++) {
    run[i].resize(gridSize, gridSize);
  }
  
  //jump motions
  jump[0].resize(gridSize, gridSize);
  
  //enemies
  for (int i = 0; i < goomba.length; i++) {
    goomba[i].resize(gridSize, gridSize);
  }
  
  //lava
  for (int i = 0; i < lava.length; i++) {
    lava[i].resize(gridSize, gridSize);
  }
}



void loadWorld() {

  //load image
  map = loadImage("map.png");

  //load map by pixels
  for (int y = 0; y < map.height; y++) {
    for (int x = 0; x < map.width; x++) {
      color c = map.get(x, y); //color of current pixel
      color n = map.get(x, y - 1); //color of the pixel up
      color s = map.get(x, y + 1); //color of pixel below
      color w = map.get(x - 1, y); //color of pixel to the left
      color e = map.get(x + 1, y); //color of pixel to the right

      //setting all to an FBox
      FBox b = new FBox(gridSize, gridSize);

      //grass
      if (c == black && n != black && w == black && e == black && n != grey && n != blue) {
        b.setStatic(true);
        b.setFillColor(c);
        b.setName("dirt");
        b.attachImage(grass);
        b.setFriction(2);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      } else if (c == black && s == black && w == black && e == black) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(dirt);

        world.add(b);
      } else if (c == black && n != black && w != grey && s == black && e == black) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(grassTopLeft);

        world.add(b);
      } else if (c == black && w != black && n == black && s == black) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(grassLeft);

        world.add(b);
      } else if (c == black && s != black && w == black && e == black) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(grassBottom);

        world.add(b);
      } else if (c == black && n == black && s != black && w != black && e == black) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(grassBottomLeft);

        world.add(b);
      } else if (c == black && n != black && s == black && w == black && e != grey) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(grassTopRight);

        world.add(b);
      } else if (c == black && n == black && s == black && w == black && e != black) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(grassRight);

        world.add(b);
      } else if (c == black && n == black && s != black && w == black && e != black) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(grassBottomRight);

        world.add(b);
      } else if (c == black && n != black && w == grey) {
        b.setStatic(true);
        b.setFillColor(c);
        b.setName("dirt");
        b.attachImage(grass);
        b.setFriction(2);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      } else if (c == black && n != black && e == grey) {
        b.setStatic(true);
        b.setFillColor(c);
        b.setName("dirt");
        b.attachImage(grass);
        b.setFriction(2);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      } else if (c == black && n != black && s != black && w != black && e != black) {
        b.setStatic(true);
        b.setFillColor(c);
        b.setName("dirt");
        b.attachImage(grass);
        b.setFriction(2);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      } 
      
      //dirt only for the ice block
      else if (c == black && n == blue && s == black) {
        b.setStatic(true);
        b.setFillColor(c);
        b.setName("dirt");
        b.attachImage(dirt);
        b.setFriction(2);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      }
      
      
      //bouncing walls (left)
      if (c == grey && w == black && e != black) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("wall");
        b.attachImage(grassTopRight);
        
        world.add(b);
      }
      
      //(right)
      else if (c == grey && w != black && e == black) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("wall");
        b.attachImage(grassTopLeft);
        
        world.add(b);
      }
      
      //lava blocks
      if (c == lavaColor) {
        FLava la = new FLava(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        
        //accessing arraylist
        terrain.add(la);
        world.add(la);
      }



      //ice blocks
      if (c == blue) {
        b.setStatic(true);
        b.setNoStroke();
        b.setFillColor(c);
        b.attachImage(ice);
        b.setName("ice");

        b.setFriction(0.002);
        b.setRestitution(0);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      }


      //leafs
      if (c == green && s == brown) { //intersection
        b.setStatic(true);
        b.setNoStroke();
        b.setSensor(true);
        b.setFillColor(c);
        b.attachImage(Intersection);
        b.setName("leaf");

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      } else if (c == green && w == green && e == green) { //middle piece
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(leaf);
        b.setName("leaf");
        world.add(b);
      } else if (c == green && w != green) { //left end
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(leafLeft);
        b.setName("leaf");
        world.add(b);
      } else if (c == green && e != green) { //right end
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(leafRight);
        b.setName("leaf");
        world.add(b);
      }

      //tree trunk
      if (c == brown) {
        b.setStatic(true);
        b.setNoStroke();
        b.setSensor(true);
        b.setFillColor(c);
        b.attachImage(treeTrunk);
        b.setName("tree");

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      }

      //spikes
      if (c == darkBlue) {
        b.setStatic(true);
        b.setNoStroke();
        b.setFillColor(c);
        b.attachImage(spike);
        b.setName("spike");

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2 + 15);
        world.add(b);
      }

      //slime
      if (c == slime) {
        b.setStatic(true);
        b.setNoStroke();
        b.setFillColor(c);
        b.attachImage(Slime);
        b.setName("slime");

        b.setRestitution(2);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      }
      
      //bridge
      if (c == cyan && w == black && e == cyan) {
        FBridge br = new FBridge(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2, bridge);
        terrain.add(br);
        world.add(br);
      } else if (c == cyan && w == cyan && e == black) {
        FBridge br = new FBridge(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2, bridge);
        terrain.add(br);
        world.add(br);
      } else if (c == cyan) {
        FBridge br = new FBridge(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2, bridge);
        terrain.add(br);
        world.add(br);
      }
      
      if (c == yellow) {
        FGoomba gmb = new FGoomba(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        
        enemies.add(gmb);
        world.add(gmb);
      }
    }
  }
}

void draw() {
  background(255);
  
  //drawing the world
  drawWorld();
  
  //displaying the act functions for all class
  actWorld();

}

void drawWorld() {
  //drawing the world
  pushMatrix();
  translate(-player.getX() + width / 2, -player.getY() + height / 2);
  world.step();
  world.draw();

  popMatrix();
}

void actWorld() {
  //player movements
  player.act();
  
  //terrain behaviours
  for (int i = 0; i < terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.act();
  }
  
  //enemies behaviours
  for (int i = 0; i < enemies.size(); i++) {
    FGameObject e = enemies.get(i);
    e.act();
  }
  
}

void loadPlayer() {
  player = new FPlayer(x, y, red);
  world.add(player);
}
