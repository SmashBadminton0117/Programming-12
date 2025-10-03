class Gif {
  //PImage array
  PImage[] cryingEmoteGIF;
  
  //number of image per frame
  int numberOfFrames;
  
  int speedOfTheImage;
  int currentFrameImage;
  
  //position of the image
  float x, y, w, h; 
  
  Gif(String firstSetOfName, String secondSetOfName, int n, int s, float _x, float _y) {
    numberOfFrames = n;
    speedOfTheImage = s;
    currentFrameImage = 0;
    x = _x;
    y = _y;
    
    //image array list
    cryingEmoteGIF = new PImage[n];
    
    int i = 0;
    while ( i < numberOfFrames ) {
      cryingEmoteGIF[i] = loadImage(firstSetOfName + i + secondSetOfName);
      i++;
    }
    
    w = cryingEmoteGIF[0].width;
    h = cryingEmoteGIF[0].height;
  }
  
  Gif(String firstSetOfName, String secondSetOfName, int n, int s, float _x, float _y, float _w, float _h) {
    this(firstSetOfName, secondSetOfName, n, s, _x, _y);
    w = _w;
    h = _h;
  }
  
  void show() {
    if ( currentFrameImage == numberOfFrames ) currentFrameImage = 0;
    image(cryingEmoteGIF[currentFrameImage], x, y, w, h);
    if ( frameCount % speedOfTheImage == 0) currentFrameImage++;
  }
  
}
