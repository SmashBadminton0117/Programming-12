void createLane() {
  //create the lane
  FBox rightLanePosition = new FBox(wallWidth, heightBottom);

  //lane variables
  rightLanePosition.setPosition(wallX - 16, bottom + heightBottom / 2);

  rightLanePosition.setStatic(true);
  rightLanePosition.setGrabbable(false);
  rightLanePosition.setFill(150);
  rightLanePosition.setNoStroke();
  world.add(rightLanePosition);
}




void gameLayerDots() {
  //variables
  int spacing = 80;
  int radius  = 8;

  //amount of columns + rows
  int cols = 8;
  int rows = 7;

  //coords
  float x, y;


  //initial column
  int initialColumn = 0;
  while (initialColumn < cols) {

    int initialRow = 0;
    while (initialRow < rows) {

      //values
      x = 70 + initialColumn * spacing;
      y = 200 + initialRow * spacing;

      //values of the dots
      FCircle dot = new FCircle(radius);
      dot.setPosition(x, y);
      dot.setGrabbable(false);
      dot.setFill(0);
      dot.setStatic(true);
      dot.setNoStroke();
      world.add(dot);

      initialRow++;
    }
    initialColumn++;
  }
}


void drawBorders() {
  //top wall
  FBox top = new FBox(width, 10);

  top.setGrabbable(false);

  top.setPosition(width / 2, 5);
  top.setStatic(true);
  top.setFill(150);
  top.setNoStroke();
  world.add(top);

  //bottom wall
  FBox bottom = new FBox(width, 10);

  bottom.setGrabbable(false);

  bottom.setPosition(width / 2, height - 5);
  bottom.setStatic(true);
  bottom.setFill(150);
  bottom.setNoStroke();
  world.add(bottom);

  //left wall
  FBox left = new FBox(10, height);

  left.setGrabbable(false);

  left.setPosition(2, height / 2);
  left.setStatic(true);
  left.setFill(150);
  left.setNoStroke();
  world.add(left);

  //right wall
  FBox right = new FBox(10, height);

  right.setGrabbable(false);

  right.setPosition(width - 2, height / 2);
  right.setStatic(true);
  right.setFill(150);
  right.setNoStroke();
  world.add(right);
}


void drawDividers() {
  //variables
  int dividerCount;
  float spacing;

  //initializing
  dividerCount = 9;
  spacing = width / dividerCount;


  //loop to draw
  for (int i = 1; i < dividerCount; i++) {
    FBox divider = new FBox(10, 120);

    //variables
    divider.setGrabbable(false);
    divider.setPosition(i * spacing, height - 65);
    divider.setStatic(true);
    divider.setFill(150);
    divider.setNoStroke();
    world.add(divider);
  }
}



void platformLayer() {
  FCompound outerLayer = new FCompound();

  //set it to not move
  outerLayer.setGrabbable(false);
  outerLayer.setStatic(true);

  //top left
  boardLayerTopLeft = new FPoly();

  boardLayerTopLeft.vertex(0, 200);
  boardLayerTopLeft.vertex(0, 0);
  boardLayerTopLeft.vertex(200, 0);

  //edges
  boardLayerTopLeft.vertex(150, 30);
  boardLayerTopLeft.vertex(110, 70);
  boardLayerTopLeft.vertex(70, 110);
  boardLayerTopLeft.vertex(30, 150);

  //set values
  boardLayerTopLeft.setFill(150);
  boardLayerTopLeft.setNoStroke();

  //adding body
  outerLayer.addBody(boardLayerTopLeft);

  //top right
  boardLayerTopRight = new FPoly();

  boardLayerTopRight.vertex(800, 200);
  boardLayerTopRight.vertex(800, 0);
  boardLayerTopRight.vertex(600, 0);

  //edges
  boardLayerTopRight.vertex(650, 30);
  boardLayerTopRight.vertex(690, 70);
  boardLayerTopRight.vertex(730, 110);
  boardLayerTopRight.vertex(770, 150);

  //setting values
  boardLayerTopRight.setFill(150);
  boardLayerTopRight.setNoStroke();

  //adding bodies
  outerLayer.addBody(boardLayerTopRight);

  //add to the world
  world.add(outerLayer);
}
