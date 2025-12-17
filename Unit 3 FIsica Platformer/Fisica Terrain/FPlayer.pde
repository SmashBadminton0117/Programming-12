class FPlayer extends FBox {
  //instance variable
  
  //constructor
  FPlayer(float positionX, float positionY, color c) {
    super(gridSize, gridSize);
    setPosition(positionX, positionY);
    setRotatable(false);
    setFillColor(c);
    setNoStroke();
    
    
  }
  
  //behaviour functions
  void act() {
    playerMovement();
  }
}


void playerMovement() {
  //input variables
  movePlayer(player, aKey, dKey, wKey);
}


//acts as constructor
void movePlayer(FBox p, boolean left, boolean right, boolean jump) {
  
  //set original velocity
  velocityX = 0;
  
  if (left)  velocityX -= 200;
  if (right) velocityX += 200;

  // horizontal movement
  p.setVelocity(velocityX, p.getVelocityY());

  ArrayList<FContact> contacts = p.getContacts();
  if (jump && contacts.size() > 0) p.setVelocity(p.getVelocityX(), -500);

}
