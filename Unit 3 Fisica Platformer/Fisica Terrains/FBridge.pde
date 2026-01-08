class FBridge extends FGameObject {

  //constructor
  FBridge(float x, float y, PImage b) {
    super();
    setPosition(x, y);
    setName("bridge");
    attachImage(b);
    setStatic(true);
  }
  
  void act() {
    if (isTouching("player")) {
      setStatic(false);
      setSensor(true);
    }
  }
}
