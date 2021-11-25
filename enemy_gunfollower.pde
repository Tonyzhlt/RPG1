class gunfollower extends Enemy {
  int shotTimer, threshold;
    gunfollower(int x, int y) {
    super(1000, 50, x, y, 700, 425);
    shotTimer = 0;
    threshold = 10;
  }
  void show() {
    noStroke();
    fill(255, 255, 0);
    circle(location.x, location.y, size);
    //image (riden, location.x,location.y);
    fill(0);
    textSize(20);
    text(hp, location.x, location.y - 35);
  }
  
  void act() {
    super.act();
    velocity = new PVector( myHero.location.x - location.x, myHero.location.y - location.y); 
    velocity.setMag(8);
     shotTimer++;
    if (shotTimer > threshold) {
      myObjects.add(new enemybullet (location.x, location.y));
      
      shotTimer = 0;
    }
      
  
  }
}
  
  
  
  
  
  
