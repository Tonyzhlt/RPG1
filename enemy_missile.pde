class missile extends Enemy {
  int shotTimer, threshold;
    missile(int x, int y) {
    super(10000, 50, x, y, 1300, 70);
    shotTimer = 0;
    threshold = 30;
  }
  void show() {
    noStroke();
    fill(255, 255, 0);
    circle(location.x,location.y, size);
    //image (riden, location.x,location.y);
    fill(0);
    textSize(20);
    text(hp, location.x,location.y + 35);
  }
  
  void act() {
    super.act();

     shotTimer++;
    if (shotTimer > threshold) {
      myObjects.add(new enemybullet2 (location.x, location.y));
      
      shotTimer = 0;
    }
        

  }
}
