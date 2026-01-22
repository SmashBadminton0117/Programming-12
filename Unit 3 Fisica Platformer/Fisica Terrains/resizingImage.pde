void resizeImages() {
  //resize images
  backgroundImageTrees.resize(width + 215, height);
  backgroundImageShadows.resize(width + 215, height);
  backgroundImageBlur.resize(width + 215, height);
  backgroundImageFront.resize(width + 215, height);
  
  //prop
  vase.resize(gridSize, gridSize);
  grassProp.resize(gridSize, gridSize);
  flower.resize(gridSize, gridSize);
  arrow.resize(gridSize * 2, gridSize * 2);
  
  //ice
  ice.resize(gridSize, gridSize);
  
  //button
  for (int i = 0; i < button.length; i++) {
    button[i].resize(gridSize * 2, gridSize / 2 - 5);
  }
  
  //stone
  stone.resize(gridSize + gridSize / 2, gridSize + gridSize / 2);

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
  
  //corners
  cornerRight.resize(gridSize, gridSize);
  cornerLeft.resize(gridSize, gridSize);
  cornerBottomRight.resize(gridSize, gridSize);
  cornerBottomLeft.resize(gridSize, gridSize);

  //spike
  spike.resize(gridSize, gridSize);

  //slime
  Slime.resize(gridSize, gridSize);

  //bridge
  bridge.resize(gridSize, gridSize);
  bridgeLeft.resize(gridSize, gridSize);
  bridgeRight.resize(gridSize, gridSize);
  
  //door
  levelDoor.resize(gridSize * 2, gridSize * 2);
  
  //coin
  for (int i = 0; i < coin.length; i++) {
    coin[i].resize(gridSize / 2 + 5, gridSize / 2 + 5);
  }
  
  //coin pick up
  for (int i = 0; i < coinPickUp.length; i++) {
    coinPickUp[i].resize(gridSize / 2 + 15, gridSize / 2 + 15);
  }

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
  for (int i = 0; i < jumpingUp.length; i++) {
    jumpingUp[i].resize(gridSize, gridSize);
  }

  for (int i = 0; i < jumpingDown.length; i++) {
    jumpingDown[i].resize(gridSize, gridSize);
  }
  
  for (int i = 0; i < doubleJump.length; i++) {
    doubleJump[i].resize(gridSize, gridSize);
  }

  //enemies
  for (int i = 0; i < goomba.length; i++) {
    goomba[i].resize(gridSize, gridSize);
  }

  //lava
  for (int i = 0; i < lava.length; i++) {
    lava[i].resize(gridSize, gridSize);
  }

  //thwomp
  for (int i = 0; i < Thwomp.length; i++) {
    Thwomp[i].resize(gridSize * 2, gridSize * 2);
  }

  //hammerbro
  for (int i = 0; i < HammerBro.length; i++) {
    HammerBro[i].resize(gridSize * 2, gridSize * 2);
  }

  //weapon
  Hammer.resize(gridSize + 20, gridSize + 20);
  
  
  //wooden trap
  for (int i = 0; i < woodenTrap.length; i++) {
    woodenTrap[i].resize(gridSize * 7, gridSize * 6);
  }
  
  //torch
  for (int i = 0; i < torch.length; i++) {
    torch[i].resize(gridSize, gridSize * 2);
  }
  
  //spikes trap
  for (int i = 1; i < spikesTrap.length; i++) {
    spikesTrap[0].resize(gridSize, gridSize);
    spikesTrap[i].resize(gridSize, gridSize);
  }
  
  //strange door
  for (int i = 0; i < strangeDoor.length; i++) {
    strangeDoor[i].resize(gridSize * 2, gridSize * 6);
  }
  
  for (int i = 0; i < strangeDoorOpening.length; i++) {
    strangeDoorOpening[i].resize(gridSize * 2, gridSize * 6);
  }
}
