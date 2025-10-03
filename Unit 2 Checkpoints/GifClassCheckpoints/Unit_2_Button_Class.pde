// Lawrence Mo
// Button Modes
// Sept 29th, 2025

color blue   = #A7DAFF;
color red    = #F75F76;
color green  = #92F74B;
color purple = #CB7EFF;

int backgroundColour;

//button variables
Button[] myButton;

Gif cryingEmoteGIF;

void setup() {
  size(800, 800);
  
  //backgroundColour related to the bkg
  backgroundColour = 255;
  
  //the 4 buttons
  myButton = new Button[4];
  
  //loading the image
  PImage cryingEmote = loadImage("cryingEmote.png");
  
  //gif setup / loading the gif
  cryingEmoteGIF = new Gif("frame_" , "_delay-0.1s.gif", 9, 5, width - 280, 305, 300, 300);

  //classifying each button

  myButton[0] = new Button(cryingEmoteGIF, width - 280, 305, 370, 370, 255, blue);
  myButton[1] = new Button(cryingEmote, 170, height - 595, 170, 170, 255, red);
  myButton[2] = new Button("GREEN", 170, height - 395, 170, 170, 255, green);
  myButton[3] = new Button("PURPLE", width / 2, height - 150, 650, 170, 255, purple);
}



void draw() {

  background(backgroundColour);

  //buttons being clicked
  int i = 0;
  while ( i < 4 ) {
    myButton[i].clicked();
    i++;
  }
  

  //buttons being shown
  i = 0;
  while ( i < 4 ) {
    myButton[i].show();
    if ( myButton[i].clicked ) {
      backgroundColour = myButton[i].normal;
    }
    i++;
  }
  

  //button clicks --> Background colour
  if (myButton[0].clicked) backgroundColour = blue;
  if (myButton[1].clicked) backgroundColour = red;
  if (myButton[2].clicked) backgroundColour = green;
  if (myButton[3].clicked) backgroundColour = purple;
}
