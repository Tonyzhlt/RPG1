class bullet extends GameObject {
  color bulletC;


  bullet ( PVector v, color c, int s) {

    location = new PVector (myHero.location.x, myHero.location. y);
        roomX = myHero.roomX;
    roomY = myHero.roomY;
    velocity = v;
    bulletC = c;
    size = s;
    hp = 1;

  }

  void show() {

 fill(bulletC); 
    noStroke();


    ellipse(location.x, location.y, size, size);
  }
  void act() {
    super.act();
    if (location.y == 50)  hp=0;
    if (location.y == 800) hp=0;
    if (location.x==70) hp=0;
    if (location.x==1330) hp=0;
  }
}
