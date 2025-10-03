void animatedGIFSetup() {
  //animated gif:
  numberOfFrames = 29;
  gif = new PImage[numberOfFrames];

  int i = 0;
  while (i < numberOfFrames) {
    gif[i] = loadImage("frame_"+i+"_delay-0.1s.gif");
    i++;
  }
}

void introductionTitle(int s) {
  
  pushMatrix();
  translate(width / 2, 200);
  scale(s);
  fill(#00FFFF);
  textFont(SuperTrend);
  textAlign(CENTER, CENTER);
  text("COLOUR\nMEMORY", 0, 25);
  
  scale(0.2);
  text("(CLICK ANYWHERE TO START)", 0, 1100);
  popMatrix();
  
}

void runGIFDraw() {
  //runs the GIF to be animated
  image(gif[f], 0, 0, width, height);
  f++;
  if (f == numberOfFrames) f = 0;
}
