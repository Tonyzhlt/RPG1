class Gunman extends Enemy {
    int shotTimer, threshold;
    Gunman(int x, int y) {
    super(10000, 50, x, y, 700, 425);
    shotTimer = 0;
    threshold = 10;
    }
  
  void show() {
    noStroke();
    fill(150);
    circle(location.x, location.y, size);
    //image (riden, location.x,location.y);
    fill(0);
    textSize(20);
    text(hp, location.x, location.y - 35);

  }
  
  void act() {
    super.act();
 shotTimer++;
 for (int i = 0; i < 50; i++) {
    if (shotTimer > threshold) {
      myObjects.add(new enemybullet (location.x, location.y));
    
      shotTimer = 0;

    }
    }
  }
}
