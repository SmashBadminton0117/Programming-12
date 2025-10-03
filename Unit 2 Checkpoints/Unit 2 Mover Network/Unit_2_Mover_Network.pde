//Lawrence Mo
//October 3rd, 2025
//Mover Network

Mover[] myMovers;
int numberOfMovers;


void setup() {
  size(800, 800, P2D);

  numberOfMovers = 60;
  myMovers = new Mover[numberOfMovers];

  int i = 0;
  while ( i < numberOfMovers ) {
    myMovers[i] = new Mover();
    i++;
  }
}



void draw() {
  background(0);

  int i = 0;
  while ( i < numberOfMovers ) {
    myMovers[i].act();
    myMovers[i].show();
    myMovers[i].showConnectionLines();
    i++;
  }
}
