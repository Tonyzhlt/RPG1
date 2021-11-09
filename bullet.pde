class bullet extends GameObject {
  color bulletC;
  bullet ( PVector v, color c, int s) {
    
    location = new PVector (myHero.location.x, myHero.location. y);
    velocity = v;
    bulletC = c;
    size = s;
    hp = 1;
  }
  
  void show() {
    println("?");
    fill(0);
    noStroke();
    ellipse(location.x,location.y,size,size);
  }
  void act() {
    super.act(); 
  }
  
}
