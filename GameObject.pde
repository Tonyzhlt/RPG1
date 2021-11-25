

class GameObject {
  int roomX, roomY;
  int hp;
  PVector location;
  PVector velocity;
  int lives;
  int size;
  color c; 


  GameObject() {
    location = new PVector (width/2, height/2);
    velocity = new PVector (0, 0);
    hp=1;
  }
  void show() {
  }

  void act() {
    location. add(velocity);

    if (location.y <50)  location.y=50;
    if (location.y > 800) location.y= 800;
    if (location.x<70) location.x = 70;
    if (location.x>1330) location.x = 1330;
  }
}
