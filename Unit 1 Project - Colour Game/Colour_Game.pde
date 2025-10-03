import processing.sound.*;

// Lawrence Mo
// Sept 15th, 2025
// Colour Game

//To do list:
//1. Game difficulty ^
//2. Music ^
//4. Highscore ^

//fonts
PFont SuperTrend;

//GIF function
PImage[] gif;
int numberOfFrames;
int f = 0;

//music gallery
SoundFile backgroundMusic;
SoundFile pressedSuccessed;
SoundFile pressedFailure;

//colour and word index:
int currentColourIndex;
int currentWordIndex;

boolean matches = (currentWordIndex == currentColourIndex);

color[] colour;
String[] words;

//rotate movements:
float rotationMovements = 0;

//points system:
int points;

//colour:
color cyan = #D1FFF4;

//functions for each selection
int x, y;

//matching section:
int match, doesNotMatch;
int matchX, matchY, doesNotMatchX, doesNotMatchY;

//countdown system:
int countDown;

//difficulty
int difficultySystem;

//highscore system:
int highScore;

//mode frameworks
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

int mode;

void setup() {
  size(800, 800);
  SuperTrend = createFont("Super Trend.ttf", 50);

  //GIF Intro + Pause + End
  animatedGIFSetup();

  //timer
  countDown = 600;

  //points system
  points = 0;

  //word + colour index
  colourWordIndex();

  mode = INTRO;
  
  //loading music
  backgroundMusic = new SoundFile(this, "MUSIC.mp3");
  backgroundMusic.play();
  backgroundMusic.loop();
  
  pressedSuccessed = new SoundFile(this, "SUCCESS.wav");
  pressedFailure = new SoundFile(this, "FAILURE.wav");
}

void draw() {
  if ( mode == INTRO ) {
    INTRO();
    println(frameRate);
  } else if ( mode == GAME ) {
    GAME();
  } else {
    GAMEOVER();
  }
}

void INTRO() {
  animatedGIFSetup();
  runGIFDraw();
  introductionTitle(2);
}

void GAME() {
  background(255);

  //Differentiate the two screens
  backgroundSplit();

  //White CountDown:
  fill(255);
  countDownSystem(200, height - 700);

  //Black CountDown:
  fill(0);
  countDownSystem(600, height - 700);

  //match:
  match(200, height / 2);

  //doesNotMatch:
  doesNotMatch(600, height / 2);

  //word + colour:
  wordAndColour(2);

  //calculate points:
  pointSystem();
  
  difficultySystem();
}

void GAMEOVER() {
  animatedGIFSetup();
  runGIFDraw();
  
  //highest score:
  highestScorePlayed();
  
  gameoverTitles();
}


//void PAUSE() {
//  animatedGIFSetup();
//  runGIFDraw();
//  pauseTitles();
//}
