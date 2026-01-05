class FBomb extends FBox {
  //instance variable
  int timer;
  
  //constructor
  FBomb() {
    super(gridSize, gridSize);
    
    //initiate
    timer = 120;
    
    this.setFillColor(orange);
    this.setPosition(player.getX(), player.getY() + gridSize);
    
    world.add(this);
  }
  
  void act() {
    timer();
  }
  
  void timer() {
    timer--;
    if (timer == 0) {
      explode();
      world.remove(this);
      bomb = null;
    }
  }
  
  void explode() {
    for(int i = 0; i < boxes.size(); i++) {
      FBox b = boxes.get(i);
      if (dist(this.getX(), this.getY(), b.getX(), b.getY()) < 200) {
        float vx = b.getX() - this.getX();
        float vy = b.getY() - this.getY();
        b.setVelocity(vx * 5, vy * 5);
        b.setStatic(false);
      }
    }
  }
}
