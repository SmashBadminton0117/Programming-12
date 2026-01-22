void loadImages() {
  //load images
  backgroundImageTrees = loadImage("bg_1.png");
  backgroundImageShadows = loadImage("background.png");
  backgroundImageBlur = loadImage("bg_0.png");
  backgroundImageFront = loadImage("bg_2.png");

  //prop
  vase = loadImage("vase.png");
  grassProp = loadImage("grassProp.png");
  flower = loadImage("flower.png");
  arrow = loadImage("arrow.png");
  
  //ice
  ice              = loadImage("blueBlock.png");
  
  //buttons
  button = new PImage[2];
  button[0] = loadImage("button.png");
  button[1] = loadImage("buttonPressed.png");

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
  
  //stone
  stone = loadImage("stone.png");

  //coin
  coin = new PImage[6];
  coin[0] = loadImage("coin1.png");
  coin[1] = loadImage("coin2.png");
  coin[2] = loadImage("coin3.png");
  coin[3] = loadImage("coin4.png");
  coin[4] = loadImage("coin5.png");
  coin[5] = loadImage("coin6.png");
  
  coinPickUp = new PImage[6];
  coinPickUp[0] = loadImage("coinPick1.png");
  coinPickUp[1] = loadImage("coinPick2.png");
  coinPickUp[2] = loadImage("coinPick3.png");
  coinPickUp[3] = loadImage("coinPick4.png");
  coinPickUp[4] = loadImage("coinPick5.png");
  coinPickUp[5] = loadImage("coinPick6.png");

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
  
  
  //wooden hammer
  woodenTrap = new PImage[18];
  woodenTrap[0]  = loadImage("WoodenTrap1.png");
  woodenTrap[1]  = loadImage("WoodenTrap2.png");
  woodenTrap[2]  = loadImage("WoodenTrap3.png");
  woodenTrap[3]  = loadImage("WoodenTrap4.png");
  woodenTrap[4]  = loadImage("WoodenTrap5.png");
  woodenTrap[5]  = loadImage("WoodenTrap6.png");
  woodenTrap[6]  = loadImage("WoodenTrap7.png");
  woodenTrap[7]  = loadImage("WoodenTrap8.png");
  woodenTrap[8]  = loadImage("WoodenTrap9.png");
  woodenTrap[9]  = loadImage("WoodenTrap10.png");
  woodenTrap[10] = loadImage("WoodenTrap11.png");
  woodenTrap[11] = loadImage("WoodenTrap12.png");
  woodenTrap[12] = loadImage("WoodenTrap13.png");
  woodenTrap[13] = loadImage("WoodenTrap14.png");
  woodenTrap[14] = loadImage("WoodenTrap15.png");
  woodenTrap[15] = loadImage("WoodenTrap16.png");
  woodenTrap[16] = loadImage("WoodenTrap17.png");
  woodenTrap[17] = loadImage("WoodenTrap18.png");
  
  //spikes trap
  spikesTrap = new PImage[8];
  spikesTrap[0] = loadImage("spikesTrap1.png");
  spikesTrap[1] = loadImage("spikesTrap2.png");
  spikesTrap[2] = loadImage("spikesTrap3.png");
  spikesTrap[3] = loadImage("spikesTrap4.png");
  spikesTrap[4] = loadImage("spikesTrap5.png");
  spikesTrap[5] = loadImage("spikesTrap6.png");
  spikesTrap[6] = loadImage("spikesTrap7.png");
  spikesTrap[7] = loadImage("spikesTrap8.png");
  
  //strange door
  strangeDoor = new PImage[10];
  strangeDoor[0] = loadImage("strangeDoor1.png");
  strangeDoor[1] = loadImage("strangeDoor2.png");
  strangeDoor[2] = loadImage("strangeDoor3.png");
  strangeDoor[3] = loadImage("strangeDoor4.png");
  strangeDoor[4] = loadImage("strangeDoor5.png");
  strangeDoor[5] = loadImage("strangeDoor6.png");
  strangeDoor[6] = loadImage("strangeDoor7.png");
  strangeDoor[7] = loadImage("strangeDoor8.png");
  strangeDoor[8] = loadImage("strangeDoor9.png");
  strangeDoor[9] = loadImage("strangeDoor10.png");
  
  strangeDoorOpening = new PImage[12];
  strangeDoorOpening[0] = loadImage("doorOpening1.png");
  strangeDoorOpening[1] = loadImage("doorOpening2.png");
  strangeDoorOpening[2] = loadImage("doorOpening3.png");
  strangeDoorOpening[3] = loadImage("doorOpening4.png");
  strangeDoorOpening[4] = loadImage("doorOpening5.png");
  strangeDoorOpening[5] = loadImage("doorOpening6.png");
  strangeDoorOpening[6] = loadImage("doorOpening7.png");
  strangeDoorOpening[7] = loadImage("doorOpening8.png");
  strangeDoorOpening[8] = loadImage("doorOpening9.png");
  strangeDoorOpening[9] = loadImage("doorOpening10.png");
  strangeDoorOpening[10] = loadImage("doorOpening11.png");
  strangeDoorOpening[11] = loadImage("doorOpening12.png");
  
  //torch
  torch = new PImage[12];
  torch[0] = loadImage("torch1.png");
  torch[1] = loadImage("torch2.png");
  torch[2] = loadImage("torch3.png");
  torch[3] = loadImage("torch4.png");
  torch[4] = loadImage("torch5.png");
  torch[5] = loadImage("torch6.png");
  torch[6] = loadImage("torch7.png");
  torch[7] = loadImage("torch8.png");
  torch[8] = loadImage("torch9.png");
  torch[9] = loadImage("torch10.png");
  torch[10] = loadImage("torch11.png");
  torch[11] = loadImage("torch12.png");

  //resizing all the images
  resizeImages();
}
