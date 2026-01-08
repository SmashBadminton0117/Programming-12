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
  
  //thwomp
  Thwomp = new PImage[2];
  Thwomp[0] = loadImage("thwomp0.png");
  Thwomp[1] = loadImage("thwomp1.png");
  


  //resizing all the images
  resizeImages();
}
