void loadImages() {
  //load images
  backgroundImageTrees = loadImage("bg_1.png");
  backgroundImageShadows = loadImage("background.png");
  backgroundImageBlur = loadImage("bg_0.png");
  backgroundImageFront = loadImage("bg_2.png");

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

  //corners
  cornerRight = loadImage("cornerRight.png");
  cornerLeft = loadImage("cornerLeft.png");
  cornerBottomRight = loadImage("cornerBottomRight.png");
  cornerBottomLeft = loadImage("cornerBottomLeft.png");

  //load spike
  spike            = loadImage("spike.png");

  //load slime
  Slime            = loadImage("slime.png");

  //bridges
  bridge           = loadImage("bridge_center.png");
  bridgeLeft       = loadImage("bridge_w.png");
  bridgeRight      = loadImage("bridge_e.png");
  
  //door 
  levelDoor = loadImage("door.png");
  
  //coin
  coin = new PImage[6];
  coin[0] = loadImage("coin1.png");
  coin[1] = loadImage("coin2.png");
  coin[2] = loadImage("coin3.png");
  coin[3] = loadImage("coin4.png");
  coin[4] = loadImage("coin5.png");
  coin[5] = loadImage("coin6.png");

  //character actions
  idle = new PImage[4];
  idle[0] = loadImage("idle1.png");
  idle[1] = loadImage("idle2.png");
  idle[2] = loadImage("idle3.png");
  idle[3] = loadImage("idle4.png");

  jumpingUp = new PImage[3];
  jumpingUp[0] = loadImage("jumpu1.png");
  jumpingUp[1] = loadImage("jumpu2.png");
  jumpingUp[2] = loadImage("jumpu3.png");


  jumpingDown = new PImage[3];
  jumpingDown[0] = loadImage("jump1.png");
  jumpingDown[1] = loadImage("jump2.png");
  jumpingDown[2] = loadImage("jump3.png");

  doubleJump = new PImage[3];
  doubleJump[0] = loadImage("doubleJump1.png");
  doubleJump[1] = loadImage("doubleJump2.png");
  doubleJump[2] = loadImage("doubleJump3.png");


  run = new PImage[5];
  run[0] = loadImage("run1.png");
  run[1] = loadImage("run2.png");
  run[2] = loadImage("run3.png");
  run[3] = loadImage("run4.png");
  run[4] = loadImage("run5.png");

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

  //hammer bro
  HammerBro = new PImage[2];
  HammerBro[0] = loadImage("hammerbro0.png");
  HammerBro[1] = loadImage("hammerbro1.png");

  //weapon
  Hammer = loadImage("hammer.png");


  //resizing all the images
  resizeImages();
}
