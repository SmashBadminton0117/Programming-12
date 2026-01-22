void loadWorld() {

  //load image
  if (levelMode == firstLevel) {
    map = loadImage("map1.png");
  } else if (levelMode == secondLevel) {
    map = loadImage("map2.png");
  } else if (levelMode == thirdLevel) {
    map = loadImage("map3.png");
  }

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
      b.setGrabbable(false);
      b.setStatic(true);

      //grass
      if (c == grassColour && n != grassColour && w == grassColour && e == grassColour && n != WallColour && n != iceColour) {
        b.setFillColor(c);
        b.setName("dirt");
        b.attachImage(grass);
        b.setFriction(2);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      } else if (c == grassColour && s == grassColour && w == grassColour && e == grassColour) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setName("dirt");
        b.attachImage(dirt);

        world.add(b);
      } else if (c == grassColour && n != grassColour && w != WallColour && s == grassColour && e == grassColour) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setName("dirt");
        b.attachImage(grassTopLeft);

        world.add(b);
      } else if (c == grassColour && w != grassColour && n == grassColour && s == grassColour) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setName("dirt");
        b.attachImage(grassLeft);

        world.add(b);
      } else if (c == grassColour && s != grassColour && w == grassColour && e == grassColour) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setName("dirt");
        b.attachImage(grassBottom);

        world.add(b);
      } else if (c == grassColour && n == grassColour && s != grassColour && w != grassColour && e == grassColour && s != WallColour) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setName("dirt");
        b.attachImage(grassBottomLeft);

        world.add(b);
      } else if (c == grassColour && n != grassColour && s == grassColour && w == grassColour && e != WallColour) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setName("dirt");
        b.attachImage(grassTopRight);

        world.add(b);
      } else if (c == grassColour && n == grassColour && s == grassColour && w == grassColour && e != grassColour) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setName("dirt");
        b.attachImage(grassRight);

        world.add(b);
      } else if (c == grassColour && n == grassColour && s != grassColour && w == grassColour && e != grassColour) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setName("dirt");
        b.attachImage(grassBottomRight);

        world.add(b);
      } else if (c == grassColour && n != grassColour && w == WallColour) {
        b.setFillColor(c);
        b.setName("dirt");
        b.attachImage(grass);
        b.setFriction(2);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      } else if (c == grassColour && n != grassColour && e == WallColour) {
        b.setFillColor(c);
        b.setName("dirt");
        b.attachImage(grass);
        b.setFriction(2);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      } else if (c == grassColour && n != grassColour && s != grassColour && w != grassColour && e != grassColour) {
        b.setFillColor(c);
        b.setName("dirt");
        b.attachImage(grass);
        b.setFriction(2);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      } else if (c == grassColour && n == grassColour && s == WallColour && w != grassColour && e == grassColour) {
        b.setFillColor(c);
        b.setName("grass");
        b.attachImage(grassLeft);
        b.setFriction(2);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      }

      //dirt only for the ice block
      else if (c == grassColour && n == iceColour && s == grassColour) {
        b.setFillColor(c);
        b.setName("dirt");
        b.attachImage(dirt);
        b.setFriction(2);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      }


      //top right of wall
      else if (c == grassColour && n != grassColour && s == WallColour && w == grassColour && e != grassColour) {
        b.setFillColor(c);
        b.setName("wall");
        b.attachImage(grassTopRight);
        b.setFriction(2);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      }

      //top left of wall
      else if (c == grassColour && n != grassColour && s == WallColour && w != grassColour && e == grassColour) {
        b.setFillColor(c);
        b.setName("wall");
        b.attachImage(grassTopLeft);
        b.setFriction(2);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      }

      //dirt only for the ice block
      else if (c == grassColour && n == iceColour && s == grassColour) {
        b.setFillColor(c);
        b.setName("dirt");
        b.attachImage(dirt);
        b.setFriction(2);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      }

      //bouncing walls (left)
      if (c == WallColour && w == grassColour && e != grassColour) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setName("wall");
        b.attachImage(grassRight);

        world.add(b);
      }

      //(right)
      else if (c == WallColour && w != grassColour && e == grassColour) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setName("wall");
        b.attachImage(grassLeft);

        world.add(b);
      }


      //dirt for walls
      else if (c == grassColour && n == grassColour && s == grassColour && w == WallColour && e == grassColour) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setName("dirt");
        b.attachImage(dirt);

        world.add(b);
      }

      //dirt for walls
      else if (c == grassColour && n == grassColour && s == grassColour && w == grassColour && e == WallColour) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setName("dirt");
        b.attachImage(dirt);

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
      if (c == iceColour) {
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
      if (c == treeColour && s == trunkColour) { //intersection
        b.setNoStroke();
        b.setSensor(true);
        b.setFillColor(c);
        b.attachImage(Intersection);
        b.setName("leaf");

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      } else if (c == treeColour && w == treeColour && e == treeColour) { //middle piece
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setSensor(true);
        b.attachImage(leaf);
        b.setName("leaf");
        world.add(b);
      } else if (c == treeColour && w != treeColour) { //left end
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setSensor(true);
        b.attachImage(leafLeft);
        b.setName("leaf");
        world.add(b);
      } else if (c == treeColour && e != treeColour) { //right end
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setSensor(true);
        b.attachImage(leafRight);
        b.setName("leaf");
        world.add(b);
      }

      //tree trunk
      if (c == trunkColour) {
        b.setNoStroke();
        b.setSensor(true);
        b.setFillColor(c);
        b.attachImage(treeTrunk);
        b.setName("tree");

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      }

      //spikes
      if (c == spikesColour) {
        b.setNoStroke();
        b.setFillColor(c);
        b.attachImage(spike);
        b.setSensor(true);
        b.setName("spike");

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      }

      //slime
      if (c == slimeColour) {
        b.setNoStroke();
        b.setFillColor(c);
        b.attachImage(Slime);
        b.setName("slime");

        b.setRestitution(2);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      }

      //bridge
      if (c == bridgeColour && w == grassColour && e == bridgeColour) {
        FBridge br = new FBridge(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2, bridge);
        terrain.add(br);
        world.add(br);
      } else if (c == bridgeColour && w == bridgeColour && e == grassColour) {
        FBridge br = new FBridge(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2, bridge);
        terrain.add(br);
        world.add(br);
      } else if (c == bridgeColour) {
        FBridge br = new FBridge(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2, bridge);
        terrain.add(br);
        world.add(br);
      }

      //door
      if (c == doorColour) {
        FDoor dr = new FDoor(x * gridSize + gridSize / 2, y * gridSize + gridSize);
        
        terrain.add(dr);
        world.add(dr);
      }

      //vase
      if (c == vaseColour) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setSensor(true);
        b.setName("vase");

        b.attachImage(vase);

        world.add(b);
      }


      //spike trap
      if (c == spikesTrapColour) {
        FSpikesTrap st = new FSpikesTrap(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);

        enemies.add(st);
        world.add(st);
      }

      //grass prop
      if (c == grassPropColour) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setSensor(true);
        b.setName("grassProp");

        b.attachImage(grassProp);

        world.add(b);
      }

      //flower
      if (c == flowerColour) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setSensor(true);
        b.setName("flower");

        b.attachImage(flower);

        world.add(b);
      }

      //arrow
      if (c == arrowColour) {
        b.setPosition(x * gridSize + gridSize, y * gridSize + gridSize);
        b.setSensor(true);
        b.setName("arrow");

        b.attachImage(arrow);

        world.add(b);
      }


      //coin
      if (c == coinColour) {
        FCoin cn = new FCoin(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(cn);
        terrain.add(cn);
      }

      //goomba
      if (c == goombaColour) {
        FGoomba gmb = new FGoomba(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);

        enemies.add(gmb);
        world.add(gmb);
      }

      //Thwomp
      if (c == thwomp) {
        FThwomp twp = new FThwomp(x * gridSize + (gridSize * 2) / 2, y * gridSize + (gridSize * 2) / 2);

        enemies.add(twp);
        world.add(twp);
      }

      if (c == woodenTrapColour) {
        FWoodenTrap wdt = new FWoodenTrap(x * gridSize + gridSize / 2, y * gridSize + gridSize * 3);

        enemies.add(wdt);
        world.add(wdt);
      }

      //torch
      if (c == torchColour) {
        FTorch tr = new FTorch(x * gridSize + gridSize / 2, y * gridSize);

        terrain.add(tr);
        world.add(tr);
      }

      //strange door
      if (c == strangeDoorColour) {
        FStrangeDoor sd = new FStrangeDoor(x * gridSize + gridSize, y * gridSize + gridSize * 3);

        terrain.add(sd);
        world.add(sd);
      }

      //button
      if (c == buttonColour) {
        FButton bn = new FButton(x * gridSize + gridSize / 2, y * gridSize + gridSize - 7);

        world.add(bn);
        terrain.add(bn);
      }

      //stone
      if (c == stoneColour) {
        FBox stoneBlock = new FBox(gridSize + gridSize / 2, gridSize + gridSize / 2);

        //parameters
        stoneBlock.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        stoneBlock.setRotatable(false);
        stoneBlock.setGrabbable(false);
        stoneBlock.setSensor(false);

        //name
        stoneBlock.setName("stone");

        //image
        stoneBlock.attachImage(stone);

        world.add(stoneBlock);
      }
    }
  }
}
