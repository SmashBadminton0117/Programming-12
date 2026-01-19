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
      if (c == grassColour && n != grassColour && w == grassColour && e == grassColour && n != WallColour && n != iceColour) {
        b.setStatic(true);
        b.setFillColor(c);
        b.setName("dirt");
        b.attachImage(grass);
        b.setFriction(2);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      } else if (c == grassColour && s == grassColour && w == grassColour && e == grassColour) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(dirt);

        world.add(b);
      } else if (c == grassColour && n != grassColour && w != WallColour && s == grassColour && e == grassColour) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(grassTopLeft);

        world.add(b);
      } else if (c == grassColour && w != grassColour && n == grassColour && s == grassColour) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(grassLeft);

        world.add(b);
      } else if (c == grassColour && s != grassColour && w == grassColour && e == grassColour) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(grassBottom);

        world.add(b);
      } else if (c == grassColour && n == grassColour && s != grassColour && w != grassColour && e == grassColour) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(grassBottomLeft);

        world.add(b);
      } else if (c == grassColour && n != grassColour && s == grassColour && w == grassColour && e != WallColour) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(grassTopRight);

        world.add(b);
      } else if (c == grassColour && n == grassColour && s == grassColour && w == grassColour && e != grassColour) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(grassRight);

        world.add(b);
      } else if (c == grassColour && n == grassColour && s != grassColour && w == grassColour && e != grassColour) {
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setName("dirt");
        b.attachImage(grassBottomRight);

        world.add(b);
      } else if (c == grassColour && n != grassColour && w == WallColour) {
        b.setStatic(true);
        b.setFillColor(c);
        b.setName("dirt");
        b.attachImage(grass);
        b.setFriction(2);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      } else if (c == grassColour && n != grassColour && e == WallColour) {
        b.setStatic(true);
        b.setFillColor(c);
        b.setName("dirt");
        b.attachImage(grass);
        b.setFriction(2);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      } else if (c == grassColour && n != grassColour && s != grassColour && w != grassColour && e != grassColour) {
        b.setStatic(true);
        b.setFillColor(c);
        b.setName("dirt");
        b.attachImage(grass);
        b.setFriction(2);

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      }

      //dirt only for the ice block
      else if (c == grassColour && n == iceColour && s == grassColour) {
        b.setStatic(true);
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
        b.setStatic(true);
        b.setName("wall");
        b.attachImage(grassTopRight);

        world.add(b);
      }

      //(right)
      else if (c == WallColour && w != grassColour && e == grassColour) {
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
      if (c == iceColour) {
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
      if (c == treeColour && s == trunkColour) { //intersection
        b.setStatic(true);
        b.setNoStroke();
        b.setSensor(true);
        b.setFillColor(c);
        b.attachImage(Intersection);
        b.setName("leaf");

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        world.add(b);
      } else if (c == treeColour && w == treeColour && e == treeColour) { //middle piece
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(leaf);
        b.setName("leaf");
        world.add(b);
      } else if (c == treeColour && w != treeColour) { //left end
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(leafLeft);
        b.setName("leaf");
        world.add(b);
      } else if (c == treeColour && e != treeColour) { //right end
        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(leafRight);
        b.setName("leaf");
        world.add(b);
      }

      //tree trunk
      if (c == trunkColour) {
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
      if (c == spikeColour) {
        b.setStatic(true);
        b.setNoStroke();
        b.setFillColor(c);
        b.attachImage(spike);
        b.setName("spike");

        b.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize / 2 + 15);
        world.add(b);
      }

      //slime
      if (c == slimeColour) {
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
        FBox dr = new FBox(gridSize, gridSize * 2);
        dr.setPosition(x * gridSize + gridSize / 2, y * gridSize + gridSize);
        dr.setStatic(true);
        dr.setSensor(true);
        dr.setName("door");
        dr.attachImage(levelDoor);

        world.add(dr);
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
    }
  }
}
