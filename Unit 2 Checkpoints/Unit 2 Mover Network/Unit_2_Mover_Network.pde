//Lawrence Mo
//October 3rd, 2025
//Mover Network

ArrayList<Mover> myMovers;
int numberOfMovers;


void setup() {
  size(800, 800, P2D);

  numberOfMovers = 60;

  //instantiate ArrayList
  myMovers = new ArrayList();

  int i = 0;
  while ( i < numberOfMovers ) {
    myMovers.add(new Mover());
    i++;
  }
}



void draw() {
  background(0);

  int i = 0;
  while ( i < myMovers.size() ) {
    Mover m = myMovers.get(i);
    m.act();
    m.show();
    m.showConnectionLines();
    if (m.alive == false) {
      myMovers.remove(i);
    } else {
      i++;
    }
  }
}
