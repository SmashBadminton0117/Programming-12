import java.util.ArrayList;

// Lawrence Mo
// October 6th, 2025
// Asteroids

//Colour Palette
color black = #000000;
color white = #FFFFFF;

//Controls of the keys
boolean wKey, aKey, sKey, dKey, spaceKey;

ArrayList<GameObjects> objects;


spaceShip player1;

void setup() {
  size(800, 800, P2D);
  objects = new ArrayList();
  player1 = new spaceShip();
  objects.add(player1);
  objects.add(new asteroid());
  objects.add(new asteroid());
  objects.add(new asteroid());
  objects.add(new asteroid());
}



void draw() {
  background(0);
  println(objects .size());


  int i = 0;
  while ( i < objects.size() ) {
    GameObjects currentObject = objects.get(i);
    currentObject.act();
    currentObject.show();
    if (currentObject.lives == 0) {
      objects.remove(i);
    }
    i++;
  }
}
