class FGameObject extends FBox {
  //instance variable
  final int L = -1;
  final int R = 1;

  //constructor
  FGameObject() {
    super(gridSize, gridSize);
  }
  
  FGameObject(int valuex, int valuey) {
    super(valuex, valuey);
  }

  //behaviour functions
  void act() {
  }


  boolean isTouching(String n) {
    ArrayList<FContact> contacts = getContacts();
    for (int i = 0; i < contacts.size(); i++) {
      FContact fc =  contacts.get(i);
      if ( fc.contains(n)) {
        return true;
      }
    }
    return false;
  }
}
