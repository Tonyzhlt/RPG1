class ElegyForTheEnd extends Weapon {

  ElegyForTheEnd() {
    super(100, 20);
  }
  void shoot() {

    if (sTimer >= fire) {
      for (int i = 0; i < 100; i++) {
        PVector aimVector = new PVector( mouseX-myHero.location.x, mouseY-myHero.location.y);
        aimVector.rotate( random(-PI/7, PI/7));
        aimVector.setMag(bulletSpeed);
        myObjects.add(new bullet(aimVector, yellow, 10));
        sTimer = 0; 
      }
    }
  }
}
