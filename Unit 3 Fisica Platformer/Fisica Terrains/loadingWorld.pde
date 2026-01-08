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
      
      //goomba
      if (c == yellow) {
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
