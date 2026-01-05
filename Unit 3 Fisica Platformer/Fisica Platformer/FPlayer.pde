class FPlayer extends FBox {
  //instance variable
  
  //constructor
  FPlayer(float positionX, float positionY, color c) {
    super(gridSize, gridSize);
    setPosition(positionX, positionY);
    setFillColor(c);
  }
  
  //behaviour functions
  void act() {
    playerMovement();
  }
}


void playerMovement() {
  //input variables
  movePlayer(player, aKey, dKey, wKey);
  movePlayer(player2, leftKey, rightKey, upKey);
}


//acts as constructor
void movePlayer(FBox p, boolean left, boolean right, boolean jump) {
  velocityX = 0;

  if (left)  velocityX -= 500;
  if (right) velocityX += 590;

  // horizontal movement
  p.setVelocity(velocityX, p.getVelocityY());

  ArrayList<FContact> contacts = p.getContacts();
  if (jump && contacts.size() > 0) p.setVelocity(p.getVelocityX(), -500);

  if (spaceKey && bomb == null) {
    bomb = new FBomb();
  }

  if (bomb != null) bomb.act();
  ;
}
