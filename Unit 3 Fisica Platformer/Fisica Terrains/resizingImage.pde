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
  spike.resize(gridSize, gridSize - 20);

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
  
  //thwomp
  for (int i = 0; i < Thwomp.length; i++) {
    Thwomp[i].resize(gridSize * 2, gridSize * 2);
  }
}
