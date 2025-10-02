// Lawrence Mo
// Button Modes
// Sept 29th, 2025

color blue   = #A7DAFF;
color red    = #F75F76;
color green  = #92F74B;
color purple = #CB7EFF;


//button variables
Button myButton;
Button myButton2;
Button myButton3;
Button myButton4;


void setup() {
  size(800, 800);
  
  //classifying each button
  myButton = new Button("BLUE", width - 280, 305, 370, 370, 255, blue);
  myButton2 = new Button("RED", 170, height - 595, 170, 170, 255, red);
  myButton3 = new Button("GREEN", 170, height - 395, 170, 170, 255, green);
  myButton4 = new Button("PURPLE", width / 2, height - 150, 650, 170, 255, purple);
}



void draw() {
  //buttons being clicked
  myButton.clicked();
  myButton2.clicked();
  myButton3.clicked();
  myButton4.clicked();
  
  background(255);
  
  //button clicks --> Background colour
  if (myButton.clicked) background(blue);
  if (myButton2.clicked) background(red);
  if (myButton3.clicked) background(green);
  if (myButton4.clicked) background(purple);
  
  //buttons being shown
  myButton.show();
  myButton2.show();
  myButton3.show();
  myButton4.show();
  
   
}
